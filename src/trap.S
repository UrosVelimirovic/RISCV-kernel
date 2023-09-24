# 1 "src/trap.S"
# 1 "<built-in>"
# 1 "<command-line>"
# 31 "<command-line>"
# 1 "/usr/riscv64-linux-gnu/include/stdc-predef.h" 1 3
# 32 "<command-line>" 2
# 1 "src/trap.S"

.global interruptVector
.extern _ZN5riscv20handleSupervisorTrapEv
.type _ZN5riscv14supervisorTrapEv, @function
.extern _ZN5riscv21timerInterruptHandlerEv
.type _ZN5riscv21timerInterruptHandlerEv, @function
.extern _ZN5riscv23consoleInterruptHandlerEv
.type _ZN5riscv23consoleInterruptHandlerEv, @function

.align 4

interruptVector:
.org interruptVector + 0*4
j supervisorTrap
.org interruptVector + 1*4
j timerTrap
.org interruptVector + 9*4
j consoleTrap

supervisorTrap:
    addi sp, sp, -256
    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8 (sp)
    .endr

    call _ZN5riscv20handleSupervisorTrapEv

    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8 (sp)
    .endr
    addi sp, sp, 256

    sret

timerTrap:
    addi sp, sp, -256
    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8 (sp)
    .endr

    call _ZN5riscv21timerInterruptHandlerEv

    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8 (sp)
    .endr
    addi sp, sp, 256

    sret

consoleTrap:
    addi sp, sp, -256
    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8 (sp)
    .endr

    call _ZN5riscv23consoleInterruptHandlerEv

    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8 (sp)
    .endr
    addi sp, sp, 256

    sret
