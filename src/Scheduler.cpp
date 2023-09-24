//
// Created by os on 6/19/23.
//

#include "../h/Scheduler.hpp"
#include "../h/list.hpp"
List Scheduler::readyThreadQueue;

TCB* Scheduler::get(){
    return readyThreadQueue.removeFirst();
}

void Scheduler::put(TCB* tcb){
    readyThreadQueue.addLast(tcb);
}