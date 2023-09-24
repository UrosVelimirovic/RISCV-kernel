//
// Created by os on 5/21/23.
//


#include "../h/riscv.hpp"
#include "../lib/console.h"
#include "../h/ConsoleKernel.hpp"
#include "../h/MemoryAllocator.hpp"
void riscv::handleSupervisorTrap() {
    volatile uint64 sepc = riscv::r_sepc();
    volatile uint64 sstatus = riscv::r_sstatus();
    volatile uint64 scause = riscv::r_scause();

    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){
        sepc+=4;

        volatile uint64 argument[5];

        // citanje a0 sa steka (broj funkcije)
        __asm__ volatile("ld %0, 10*8(fp)":"=r" (argument[0]));
        // citanje a1 sa steka
        __asm__ volatile("ld %0, 11*8(fp)":"=r" (argument[1]));
        // citanje a2 sa steka
        __asm__ volatile("ld %0, 12*8(fp)":"=r" (argument[2]));
        // citanje a3 sa steka
        __asm__ volatile("ld %0, 13*8(fp)":"=r" (argument[3]));
        // citanje a4 sa steka
        __asm__ volatile("ld %0, 14*8(fp)":"=r" (argument[4]));

        volatile uint64 return_val;

        switch(argument[0]){
            case 0x01: // mem_alloc
                return_val = (uint64)MemoryAllocator::mem_alloc((size_t)argument[1]);
                //return_val = (uint64)__mem_alloc((size_t)argument[1]);
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x02: // mem_free
                return_val = (uint64)MemoryAllocator::mem_free((void*)argument[1]);
                //return_val = (uint64)__mem_free((void*)argument[1]);
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x11: // thread_create
                // Calling the function createThread which will allocate memory for a TCB and return it.
                // Inside of the TCB constructor, memory will be allocated for stack and the thread(TCB) will
                // be put inside of a scheduler
                // argument[1] is TCB** because that's how system call thread_create is defined.
                *((uint64*)argument[1]) = (uint64)TCB::createThread((TCB::Body) argument[2], (TCB::Argument) argument[3], (uint8*) argument[4]);

                if (argument[1] == 0)
                    return_val = -1;
                else return_val = 0;
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x12: // thread_exit
                TCB::exit();
                return_val = 0;
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x13: // thread_dispatch
                TCB::timeSliceCounter = 0;
                TCB::dispatch();
                break;
            case 0x14: // thread_join
                TCB::join((TCB*)argument[1]);
                break;
            case 0x21: // sem_open
                return_val = *(uint64*)argument[1] = (uint64)(new _sem((int)argument[2]));
                return_val = (return_val == 0)? -1: 0;
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x22: // sem_close
                return_val = ((_sem*)argument[1])->close();
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x23: // sem_wait
                return_val = ((_sem*)argument[1])->wait();
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x24: // sem_signal
                return_val = ((_sem*)argument[1])->signal();
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x31: // time_sleep
                return_val = (uint64)sleeping::put(TCB::running, (int)argument[1]);
                TCB::timeSliceCounter = 0; // we have to set it to 0 because we are dispatching without interrupt.
                TCB::dispatch();
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x41: // getc
                return_val = (uint64)ConsoleKernel::getc();
                //return_val = __getc();
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
                break;
            case 0x42: // putc
                //__putc((char)argument[1]);
                ConsoleKernel::putc((char)argument[1]);
                break;
            default:  // wrong function code
                //__putc('c')
                ConsoleKernel::putc('c');
                break;
        }
    }
    else { // unresolved trap number
        //__putc('e');
        ConsoleKernel::putc('e');
        // printInteger(scause);
    }
    w_sepc(sepc);
    w_sstatus(sstatus);
}
void riscv::timerInterruptHandler(){// timer
    volatile uint64 sepc = riscv::r_sepc();
    volatile uint64 sstatus = riscv::r_sstatus();

    TCB::timeSliceCounter++;
    sleeping::timeDecrease();
    if(TCB::running!=nullptr) {
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
        }
    }
    mc_sip(SIP_SSIP); // signal da je prekid obradjen
    w_sepc(sepc);
    w_sstatus(sstatus);
}

void riscv::consoleInterruptHandler() { // Console
    volatile uint64 sepc = riscv::r_sepc();
    volatile uint64 sstatus = riscv::r_sstatus();
    int deviceNum = plic_claim();
    // Clears ninth bit stating that the hardware interrupt has been processed
    __asm__ volatile("csrc sip, %0" ::"r"(1UL<<9));
    sem_signal(ConsoleKernel::get()->getSem);
    sem_signal(ConsoleKernel::get()->putSem);
    plic_complete(deviceNum);
    //console_handler();
//    mc_sip(SIP_SSIP); // signal da je prekid obradjen
    w_sepc(sepc);
    w_sstatus(sstatus);
}

// Ensure that the user mode doesn't have access to the system registers
// This function must not be inline because we must ensure that ra register changes.
// That's why it's defined in cpp.
void riscv::popSppSpie() {
    ms_sstatus(SSTATUS_SPIE); // Setujemo bit za dozvoljavanje prekida na aktivno

    // When we call popSppSpie, ra register has the return pc value. We write it in sepc
    // so that that's the place where we land after we call sret at the very end of popSppSpie
    __asm__ volatile ("csrw sepc, ra");

    if(TCB::running->getSystemAccessFlag())
        __asm__ volatile ("csrs sstatus, %0"::"r"(0x100)); // Dajemo sistemske privilegije
    else
        __asm__ volatile ("csrc sstatus, %0"::"r"(0x100)); // Dajemo user privilegije

    __asm__ volatile("sret");
}


