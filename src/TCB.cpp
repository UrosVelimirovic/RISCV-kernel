//
// Created by os on 6/20/23.
//

#include "../h/TCB.hpp"
#include "../h/riscv.hpp"


TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB* TCB::createThread(TCB::Body body, TCB::Argument argument, uint8* st) {
    return new TCB(body, argument, TIME_SLICE, st);
}

void TCB::yield(){
    thread_dispatch();
}

void TCB::dispatch(){
     // The nullptr ifs in the code below are used in case the user forgot to add
     // the main thread in the main function. Something like that is rare, but
     // in case it happens this mechanism will prevent the total system crash.
     // Such a scenario can also occur if all threads somehow get blocked and there
     // is no idle thread in the system.
     TCB* old = running;
     if(old != nullptr) {
         if (old->isRunning()) {
             Scheduler::put(old);
         }
     }
     running = Scheduler::get();

     //if(running != nullptr)
        contextSwitch(&old->context, &running->context);
}

void TCB::exit(){
    // Set its flag to because it's done
    running->setFinished(true);

    // Put in scheduler all the threads that were waiting for this one to end. (join function)
    for(TCB* temp = running->joinWaitList.removeFirst(); temp; temp = running->joinWaitList.removeFirst()) {
        temp->setSleeping(false);
        Scheduler::put(temp);
    }

    // Dispatch at the very end
    yield();
}

void TCB::join(TCB* thread){
    // Finished check
    if(thread->isFinished()) return;

    // Running thread sleeps and will be awaken when TCB* thread argument finishes.
    running->setSleeping(true);
    thread->joinWaitList.addLast(running); // Current thread added to the wait list
    yield(); // dispatch
}

void TCB::threadWrapper(){
    // Kada se uradi dispatch, iz sistemskog moda ili nekog drugog se skace
    // na threadWrapper nekog threada, ako se on prvi put startuje. To ce
    // dovesti do toga da sistemske ili user privilegije ostanu kao stare (thread odakle se skocilo)
    // iako mi vise nismo tamo. popSppSpie obezbedjuje da se te privilegije promene i da budu onakve
    // kakve treba da budu za ovaj thread koji sada startuje.
    riscv::popSppSpie();

    // Start the thread (Glavni poziv funkcije koju zapravo obavlja thread)
    running->body(running->argument);

    // Call the exit of the thread at the end
    exit();
}