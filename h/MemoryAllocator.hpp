//
// Created by os on 4/16/23.
//

#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator{
public:
    struct free_memory{
        free_memory* next;
        size_t size; //size is number of bytes
    };
    MemoryAllocator() = delete;
    MemoryAllocator(const MemoryAllocator& obj) = delete;
    MemoryAllocator(const MemoryAllocator&& obj) = delete;

    static void* mem_alloc(size_t);
    static int mem_free(void*);
private:
    static bool stateZero;
    static free_memory* head;
    static size_t prefixSize;
    /* createFreeMemoryBlock is used to put a descriptor
     * in the beginning of a free segment (it links it to the next one)
    */

};
#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
