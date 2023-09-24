//
// Created by os on 6/26/23.
//

#ifndef PROJECT_BASE_V1_1_CONSOLEKERNEL_HPP
#define PROJECT_BASE_V1_1_CONSOLEKERNEL_HPP
#include "../lib/hw.h"
#include "../h/BufferKernel.hpp"
#include "syscall_c.hpp"


class ConsoleKernel{
private:
    static ConsoleKernel* instance;
    ConsoleKernel(){
        sem_open(&getSem,0);
        sem_open(&putSem,0);
    }
public:
    BufferKernel input; // Console -> input buffer
    BufferKernel output; // Output buffer -> console

    // These semaphores are used to prevent busy wait
    sem_t getSem;
    sem_t putSem;

    // Functions of threads that will work with hardware
    static void getCharKernel(void*);
    static void putCharKernel(void*);

    // Functions of system calls
    static void putc(char);
    static char getc();

    // Singleton mechanism
    static ConsoleKernel* get(){
        if(!instance) instance = new ConsoleKernel();
        return instance;
    }

    ~ConsoleKernel(){
        sem_close(getSem);
        sem_close(putSem);
    }
};
#endif //PROJECT_BASE_V1_1_CONSOLEKERNEL_HPP
