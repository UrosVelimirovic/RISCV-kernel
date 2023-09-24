//
// Created by os on 6/26/23.
//

#ifndef PROJECT_BASE_V1_1_MYBUFFER_HPP
#define PROJECT_BASE_V1_1_MYBUFFER_HPP
#include "syscall_c.hpp"

class BufferKernel{
private:
    int head;
    int tail;
    int size;
    static const int maxSize = 100;
    char buffer[maxSize];

    // mutexSem is used to prevent multiple
    // threads from accessing the same getc and putc functions.
    // This won't happen because the system is in the privileged mode
    // in the only instance where buffer is used which is for Console threads.
    // However, putting this semaphore in a buffer is essential if it gets used
    // in user mode where asynchronous dispatches are possible.
    sem_t mutexSem;

    // spacePutAv and charGetAv are used to prevent invalid locations
    // when operating with buffer in putc and getc
    sem_t spacePutAv;
    sem_t charGetAv;
public:
    BufferKernel(): head(0), tail(0), size(0){
        sem_open(&mutexSem, 1);
        sem_open(&spacePutAv, maxSize);
        sem_open(&charGetAv, 0);
    }

    char get();
    void put(char putChar);

};
#endif //PROJECT_BASE_V1_1_MYBUFFER_HPP
