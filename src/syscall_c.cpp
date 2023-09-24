//
// Created by os on 6/19/23.
//

#include "../h/syscall_c.hpp"

void* mem_alloc(size_t size){
    uchar entry = 0x01;
    size += sizeof(uint64);
    size = size/MEM_BLOCK_SIZE + size%MEM_BLOCK_SIZE;
    __asm__ volatile ("mv a1, %0": : "r"(size));
    __asm__ volatile ("mv a0, %0": : "r"(entry));


    __asm__ volatile("ecall");

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return (void*)ret;
}

int mem_free (void* ptr){
    uchar entry = 0x02;
    __asm__ volatile ("mv a1, %0": : "r"((uint64)ptr));
    __asm__ volatile ("mv a0, %0": : "r"(entry));


    __asm__ volatile("ecall");

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return (int)ret;
}

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    uchar entry = 0x11;
    uint8* st = nullptr;
    if(start_routine != nullptr)
         st = new uint8[DEFAULT_STACK_SIZE];
    __asm__ volatile ("mv a4, %0": : "r"((uint64)st));
    __asm__ volatile ("mv a3, %0": : "r"((uint64)arg));
    __asm__ volatile ("mv a2, %0": : "r"((uint64)start_routine));
    __asm__ volatile ("mv a1, %0": : "r"((uint64)handle));
    __asm__ volatile ("mv a0, %0": : "r"(entry));

    __asm__ volatile("ecall");

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return (int)ret;

}

int thread_exit(){
    uchar entry = 0x12;
    __asm__ volatile ("mv a0, %0": : "r"(entry));

    __asm__ volatile("ecall");

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return (int)ret;
}

void thread_dispatch(){
    uchar entry = 0x13;
    __asm__ volatile ("mv a0, %0": : "r"(entry));
    __asm__ volatile("ecall");
}

void thread_join(thread_t handle){
    uchar entry = 0x14;
    __asm__ volatile ("mv a1, %0": : "r"((uint64)handle));
    __asm__ volatile ("mv a0, %0": : "r"(entry));


    __asm__ volatile("ecall");
}

int sem_open(sem_t* handle, unsigned init){
    uchar entry = 0x21;
    __asm__ volatile ("mv a2, %0": : "r"((uint64)init));
    __asm__ volatile ("mv a1, %0": : "r"((uint64)handle));

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    __asm__ volatile("ecall");

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return (int)ret;
}

int sem_close(sem_t handle){
    uchar entry = 0x22;

    __asm__ volatile ("mv a1, %0": : "r"((uint64)handle));

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    __asm__ volatile("ecall");

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return (int)ret;
}

int sem_wait(sem_t id) {
    uchar entry = 0x23;

    __asm__ volatile ("mv a1, %0": : "r"((uint64) id));

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    __asm__ volatile("ecall");

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return (int) ret;

}

int sem_signal(sem_t id) {
    uchar entry = 0x24;

    __asm__ volatile ("mv a1, %0": : "r"((uint64) id));

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    __asm__ volatile("ecall");

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return (int) ret;

}

int time_sleep (time_t tm){
    uchar entry = 0x31;

    __asm__ volatile ("mv a1, %0": : "r"((uint64)tm));

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    __asm__ volatile("ecall");

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return (int) ret;
}

char getc (){
    uchar entry = 0x41;
    __asm__ volatile ("mv a0, %0": : "r"(entry));
    __asm__ volatile("ecall");

    volatile char ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    return ret;
}

void putc(char c){
    uchar entry = 0x42;

    __asm__ volatile ("mv a1, %0": : "r"((uint64)c));

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    __asm__ volatile("ecall");

}