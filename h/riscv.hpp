//
// Created by os on 5/21/23.
//

#ifndef PROJECT_BASE_V1_1_RISCV_HPP
#define PROJECT_BASE_V1_1_RISCV_HPP

#include "../lib/hw.h"
#include "../lib/mem.h"
#include "TCB.hpp"
#include "PrintKernel.hpp"
#include "_sem.hpp"
#include "sleeping.hpp"
//registers: scause, spec, sstatus, stvec, sip, sie
//Ideja preuzeta sa online vezbi
class riscv{
private:
    static void handleSupervisorTrap();
    static void timerInterruptHandler();
    static void consoleInterruptHandler();
public:

    // pop sstatus.spp and sstatus.spie bits
    // has to be a non-inline function
    static void popSppSpie();

    // skok u prekidnu rutinu
    static void supervisorTrap();

    //read scause register
    static uint64 r_scause(){
        uint64 volatile scause;
        __asm__ volatile("csrr %[scause], scause" : [scause] "=r"(scause));
        return scause;
    }
    //write scause register
    static void w_scause(uint64 scause){
        __asm__ volatile("csrw scause, %[scause]": : [scause] "r"(scause));
    }

    //read spec register
    static uint64 r_sepc(){
        uint64 volatile sepc;
        __asm__ volatile("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
        return sepc;
    }
    //write spec register
    static void w_sepc(uint64 sepc){
        __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    }

    enum BitMaskSstatus
    {
        SSTATUS_SIE = (1 << 1),
        SSTATUS_SPIE = (1 << 5),
        SSTATUS_SPP = (1 << 8),
    };

    enum BitMaskSip
    {
        SIP_SSIP = (1 << 1),
        SIP_STIP = (1 << 5),
        SIP_SEIP = (1 << 9),
    };
    //read sstatus register
    static uint64 r_sstatus(){
        uint64 volatile sstatus;
        __asm__ volatile("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
        return sstatus;
    }
    //write sstatus register
    static void w_sstatus(uint64 sstatus){
        __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r"(sstatus));
    }

    //read stvec register
    static uint64 r_stvec(){
        uint64 volatile stvec;
        __asm__ volatile("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
        return stvec;
    }
    //write stvec register
    static void w_stvec(uint64 stvec){
        __asm__ volatile("csrw stvec, %[stvec]": : [stvec] "r"(stvec));
    }

    //read sip register
    static uint64 r_sip(){
        uint64 volatile sip;
        __asm__ volatile("csrr %[sip], sip" : [sip] "=r"(sip));
        return sip;
    }

    //write sip register
    static void w_sip(uint64 sip){
        __asm__ volatile("csrw sip, %[sip]": : [sip] "r"(sip));
    }

    //read sie register
    static uint64 r_sie(){
        uint64 volatile sie;
        __asm__ volatile("csrr %[sie], sie" : [sie] "=r"(sie));
        return sie;
    }
    //write sie register
    static void w_sie(uint64 sie) {
        __asm__ volatile("csrw sie, %[sie]": : [sie] "r"(sie));
    }

    //read scratch register
    static uint64 r_scratch(){
        uint64 volatile scratch;
        __asm__ volatile("csrr %[scratch], scratch" : [scratch] "=r"(scratch));
        return scratch;
    }

    //write scratch register
    static void w_scratch(uint64 scratch) {
        __asm__ volatile("csrw scratch, %[scratch]": : [scratch] "r"(scratch));
    }

    static void ms_sstatus(uint64 mask) { // mask set sstatus
        __asm__ volatile("csrs sstatus, %[mask]"::[mask]"r"(mask));
    }
    static void mc_sstatus(uint64 mask){ // mask clear sstatus
        __asm__ volatile("csrc sip, %[mask]": : [mask]"r"(mask));
    }
    static void ms_sip(uint64 mask){ // mask set sip
        __asm__ volatile("csrs sstatus, %[mask]"::[mask]"r"(mask));
    }
    static void mc_sip(uint64 mask){ // mask clear sip
        __asm__ volatile("csrc sip, %[mask]": : [mask]"r"(mask));
    }

};


#endif //PROJECT_BASE_V1_1_RISCV_HPP
