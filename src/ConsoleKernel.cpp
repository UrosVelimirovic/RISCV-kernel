//
// Created by os on 6/26/23.
//

#include "../h/ConsoleKernel.hpp"
#include "../h/TCB.hpp"

ConsoleKernel* ConsoleKernel::instance = nullptr;

// Thread function for getting the character from the console and putting it in the input buffer.
// Console -> input buffer
void ConsoleKernel::getCharKernel(void* notUsed){
    while(!(TCB::running->isFinished())){
        sem_wait(ConsoleKernel::get()->getSem);
        while (  *((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT )
            ConsoleKernel::get()->input.put(*((char*)CONSOLE_RX_DATA));
    }
}

// Thread function for getting the character from the output buffer and putting it on the console.
// Output buffer -> console
void ConsoleKernel::putCharKernel(void* notUsed){
    while(!(TCB::running->isFinished())){
        sem_wait(ConsoleKernel::get()->putSem);
        char c;
        while ( *((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT ) {
            c = ConsoleKernel::get()->output.get();
//            if (c != '\x1b') {
//                if (c == '\r') c = '\n';
                *((char *) CONSOLE_TX_DATA) = c;
//            }
        }
    }
}

// Get a character from the input buffer
char ConsoleKernel::getc(){
    return ConsoleKernel::get()->input.get();
}

// Put a character in the output buffer
void ConsoleKernel::putc(char putchar){
    ConsoleKernel::get()->output.put(putchar);
}