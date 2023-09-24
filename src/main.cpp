//
// Created by os on 4/16/23.
//


#include "../lib/hw.h"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/riscv.hpp"

void idleThread (void*){
    while(true)
        thread_dispatch();
}

void userMain();
void userMainWrapper(void*){
    userMain();
}

extern "C" void interruptVector();

int main(){
    // Setting the interrupt subroutine.
    riscv::w_stvec((uint64) &interruptVector|1UL);
    // Allowing interrupts
    riscv::ms_sstatus(riscv::SSTATUS_SIE);
    TCB* thread0; // main thread
    // Because the body is nullptr, this thread will not be put in the scheduler in the constructor.
    thread_create(&thread0, nullptr, nullptr);
    TCB::running = thread0;
    TCB::running->setSystemAccessFlag();
    TCB* thread1;
    thread_create(&thread1, &ConsoleKernel::putCharKernel,0);
    TCB* thread2;
    thread_create(&thread2,&ConsoleKernel::getCharKernel,0);
    if(thread1); // prevents thread1 not used error
    if(thread2); // prevents thread2 not used error
    // idle thread
    thread_t thread3;
    thread_create(&thread3,&idleThread,nullptr);
    if(thread3); // prevents thread3 not used error
    // userMain thread
    thread_t thread4;
    thread_create(&thread4,&userMainWrapper,nullptr);
    thread_join(thread4);

    delete thread0;
    delete thread1;
    delete thread2;
    delete thread3;
    delete thread4;

    return 0;
}