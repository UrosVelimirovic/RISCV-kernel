////
//// Created by os on 6/19/23.
////

#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/_sem.hpp"

Thread::Thread(void (*body)(void *), void *arg) {
    this->body = body;
    this->arg = arg;
    this->myHandle = nullptr;
}

void Thread::runWrapper(void* thrd){
    ((Thread*)thrd)->run();
}

Thread::Thread(){
    this->body = &runWrapper;
    this->arg = this;
    this->myHandle = nullptr;
}

int Thread::start() {
    // myHandle is a thread_t type which is a TCB*, we give an adress of myHandle because
    // the system call thread_create requires TCB** as its first argument.
    return thread_create(&(this->myHandle), this->body,this->arg);
}

void Thread::join(){
    thread_join(this->myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t t) {
    return time_sleep(t);
}


Thread::~Thread(){
    if(this->myHandle)
        delete myHandle;
}

PeriodicThread::PeriodicThread(time_t period) : Thread(&periodicActivationWrapper,this),
                                                period(period), state(RUNNING){}

void PeriodicThread::periodicActivationWrapper(void * thrd) {
    // After the thread gets terminated, it will simply leave periodicActivationWrapper,
    // and then automatically will leave the run function which will return into tcb threadWrapper
    // threadWrapper itself will finish the thread making sure it doesn't get back into the scheduler.
    while(   ((PeriodicThread*)thrd)->state == RUNNING  ){
        ((PeriodicThread*)thrd)->periodicActivation();
        time_sleep(((PeriodicThread*)thrd)->period);
    }
}

void PeriodicThread::terminate() {
    this->state = TERMINATED;
}

Semaphore::Semaphore(unsigned int init) {
    sem_open(&myHandle,init);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
    delete this->myHandle;
}

char Console::getc() {
    return ::getc();
}

void Console::putc(char c) {
    ::putc(c);
}

