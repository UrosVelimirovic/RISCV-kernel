//
// Created by os on 6/20/23.
//

#ifndef PROJECT_BASE_V1_1_TCB_HPP
#define PROJECT_BASE_V1_1_TCB_HPP

#include "../lib/hw.h"
#include "syscall_c.hpp"
#include "../h/Scheduler.hpp"
#include "list.hpp"

// ideja za klasu preuzeta sa vezbi
class TCB {
public:
    TCB* next;
    enum State{FINISHED, RUNNING, BLOCKED, SLEEPING};
    using Body = void(*)(void*);
    using Argument = void*;

    static TCB* createThread(Body body, Argument argument, uint8* st);

    // Finished
    bool isFinished() const{ return this->state == FINISHED; }
    void setFinished(bool finished){ this->state = finished? FINISHED:RUNNING; }

    // Blocked
    bool isBlocked() const { return this->state == BLOCKED; }
    void setBlocked(bool blocked) { this->state = blocked?BLOCKED:RUNNING; }

    // Sleeping
    bool isSleeping() const { return this->state == SLEEPING;}
    void setSleeping(bool sleeping) { this->state = sleeping?SLEEPING:RUNNING; }

    // Running
    bool isRunning(){ return this->state == RUNNING;}

    // Sleep time
    void setSleepTime(int time1) { this->sleep_time = time1; }
    int getSleepTime() { return this->sleep_time; }

    // System access
    void setSystemAccessFlag(){ this->systemAccessFlag = true; }
    bool getSystemAccessFlag(){ return this->systemAccessFlag; }

    uint64 getTimeSlice() const{
        return t_slice;
    }

    uint8* getStack() const{
        return this->stack;
    }

    void* getArgument(){
        return argument;
    }

    static void yield();

    static void join(TCB* thread);

    static void exit();

    static TCB* running;

    ~TCB(){
        if(stack)
            delete[] stack;
    }

private:
    struct Context{
        uint64 ra;
        uint64 sp;
    };

    Body body;
    Argument argument;
    uint8* stack;
    uint64 t_slice;
    State state;
    Context context;
    int sleep_time;
    List joinWaitList;
    bool systemAccessFlag;

    TCB(Body body, Argument argument, uint64 timesl, uint8* st) :
        next(0),
        body(body),
        argument(argument),
        stack(body != nullptr ? st : nullptr),
        t_slice(timesl),
        state(RUNNING),
        context({(uint64) &threadWrapper,
                 stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
                }),
        systemAccessFlag(false)
    {
        if(body) Scheduler::put(this);
    }


    static void contextSwitch(Context *oldContext, Context* runningContext);

    static void threadWrapper();

    static void dispatch();

    static uint64 constexpr TIME_SLICE = DEFAULT_TIME_SLICE;

    static uint64 constexpr STACK_SIZE = DEFAULT_STACK_SIZE;

    static uint64 timeSliceCounter;

    friend class riscv;
};

//registersUtil.S

//.global _ZN5riscv13pushRegistersEv
//.type _ZN5riscv13pushRegistersEv, @function
//        _ZN5riscv13pushRegistersEv:
//addi sp, sp, -256
//.irp index,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
//sd x\index, \index * 8 (sp)
//.endr
//        ret
//
//.global _ZN5riscv12popRegistersEv
//.type _ZN5riscv12popRegistersEv, @function
//        _ZN5riscv12popRegistersEv:
//.irp index,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
//ld x\index, \index * 8 (sp)
//.endr
//        addi sp, sp, 256
//ret
#endif //PROJECT_BASE_V1_1_TCB_HPP
