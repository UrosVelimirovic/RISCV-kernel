//
// Created by os on 6/19/23.
//

//ideja preuzeta sa online vezbi
#include "../h/PrintKernel.hpp"
#include "../h/riscv.hpp"
//#include "../lib/console.h"
void kernelPrintString(char const *string)
{
//    uint64 sstatus = riscv::r_sstatus();
//    riscv::mc_sstatus(riscv::SSTATUS_SIE);
    while (*string != '\0')
    {
        putc(*string);
        string++;
    }
//    riscv::ms_sstatus(sstatus & riscv::SSTATUS_SIE? riscv::SSTATUS_SIE:0);
}

void kernelPrintInteger(uint64 integer)
{
//    uint64 sstatus = riscv::r_sstatus();
//    riscv::mc_sstatus(riscv::SSTATUS_SIE);
    static char digits[] = "0123456789";
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if (integer < 0)
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    }

    i = 0;
    do
    {
        buf[i++] = digits[x % 10];
    } while ((x /= 10) != 0);
    if (neg)
        buf[i++] = '-';

    while (--i >= 0) { putc(buf[i]); }
//    riscv::ms_sstatus(sstatus & riscv::SSTATUS_SIE? riscv::SSTATUS_SIE:0);
}
