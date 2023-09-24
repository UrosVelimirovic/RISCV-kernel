//
// Created by os on 4/16/23.
//

#include "../h/MemoryAllocator.hpp"

typedef MemoryAllocator::free_memory free_memory;
/*
 * uint8* is a byte pointer,
 * size_t is a 64bit value used to present how many bytes
 */
free_memory* MemoryAllocator::head = (free_memory*)HEAP_START_ADDR;// Initializes to 0
bool MemoryAllocator::stateZero = true;
size_t MemoryAllocator::prefixSize = (size_t)sizeof(size_t);

void* MemoryAllocator::mem_alloc(size_t size){

    if(stateZero){
        head = (free_memory*)HEAP_START_ADDR; // Added initialization because of first value 0
        head->size = ((uint8*)HEAP_END_ADDR - (uint8*)HEAP_START_ADDR)/MEM_BLOCK_SIZE;
        head->next = nullptr;
        stateZero = false;
    }

    //typedef uint64 size_t;
    uint8* ret = nullptr;
//    size += prefixSize;
//    size = size/MEM_BLOCK_SIZE + size%MEM_BLOCK_SIZE;

    free_memory* prev = nullptr;
    for(free_memory* temp = head; temp; temp = temp->next){
        if(temp->size >= size){

            //the return adress
            ret = (uint8*)temp;

            //Check if the whole free block has to be allocated
            if(temp->size == size) {
                if(prev) prev->next = temp->next;
                else head = temp->next;
            }
            else{
                temp = (free_memory*)((uint8*)temp + size*MEM_BLOCK_SIZE);
                temp->size -= size;
                if(prev) prev->next = temp;
                else head = temp;
            }
            //Setting the block size on the exact location
            *((uint64*)ret) = size;
            ret += prefixSize;
            break;
        }
        prev = temp;
    }
    return (void*)ret;

}

int MemoryAllocator::mem_free(void* fragment) {
    if(fragment == nullptr) return -1;
    uint8* fragToBeFreed = (uint8*)fragment - prefixSize;

    // check if the fragment intersects the free memory
    free_memory* temp = ((void*)head > fragToBeFreed)? nullptr: head;
    free_memory* prev = nullptr;
    for(; temp && temp<=(free_memory*)fragToBeFreed; temp = temp->next) {
        if ((uint8 *) temp + temp->size*MEM_BLOCK_SIZE > (uint8*)fragToBeFreed)
            return -1; // error, fragment to be freed intersects a free memory block
        prev = temp;
    }

    free_memory* newFreeDesc = (free_memory*)fragToBeFreed;
    newFreeDesc->size = *((uint64*)fragToBeFreed);

    if(prev) {
        newFreeDesc->next = prev->next? prev->next : nullptr;
        prev->next = newFreeDesc;
        //Try to connect with the free_segment after
        if (newFreeDesc->next && ((uint8 *) newFreeDesc + newFreeDesc->size*MEM_BLOCK_SIZE == (uint8 *) newFreeDesc->next)) {
            newFreeDesc->size += newFreeDesc->next->size;
            newFreeDesc->next = newFreeDesc->next->next? newFreeDesc->next->next : nullptr;
        }
        //Try to connect with the free_segment before
        if((uint8*)prev + prev->size*MEM_BLOCK_SIZE == (uint8*)newFreeDesc) {
            prev->size += newFreeDesc->size;
            prev->next = newFreeDesc->next;
        }
    }
    //Head is after the busy fragment
    if(!prev){
        newFreeDesc->next = head;
        //Try to connect with the free_segment after (it is head)
        if ((uint8*)newFreeDesc + newFreeDesc->size*MEM_BLOCK_SIZE == (uint8 *)head) {
            newFreeDesc->size += head->size;
            newFreeDesc->next = head->next;
        }
        head = newFreeDesc;
    }
    return 0;

}

