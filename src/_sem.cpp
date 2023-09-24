//
// Created by os on 6/23/23.
//

#include "../h/_sem.hpp"

int _sem::wait() {
    if(closed) return -1;
    if(--val<0) block();
    return 0;
}

int _sem::signal() {
    if(closed) return -1;
    if(++val <= 0) unblock();
    return 0;
}

void _sem::block() {
    // Adding the running thread to a blocked list by a FIFO mechanism
    this->blocked.addLast(TCB::running);

    // Blocking
    TCB::running->setBlocked(true);
    TCB::yield();
}

void _sem::unblock(){
    // Getting a blocked thread by a FIFO mechanism
    TCB* temp = this->blocked.removeFirst();

    // Checking if unblock was called on an empty blocked list.
    if (temp == nullptr) return;

    // Unblocking
    temp->setBlocked(false);
    Scheduler::put(temp);
}

int _sem::close(){
    // We assume that closing a semaphore that has already been closed is not an error
    // if (this->closed) return -1;

    this->closed = true;

    // Unblocking all the threads blocked on this semaphore
    TCB* temp;
    while((temp = this->blocked.removeFirst()) != nullptr){
        temp->setBlocked(false);
        Scheduler::put(temp);
    }
    return 0;
}

