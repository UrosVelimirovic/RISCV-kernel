//
// Created by os on 6/26/23.
//

#include "../h/BufferKernel.hpp"


char BufferKernel::get(){

    sem_wait(charGetAv);
    sem_wait(mutexSem);
    char ret = buffer[head];
    head++;
    head %= maxSize;
    size--;

    sem_signal(mutexSem);
    sem_signal(spacePutAv);

    return ret;
}

void BufferKernel::put(char putChar){

    sem_wait(spacePutAv);
    sem_wait(mutexSem);
    buffer[tail] = putChar;
    tail++;
    tail %= maxSize;
    size++;
    sem_signal(mutexSem);
    sem_signal(charGetAv);
}