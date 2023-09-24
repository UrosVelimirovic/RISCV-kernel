//
// Created by os on 6/19/23.
//

#ifndef PROJECT_BASE_V1_1_SYSCALL_CPP_HPP
#define PROJECT_BASE_V1_1_SYSCALL_CPP_HPP

#include "syscall_c.hpp"


class Thread {
public:
        Thread (void (*body)(void*), void* arg);
        virtual ~Thread ();

        int start ();

        void join();

        static void dispatch ();
        static int sleep (time_t);

protected:
        Thread ();
        virtual void run () {}

private:
        thread_t myHandle;
        void (*body)(void*); void* arg;
        static void runWrapper(void* thread);

};

class Semaphore {
public:
        Semaphore (unsigned init = 1);
        virtual ~Semaphore ();

        int wait ();
        int signal ();

private:
        sem_t myHandle;
};

class PeriodicThread : public Thread {
public:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}

private:
    time_t period;
    enum State{RUNNING,TERMINATED};
    State state;
    static void periodicActivationWrapper(void*);
};

class Console {
public:
        static char getc ();
        static void putc (char);
};
#endif //PROJECT_BASE_V1_1_SYSCALL_CPP_HPP
