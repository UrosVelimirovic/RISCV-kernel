
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000c117          	auipc	sp,0xc
    80000004:	8e013103          	ld	sp,-1824(sp) # 8000b8e0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	51d060ef          	jal	ra,80006d38 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <interruptVector>:

.align 4

interruptVector:
.org interruptVector + 0*4
j supervisorTrap
    80001000:	0280006f          	j	80001028 <supervisorTrap>
.org interruptVector + 1*4
j timerTrap
    80001004:	1340006f          	j	80001138 <timerTrap>
	...
.org interruptVector + 9*4
j consoleTrap
    80001024:	2240006f          	j	80001248 <consoleTrap>

0000000080001028 <supervisorTrap>:

supervisorTrap:
    addi sp, sp, -256
    80001028:	f0010113          	addi	sp,sp,-256
    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8 (sp)
    .endr
    8000102c:	00013023          	sd	zero,0(sp)
    80001030:	00113423          	sd	ra,8(sp)
    80001034:	00213823          	sd	sp,16(sp)
    80001038:	00313c23          	sd	gp,24(sp)
    8000103c:	02413023          	sd	tp,32(sp)
    80001040:	02513423          	sd	t0,40(sp)
    80001044:	02613823          	sd	t1,48(sp)
    80001048:	02713c23          	sd	t2,56(sp)
    8000104c:	04813023          	sd	s0,64(sp)
    80001050:	04913423          	sd	s1,72(sp)
    80001054:	04a13823          	sd	a0,80(sp)
    80001058:	04b13c23          	sd	a1,88(sp)
    8000105c:	06c13023          	sd	a2,96(sp)
    80001060:	06d13423          	sd	a3,104(sp)
    80001064:	06e13823          	sd	a4,112(sp)
    80001068:	06f13c23          	sd	a5,120(sp)
    8000106c:	09013023          	sd	a6,128(sp)
    80001070:	09113423          	sd	a7,136(sp)
    80001074:	09213823          	sd	s2,144(sp)
    80001078:	09313c23          	sd	s3,152(sp)
    8000107c:	0b413023          	sd	s4,160(sp)
    80001080:	0b513423          	sd	s5,168(sp)
    80001084:	0b613823          	sd	s6,176(sp)
    80001088:	0b713c23          	sd	s7,184(sp)
    8000108c:	0d813023          	sd	s8,192(sp)
    80001090:	0d913423          	sd	s9,200(sp)
    80001094:	0da13823          	sd	s10,208(sp)
    80001098:	0db13c23          	sd	s11,216(sp)
    8000109c:	0fc13023          	sd	t3,224(sp)
    800010a0:	0fd13423          	sd	t4,232(sp)
    800010a4:	0fe13823          	sd	t5,240(sp)
    800010a8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5riscv20handleSupervisorTrapEv
    800010ac:	0e1010ef          	jal	ra,8000298c <_ZN5riscv20handleSupervisorTrapEv>

    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8 (sp)
    .endr
    800010b0:	00013003          	ld	zero,0(sp)
    800010b4:	00813083          	ld	ra,8(sp)
    800010b8:	01013103          	ld	sp,16(sp)
    800010bc:	01813183          	ld	gp,24(sp)
    800010c0:	02013203          	ld	tp,32(sp)
    800010c4:	02813283          	ld	t0,40(sp)
    800010c8:	03013303          	ld	t1,48(sp)
    800010cc:	03813383          	ld	t2,56(sp)
    800010d0:	04013403          	ld	s0,64(sp)
    800010d4:	04813483          	ld	s1,72(sp)
    800010d8:	05013503          	ld	a0,80(sp)
    800010dc:	05813583          	ld	a1,88(sp)
    800010e0:	06013603          	ld	a2,96(sp)
    800010e4:	06813683          	ld	a3,104(sp)
    800010e8:	07013703          	ld	a4,112(sp)
    800010ec:	07813783          	ld	a5,120(sp)
    800010f0:	08013803          	ld	a6,128(sp)
    800010f4:	08813883          	ld	a7,136(sp)
    800010f8:	09013903          	ld	s2,144(sp)
    800010fc:	09813983          	ld	s3,152(sp)
    80001100:	0a013a03          	ld	s4,160(sp)
    80001104:	0a813a83          	ld	s5,168(sp)
    80001108:	0b013b03          	ld	s6,176(sp)
    8000110c:	0b813b83          	ld	s7,184(sp)
    80001110:	0c013c03          	ld	s8,192(sp)
    80001114:	0c813c83          	ld	s9,200(sp)
    80001118:	0d013d03          	ld	s10,208(sp)
    8000111c:	0d813d83          	ld	s11,216(sp)
    80001120:	0e013e03          	ld	t3,224(sp)
    80001124:	0e813e83          	ld	t4,232(sp)
    80001128:	0f013f03          	ld	t5,240(sp)
    8000112c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001130:	10010113          	addi	sp,sp,256

    sret
    80001134:	10200073          	sret

0000000080001138 <timerTrap>:

timerTrap:
    addi sp, sp, -256
    80001138:	f0010113          	addi	sp,sp,-256
    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8 (sp)
    .endr
    8000113c:	00013023          	sd	zero,0(sp)
    80001140:	00113423          	sd	ra,8(sp)
    80001144:	00213823          	sd	sp,16(sp)
    80001148:	00313c23          	sd	gp,24(sp)
    8000114c:	02413023          	sd	tp,32(sp)
    80001150:	02513423          	sd	t0,40(sp)
    80001154:	02613823          	sd	t1,48(sp)
    80001158:	02713c23          	sd	t2,56(sp)
    8000115c:	04813023          	sd	s0,64(sp)
    80001160:	04913423          	sd	s1,72(sp)
    80001164:	04a13823          	sd	a0,80(sp)
    80001168:	04b13c23          	sd	a1,88(sp)
    8000116c:	06c13023          	sd	a2,96(sp)
    80001170:	06d13423          	sd	a3,104(sp)
    80001174:	06e13823          	sd	a4,112(sp)
    80001178:	06f13c23          	sd	a5,120(sp)
    8000117c:	09013023          	sd	a6,128(sp)
    80001180:	09113423          	sd	a7,136(sp)
    80001184:	09213823          	sd	s2,144(sp)
    80001188:	09313c23          	sd	s3,152(sp)
    8000118c:	0b413023          	sd	s4,160(sp)
    80001190:	0b513423          	sd	s5,168(sp)
    80001194:	0b613823          	sd	s6,176(sp)
    80001198:	0b713c23          	sd	s7,184(sp)
    8000119c:	0d813023          	sd	s8,192(sp)
    800011a0:	0d913423          	sd	s9,200(sp)
    800011a4:	0da13823          	sd	s10,208(sp)
    800011a8:	0db13c23          	sd	s11,216(sp)
    800011ac:	0fc13023          	sd	t3,224(sp)
    800011b0:	0fd13423          	sd	t4,232(sp)
    800011b4:	0fe13823          	sd	t5,240(sp)
    800011b8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5riscv21timerInterruptHandlerEv
    800011bc:	295010ef          	jal	ra,80002c50 <_ZN5riscv21timerInterruptHandlerEv>

    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8 (sp)
    .endr
    800011c0:	00013003          	ld	zero,0(sp)
    800011c4:	00813083          	ld	ra,8(sp)
    800011c8:	01013103          	ld	sp,16(sp)
    800011cc:	01813183          	ld	gp,24(sp)
    800011d0:	02013203          	ld	tp,32(sp)
    800011d4:	02813283          	ld	t0,40(sp)
    800011d8:	03013303          	ld	t1,48(sp)
    800011dc:	03813383          	ld	t2,56(sp)
    800011e0:	04013403          	ld	s0,64(sp)
    800011e4:	04813483          	ld	s1,72(sp)
    800011e8:	05013503          	ld	a0,80(sp)
    800011ec:	05813583          	ld	a1,88(sp)
    800011f0:	06013603          	ld	a2,96(sp)
    800011f4:	06813683          	ld	a3,104(sp)
    800011f8:	07013703          	ld	a4,112(sp)
    800011fc:	07813783          	ld	a5,120(sp)
    80001200:	08013803          	ld	a6,128(sp)
    80001204:	08813883          	ld	a7,136(sp)
    80001208:	09013903          	ld	s2,144(sp)
    8000120c:	09813983          	ld	s3,152(sp)
    80001210:	0a013a03          	ld	s4,160(sp)
    80001214:	0a813a83          	ld	s5,168(sp)
    80001218:	0b013b03          	ld	s6,176(sp)
    8000121c:	0b813b83          	ld	s7,184(sp)
    80001220:	0c013c03          	ld	s8,192(sp)
    80001224:	0c813c83          	ld	s9,200(sp)
    80001228:	0d013d03          	ld	s10,208(sp)
    8000122c:	0d813d83          	ld	s11,216(sp)
    80001230:	0e013e03          	ld	t3,224(sp)
    80001234:	0e813e83          	ld	t4,232(sp)
    80001238:	0f013f03          	ld	t5,240(sp)
    8000123c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001240:	10010113          	addi	sp,sp,256

    sret
    80001244:	10200073          	sret

0000000080001248 <consoleTrap>:

consoleTrap:
    addi sp, sp, -256
    80001248:	f0010113          	addi	sp,sp,-256
    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index * 8 (sp)
    .endr
    8000124c:	00013023          	sd	zero,0(sp)
    80001250:	00113423          	sd	ra,8(sp)
    80001254:	00213823          	sd	sp,16(sp)
    80001258:	00313c23          	sd	gp,24(sp)
    8000125c:	02413023          	sd	tp,32(sp)
    80001260:	02513423          	sd	t0,40(sp)
    80001264:	02613823          	sd	t1,48(sp)
    80001268:	02713c23          	sd	t2,56(sp)
    8000126c:	04813023          	sd	s0,64(sp)
    80001270:	04913423          	sd	s1,72(sp)
    80001274:	04a13823          	sd	a0,80(sp)
    80001278:	04b13c23          	sd	a1,88(sp)
    8000127c:	06c13023          	sd	a2,96(sp)
    80001280:	06d13423          	sd	a3,104(sp)
    80001284:	06e13823          	sd	a4,112(sp)
    80001288:	06f13c23          	sd	a5,120(sp)
    8000128c:	09013023          	sd	a6,128(sp)
    80001290:	09113423          	sd	a7,136(sp)
    80001294:	09213823          	sd	s2,144(sp)
    80001298:	09313c23          	sd	s3,152(sp)
    8000129c:	0b413023          	sd	s4,160(sp)
    800012a0:	0b513423          	sd	s5,168(sp)
    800012a4:	0b613823          	sd	s6,176(sp)
    800012a8:	0b713c23          	sd	s7,184(sp)
    800012ac:	0d813023          	sd	s8,192(sp)
    800012b0:	0d913423          	sd	s9,200(sp)
    800012b4:	0da13823          	sd	s10,208(sp)
    800012b8:	0db13c23          	sd	s11,216(sp)
    800012bc:	0fc13023          	sd	t3,224(sp)
    800012c0:	0fd13423          	sd	t4,232(sp)
    800012c4:	0fe13823          	sd	t5,240(sp)
    800012c8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5riscv23consoleInterruptHandlerEv
    800012cc:	235010ef          	jal	ra,80002d00 <_ZN5riscv23consoleInterruptHandlerEv>

    .irp index,0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index * 8 (sp)
    .endr
    800012d0:	00013003          	ld	zero,0(sp)
    800012d4:	00813083          	ld	ra,8(sp)
    800012d8:	01013103          	ld	sp,16(sp)
    800012dc:	01813183          	ld	gp,24(sp)
    800012e0:	02013203          	ld	tp,32(sp)
    800012e4:	02813283          	ld	t0,40(sp)
    800012e8:	03013303          	ld	t1,48(sp)
    800012ec:	03813383          	ld	t2,56(sp)
    800012f0:	04013403          	ld	s0,64(sp)
    800012f4:	04813483          	ld	s1,72(sp)
    800012f8:	05013503          	ld	a0,80(sp)
    800012fc:	05813583          	ld	a1,88(sp)
    80001300:	06013603          	ld	a2,96(sp)
    80001304:	06813683          	ld	a3,104(sp)
    80001308:	07013703          	ld	a4,112(sp)
    8000130c:	07813783          	ld	a5,120(sp)
    80001310:	08013803          	ld	a6,128(sp)
    80001314:	08813883          	ld	a7,136(sp)
    80001318:	09013903          	ld	s2,144(sp)
    8000131c:	09813983          	ld	s3,152(sp)
    80001320:	0a013a03          	ld	s4,160(sp)
    80001324:	0a813a83          	ld	s5,168(sp)
    80001328:	0b013b03          	ld	s6,176(sp)
    8000132c:	0b813b83          	ld	s7,184(sp)
    80001330:	0c013c03          	ld	s8,192(sp)
    80001334:	0c813c83          	ld	s9,200(sp)
    80001338:	0d013d03          	ld	s10,208(sp)
    8000133c:	0d813d83          	ld	s11,216(sp)
    80001340:	0e013e03          	ld	t3,224(sp)
    80001344:	0e813e83          	ld	t4,232(sp)
    80001348:	0f013f03          	ld	t5,240(sp)
    8000134c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001350:	10010113          	addi	sp,sp,256

    80001354:	10200073          	sret

0000000080001358 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:

_ZN3TCB13contextSwitchEPNS_7ContextES1_:
    # u a0 ide &old->context
    # u a1 ide &running->context

    sd ra, 0*8(a0)
    80001358:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
    sd sp, 1*8(a0)
    8000135c:	00253423          	sd	sp,8(a0)

    ld ra, 0*8(a1)
    80001360:	0005b083          	ld	ra,0(a1)
    ld sp, 1*8(a1)
    80001364:	0085b103          	ld	sp,8(a1)

    80001368:	00008067          	ret

000000008000136c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000136c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001370:	00b29a63          	bne	t0,a1,80001384 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001374:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001378:	fe029ae3          	bnez	t0,8000136c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000137c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001380:	00008067          	ret

0000000080001384 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001384:	00100513          	li	a0,1
    80001388:	00008067          	ret

000000008000138c <_Z9mem_allocm>:
// Created by os on 6/19/23.
//

#include "../h/syscall_c.hpp"

void* mem_alloc(size_t size){
    8000138c:	fe010113          	addi	sp,sp,-32
    80001390:	00813c23          	sd	s0,24(sp)
    80001394:	02010413          	addi	s0,sp,32
    uchar entry = 0x01;
    size += sizeof(uint64);
    80001398:	00850513          	addi	a0,a0,8
    size = size/MEM_BLOCK_SIZE + size%MEM_BLOCK_SIZE;
    8000139c:	00655793          	srli	a5,a0,0x6
    800013a0:	03f57513          	andi	a0,a0,63
    800013a4:	00a78533          	add	a0,a5,a0
    __asm__ volatile ("mv a1, %0": : "r"(size));
    800013a8:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0": : "r"(entry));
    800013ac:	00100793          	li	a5,1
    800013b0:	00078513          	mv	a0,a5


    __asm__ volatile("ecall");
    800013b4:	00000073          	ecall

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    800013b8:	00050793          	mv	a5,a0
    800013bc:	fef43423          	sd	a5,-24(s0)
    return (void*)ret;
    800013c0:	fe843503          	ld	a0,-24(s0)
}
    800013c4:	01813403          	ld	s0,24(sp)
    800013c8:	02010113          	addi	sp,sp,32
    800013cc:	00008067          	ret

00000000800013d0 <_Z8mem_freePv>:

int mem_free (void* ptr){
    800013d0:	fe010113          	addi	sp,sp,-32
    800013d4:	00813c23          	sd	s0,24(sp)
    800013d8:	02010413          	addi	s0,sp,32
    uchar entry = 0x02;
    __asm__ volatile ("mv a1, %0": : "r"((uint64)ptr));
    800013dc:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0": : "r"(entry));
    800013e0:	00200793          	li	a5,2
    800013e4:	00078513          	mv	a0,a5


    __asm__ volatile("ecall");
    800013e8:	00000073          	ecall

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    800013ec:	00050793          	mv	a5,a0
    800013f0:	fef43423          	sd	a5,-24(s0)
    return (int)ret;
    800013f4:	fe843503          	ld	a0,-24(s0)
}
    800013f8:	0005051b          	sext.w	a0,a0
    800013fc:	01813403          	ld	s0,24(sp)
    80001400:	02010113          	addi	sp,sp,32
    80001404:	00008067          	ret

0000000080001408 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void(*start_routine)(void*), void* arg){
    80001408:	fc010113          	addi	sp,sp,-64
    8000140c:	02113c23          	sd	ra,56(sp)
    80001410:	02813823          	sd	s0,48(sp)
    80001414:	02913423          	sd	s1,40(sp)
    80001418:	03213023          	sd	s2,32(sp)
    8000141c:	01313c23          	sd	s3,24(sp)
    80001420:	04010413          	addi	s0,sp,64
    80001424:	00050913          	mv	s2,a0
    80001428:	00058493          	mv	s1,a1
    8000142c:	00060993          	mv	s3,a2
    uchar entry = 0x11;
    uint8* st = nullptr;
    if(start_routine != nullptr)
    80001430:	04058c63          	beqz	a1,80001488 <_Z13thread_createPP3TCBPFvPvES2_+0x80>
         st = new uint8[DEFAULT_STACK_SIZE];
    80001434:	00001537          	lui	a0,0x1
    80001438:	00001097          	auipc	ra,0x1
    8000143c:	ff8080e7          	jalr	-8(ra) # 80002430 <_Znam>
    __asm__ volatile ("mv a4, %0": : "r"((uint64)st));
    80001440:	00050713          	mv	a4,a0
    __asm__ volatile ("mv a3, %0": : "r"((uint64)arg));
    80001444:	00098693          	mv	a3,s3
    __asm__ volatile ("mv a2, %0": : "r"((uint64)start_routine));
    80001448:	00048613          	mv	a2,s1
    __asm__ volatile ("mv a1, %0": : "r"((uint64)handle));
    8000144c:	00090593          	mv	a1,s2
    __asm__ volatile ("mv a0, %0": : "r"(entry));
    80001450:	01100793          	li	a5,17
    80001454:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    80001458:	00000073          	ecall

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    8000145c:	00050793          	mv	a5,a0
    80001460:	fcf43423          	sd	a5,-56(s0)
    return (int)ret;
    80001464:	fc843503          	ld	a0,-56(s0)

}
    80001468:	0005051b          	sext.w	a0,a0
    8000146c:	03813083          	ld	ra,56(sp)
    80001470:	03013403          	ld	s0,48(sp)
    80001474:	02813483          	ld	s1,40(sp)
    80001478:	02013903          	ld	s2,32(sp)
    8000147c:	01813983          	ld	s3,24(sp)
    80001480:	04010113          	addi	sp,sp,64
    80001484:	00008067          	ret
    uint8* st = nullptr;
    80001488:	00000513          	li	a0,0
    8000148c:	fb5ff06f          	j	80001440 <_Z13thread_createPP3TCBPFvPvES2_+0x38>

0000000080001490 <_Z11thread_exitv>:

int thread_exit(){
    80001490:	fe010113          	addi	sp,sp,-32
    80001494:	00813c23          	sd	s0,24(sp)
    80001498:	02010413          	addi	s0,sp,32
    uchar entry = 0x12;
    __asm__ volatile ("mv a0, %0": : "r"(entry));
    8000149c:	01200793          	li	a5,18
    800014a0:	00078513          	mv	a0,a5

    __asm__ volatile("ecall");
    800014a4:	00000073          	ecall

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    800014a8:	00050793          	mv	a5,a0
    800014ac:	fef43423          	sd	a5,-24(s0)
    return (int)ret;
    800014b0:	fe843503          	ld	a0,-24(s0)
}
    800014b4:	0005051b          	sext.w	a0,a0
    800014b8:	01813403          	ld	s0,24(sp)
    800014bc:	02010113          	addi	sp,sp,32
    800014c0:	00008067          	ret

00000000800014c4 <_Z15thread_dispatchv>:

void thread_dispatch(){
    800014c4:	ff010113          	addi	sp,sp,-16
    800014c8:	00813423          	sd	s0,8(sp)
    800014cc:	01010413          	addi	s0,sp,16
    uchar entry = 0x13;
    __asm__ volatile ("mv a0, %0": : "r"(entry));
    800014d0:	01300793          	li	a5,19
    800014d4:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800014d8:	00000073          	ecall
}
    800014dc:	00813403          	ld	s0,8(sp)
    800014e0:	01010113          	addi	sp,sp,16
    800014e4:	00008067          	ret

00000000800014e8 <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle){
    800014e8:	ff010113          	addi	sp,sp,-16
    800014ec:	00813423          	sd	s0,8(sp)
    800014f0:	01010413          	addi	s0,sp,16
    uchar entry = 0x14;
    __asm__ volatile ("mv a1, %0": : "r"((uint64)handle));
    800014f4:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0": : "r"(entry));
    800014f8:	01400793          	li	a5,20
    800014fc:	00078513          	mv	a0,a5


    __asm__ volatile("ecall");
    80001500:	00000073          	ecall
}
    80001504:	00813403          	ld	s0,8(sp)
    80001508:	01010113          	addi	sp,sp,16
    8000150c:	00008067          	ret

0000000080001510 <_Z8sem_openPP4_semj>:

int sem_open(sem_t* handle, unsigned init){
    80001510:	fe010113          	addi	sp,sp,-32
    80001514:	00813c23          	sd	s0,24(sp)
    80001518:	02010413          	addi	s0,sp,32
    uchar entry = 0x21;
    __asm__ volatile ("mv a2, %0": : "r"((uint64)init));
    8000151c:	02059593          	slli	a1,a1,0x20
    80001520:	0205d593          	srli	a1,a1,0x20
    80001524:	00058613          	mv	a2,a1
    __asm__ volatile ("mv a1, %0": : "r"((uint64)handle));
    80001528:	00050593          	mv	a1,a0

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    8000152c:	02100793          	li	a5,33
    80001530:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001534:	00000073          	ecall

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001538:	00050793          	mv	a5,a0
    8000153c:	fef43423          	sd	a5,-24(s0)
    return (int)ret;
    80001540:	fe843503          	ld	a0,-24(s0)
}
    80001544:	0005051b          	sext.w	a0,a0
    80001548:	01813403          	ld	s0,24(sp)
    8000154c:	02010113          	addi	sp,sp,32
    80001550:	00008067          	ret

0000000080001554 <_Z9sem_closeP4_sem>:

int sem_close(sem_t handle){
    80001554:	fe010113          	addi	sp,sp,-32
    80001558:	00813c23          	sd	s0,24(sp)
    8000155c:	02010413          	addi	s0,sp,32
    uchar entry = 0x22;

    __asm__ volatile ("mv a1, %0": : "r"((uint64)handle));
    80001560:	00050593          	mv	a1,a0

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    80001564:	02200793          	li	a5,34
    80001568:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    8000156c:	00000073          	ecall

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001570:	00050793          	mv	a5,a0
    80001574:	fef43423          	sd	a5,-24(s0)
    return (int)ret;
    80001578:	fe843503          	ld	a0,-24(s0)
}
    8000157c:	0005051b          	sext.w	a0,a0
    80001580:	01813403          	ld	s0,24(sp)
    80001584:	02010113          	addi	sp,sp,32
    80001588:	00008067          	ret

000000008000158c <_Z8sem_waitP4_sem>:

int sem_wait(sem_t id) {
    8000158c:	fe010113          	addi	sp,sp,-32
    80001590:	00813c23          	sd	s0,24(sp)
    80001594:	02010413          	addi	s0,sp,32
    uchar entry = 0x23;

    __asm__ volatile ("mv a1, %0": : "r"((uint64) id));
    80001598:	00050593          	mv	a1,a0

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    8000159c:	02300793          	li	a5,35
    800015a0:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800015a4:	00000073          	ecall

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    800015a8:	00050793          	mv	a5,a0
    800015ac:	fef43423          	sd	a5,-24(s0)
    return (int) ret;
    800015b0:	fe843503          	ld	a0,-24(s0)

}
    800015b4:	0005051b          	sext.w	a0,a0
    800015b8:	01813403          	ld	s0,24(sp)
    800015bc:	02010113          	addi	sp,sp,32
    800015c0:	00008067          	ret

00000000800015c4 <_Z10sem_signalP4_sem>:

int sem_signal(sem_t id) {
    800015c4:	fe010113          	addi	sp,sp,-32
    800015c8:	00813c23          	sd	s0,24(sp)
    800015cc:	02010413          	addi	s0,sp,32
    uchar entry = 0x24;

    __asm__ volatile ("mv a1, %0": : "r"((uint64) id));
    800015d0:	00050593          	mv	a1,a0

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    800015d4:	02400793          	li	a5,36
    800015d8:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    800015dc:	00000073          	ecall

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    800015e0:	00050793          	mv	a5,a0
    800015e4:	fef43423          	sd	a5,-24(s0)
    return (int) ret;
    800015e8:	fe843503          	ld	a0,-24(s0)

}
    800015ec:	0005051b          	sext.w	a0,a0
    800015f0:	01813403          	ld	s0,24(sp)
    800015f4:	02010113          	addi	sp,sp,32
    800015f8:	00008067          	ret

00000000800015fc <_Z10time_sleepm>:

int time_sleep (time_t tm){
    800015fc:	fe010113          	addi	sp,sp,-32
    80001600:	00813c23          	sd	s0,24(sp)
    80001604:	02010413          	addi	s0,sp,32
    uchar entry = 0x31;

    __asm__ volatile ("mv a1, %0": : "r"((uint64)tm));
    80001608:	00050593          	mv	a1,a0

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    8000160c:	03100793          	li	a5,49
    80001610:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001614:	00000073          	ecall

    volatile uint64 ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    80001618:	00050793          	mv	a5,a0
    8000161c:	fef43423          	sd	a5,-24(s0)
    return (int) ret;
    80001620:	fe843503          	ld	a0,-24(s0)
}
    80001624:	0005051b          	sext.w	a0,a0
    80001628:	01813403          	ld	s0,24(sp)
    8000162c:	02010113          	addi	sp,sp,32
    80001630:	00008067          	ret

0000000080001634 <_Z4getcv>:

char getc (){
    80001634:	fe010113          	addi	sp,sp,-32
    80001638:	00813c23          	sd	s0,24(sp)
    8000163c:	02010413          	addi	s0,sp,32
    uchar entry = 0x41;
    __asm__ volatile ("mv a0, %0": : "r"(entry));
    80001640:	04100793          	li	a5,65
    80001644:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001648:	00000073          	ecall

    volatile char ret;
    __asm__ volatile ("mv %0, a0": "=r"(ret));
    8000164c:	00050793          	mv	a5,a0
    80001650:	fef407a3          	sb	a5,-17(s0)
    return ret;
    80001654:	fef44503          	lbu	a0,-17(s0)
}
    80001658:	0ff57513          	andi	a0,a0,255
    8000165c:	01813403          	ld	s0,24(sp)
    80001660:	02010113          	addi	sp,sp,32
    80001664:	00008067          	ret

0000000080001668 <_Z4putcc>:

void putc(char c){
    80001668:	ff010113          	addi	sp,sp,-16
    8000166c:	00813423          	sd	s0,8(sp)
    80001670:	01010413          	addi	s0,sp,16
    uchar entry = 0x42;

    __asm__ volatile ("mv a1, %0": : "r"((uint64)c));
    80001674:	00050593          	mv	a1,a0

    __asm__ volatile ("mv a0, %0": : "r"(entry));
    80001678:	04200793          	li	a5,66
    8000167c:	00078513          	mv	a0,a5
    __asm__ volatile("ecall");
    80001680:	00000073          	ecall

    80001684:	00813403          	ld	s0,8(sp)
    80001688:	01010113          	addi	sp,sp,16
    8000168c:	00008067          	ret

0000000080001690 <_ZN13ConsoleKernel13getCharKernelEPv>:
ConsoleKernel* ConsoleKernel::instance = nullptr;

// Thread function for getting the character from the console and putting it in the input buffer.
// Console -> input buffer
void ConsoleKernel::getCharKernel(void* notUsed){
    while(!(TCB::running->isFinished())){
    80001690:	0000a797          	auipc	a5,0xa
    80001694:	2607b783          	ld	a5,608(a5) # 8000b8f0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001698:	0007b783          	ld	a5,0(a5)
    using Argument = void*;

    static TCB* createThread(Body body, Argument argument, uint8* st);

    // Finished
    bool isFinished() const{ return this->state == FINISHED; }
    8000169c:	0287a783          	lw	a5,40(a5)
    800016a0:	24078a63          	beqz	a5,800018f4 <_ZN13ConsoleKernel13getCharKernelEPv+0x264>
void ConsoleKernel::getCharKernel(void* notUsed){
    800016a4:	fe010113          	addi	sp,sp,-32
    800016a8:	00113c23          	sd	ra,24(sp)
    800016ac:	00813823          	sd	s0,16(sp)
    800016b0:	00913423          	sd	s1,8(sp)
    800016b4:	01213023          	sd	s2,0(sp)
    800016b8:	02010413          	addi	s0,sp,32
    800016bc:	0180006f          	j	800016d4 <_ZN13ConsoleKernel13getCharKernelEPv+0x44>
    while(!(TCB::running->isFinished())){
    800016c0:	0000a797          	auipc	a5,0xa
    800016c4:	2307b783          	ld	a5,560(a5) # 8000b8f0 <_GLOBAL_OFFSET_TABLE_+0x48>
    800016c8:	0007b783          	ld	a5,0(a5)
    800016cc:	0287a783          	lw	a5,40(a5)
    800016d0:	20078663          	beqz	a5,800018dc <_ZN13ConsoleKernel13getCharKernelEPv+0x24c>
    static void putc(char);
    static char getc();

    // Singleton mechanism
    static ConsoleKernel* get(){
        if(!instance) instance = new ConsoleKernel();
    800016d4:	0000a797          	auipc	a5,0xa
    800016d8:	28c7b783          	ld	a5,652(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    800016dc:	00078e63          	beqz	a5,800016f8 <_ZN13ConsoleKernel13getCharKernelEPv+0x68>
        sem_wait(ConsoleKernel::get()->getSem);
    800016e0:	0000a797          	auipc	a5,0xa
    800016e4:	2807b783          	ld	a5,640(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    800016e8:	1107b503          	ld	a0,272(a5)
    800016ec:	00000097          	auipc	ra,0x0
    800016f0:	ea0080e7          	jalr	-352(ra) # 8000158c <_Z8sem_waitP4_sem>
    800016f4:	1780006f          	j	8000186c <_ZN13ConsoleKernel13getCharKernelEPv+0x1dc>
    800016f8:	12000513          	li	a0,288
    800016fc:	00001097          	auipc	ra,0x1
    80001700:	d0c080e7          	jalr	-756(ra) # 80002408 <_Znwm>
    80001704:	00050493          	mv	s1,a0
    // spacePutAv and charGetAv are used to prevent invalid locations
    // when operating with buffer in putc and getc
    sem_t spacePutAv;
    sem_t charGetAv;
public:
    BufferKernel(): head(0), tail(0), size(0){
    80001708:	00052023          	sw	zero,0(a0) # 1000 <_entry-0x7ffff000>
    8000170c:	00052223          	sw	zero,4(a0)
    80001710:	00052423          	sw	zero,8(a0)
        sem_open(&mutexSem, 1);
    80001714:	00100593          	li	a1,1
    80001718:	07050513          	addi	a0,a0,112
    8000171c:	00000097          	auipc	ra,0x0
    80001720:	df4080e7          	jalr	-524(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80001724:	06400593          	li	a1,100
    80001728:	07848513          	addi	a0,s1,120
    8000172c:	00000097          	auipc	ra,0x0
    80001730:	de4080e7          	jalr	-540(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80001734:	00000593          	li	a1,0
    80001738:	08048513          	addi	a0,s1,128
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	dd4080e7          	jalr	-556(ra) # 80001510 <_Z8sem_openPP4_semj>
    BufferKernel(): head(0), tail(0), size(0){
    80001744:	0804a423          	sw	zero,136(s1)
    80001748:	0804a623          	sw	zero,140(s1)
    8000174c:	0804a823          	sw	zero,144(s1)
        sem_open(&mutexSem, 1);
    80001750:	00100593          	li	a1,1
    80001754:	0f848513          	addi	a0,s1,248
    80001758:	00000097          	auipc	ra,0x0
    8000175c:	db8080e7          	jalr	-584(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80001760:	06400593          	li	a1,100
    80001764:	10048513          	addi	a0,s1,256
    80001768:	00000097          	auipc	ra,0x0
    8000176c:	da8080e7          	jalr	-600(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80001770:	00000593          	li	a1,0
    80001774:	10848513          	addi	a0,s1,264
    80001778:	00000097          	auipc	ra,0x0
    8000177c:	d98080e7          	jalr	-616(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&getSem,0);
    80001780:	00000593          	li	a1,0
    80001784:	11048513          	addi	a0,s1,272
    80001788:	00000097          	auipc	ra,0x0
    8000178c:	d88080e7          	jalr	-632(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&putSem,0);
    80001790:	00000593          	li	a1,0
    80001794:	11848513          	addi	a0,s1,280
    80001798:	00000097          	auipc	ra,0x0
    8000179c:	d78080e7          	jalr	-648(ra) # 80001510 <_Z8sem_openPP4_semj>
        if(!instance) instance = new ConsoleKernel();
    800017a0:	0000a797          	auipc	a5,0xa
    800017a4:	1c97b023          	sd	s1,448(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    800017a8:	f39ff06f          	j	800016e0 <_ZN13ConsoleKernel13getCharKernelEPv+0x50>
    800017ac:	00050913          	mv	s2,a0
    800017b0:	00048513          	mv	a0,s1
    800017b4:	00001097          	auipc	ra,0x1
    800017b8:	ca4080e7          	jalr	-860(ra) # 80002458 <_ZdlPv>
    800017bc:	00090513          	mv	a0,s2
    800017c0:	0000b097          	auipc	ra,0xb
    800017c4:	2f8080e7          	jalr	760(ra) # 8000cab8 <_Unwind_Resume>
        sem_open(&spacePutAv, maxSize);
    800017c8:	06400593          	li	a1,100
    800017cc:	07848513          	addi	a0,s1,120
    800017d0:	00000097          	auipc	ra,0x0
    800017d4:	d40080e7          	jalr	-704(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    800017d8:	00000593          	li	a1,0
    800017dc:	08048513          	addi	a0,s1,128
    800017e0:	00000097          	auipc	ra,0x0
    800017e4:	d30080e7          	jalr	-720(ra) # 80001510 <_Z8sem_openPP4_semj>
    BufferKernel(): head(0), tail(0), size(0){
    800017e8:	0804a423          	sw	zero,136(s1)
    800017ec:	0804a623          	sw	zero,140(s1)
    800017f0:	0804a823          	sw	zero,144(s1)
        sem_open(&mutexSem, 1);
    800017f4:	00100593          	li	a1,1
    800017f8:	0f848513          	addi	a0,s1,248
    800017fc:	00000097          	auipc	ra,0x0
    80001800:	d14080e7          	jalr	-748(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80001804:	06400593          	li	a1,100
    80001808:	10048513          	addi	a0,s1,256
    8000180c:	00000097          	auipc	ra,0x0
    80001810:	d04080e7          	jalr	-764(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80001814:	00000593          	li	a1,0
    80001818:	10848513          	addi	a0,s1,264
    8000181c:	00000097          	auipc	ra,0x0
    80001820:	cf4080e7          	jalr	-780(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&getSem,0);
    80001824:	00000593          	li	a1,0
    80001828:	11048513          	addi	a0,s1,272
    8000182c:	00000097          	auipc	ra,0x0
    80001830:	ce4080e7          	jalr	-796(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&putSem,0);
    80001834:	00000593          	li	a1,0
    80001838:	11848513          	addi	a0,s1,280
    8000183c:	00000097          	auipc	ra,0x0
    80001840:	cd4080e7          	jalr	-812(ra) # 80001510 <_Z8sem_openPP4_semj>
        if(!instance) instance = new ConsoleKernel();
    80001844:	0000a797          	auipc	a5,0xa
    80001848:	1097be23          	sd	s1,284(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
        while (  *((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT )
            ConsoleKernel::get()->input.put(*((char*)CONSOLE_RX_DATA));
    8000184c:	0000a797          	auipc	a5,0xa
    80001850:	0647b783          	ld	a5,100(a5) # 8000b8b0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80001854:	0007b783          	ld	a5,0(a5)
    80001858:	0007c583          	lbu	a1,0(a5)
    8000185c:	0000a517          	auipc	a0,0xa
    80001860:	10453503          	ld	a0,260(a0) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001864:	00001097          	auipc	ra,0x1
    80001868:	868080e7          	jalr	-1944(ra) # 800020cc <_ZN12BufferKernel3putEc>
        while (  *((char*)CONSOLE_STATUS) & CONSOLE_RX_STATUS_BIT )
    8000186c:	0000a797          	auipc	a5,0xa
    80001870:	04c7b783          	ld	a5,76(a5) # 8000b8b8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001874:	0007b783          	ld	a5,0(a5)
    80001878:	0007c783          	lbu	a5,0(a5)
    8000187c:	0017f793          	andi	a5,a5,1
    80001880:	e40780e3          	beqz	a5,800016c0 <_ZN13ConsoleKernel13getCharKernelEPv+0x30>
    80001884:	0000a797          	auipc	a5,0xa
    80001888:	0dc7b783          	ld	a5,220(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    8000188c:	fc0790e3          	bnez	a5,8000184c <_ZN13ConsoleKernel13getCharKernelEPv+0x1bc>
    80001890:	12000513          	li	a0,288
    80001894:	00001097          	auipc	ra,0x1
    80001898:	b74080e7          	jalr	-1164(ra) # 80002408 <_Znwm>
    8000189c:	00050493          	mv	s1,a0
    BufferKernel(): head(0), tail(0), size(0){
    800018a0:	00052023          	sw	zero,0(a0)
    800018a4:	00052223          	sw	zero,4(a0)
    800018a8:	00052423          	sw	zero,8(a0)
        sem_open(&mutexSem, 1);
    800018ac:	00100593          	li	a1,1
    800018b0:	07050513          	addi	a0,a0,112
    800018b4:	00000097          	auipc	ra,0x0
    800018b8:	c5c080e7          	jalr	-932(ra) # 80001510 <_Z8sem_openPP4_semj>
    800018bc:	f0dff06f          	j	800017c8 <_ZN13ConsoleKernel13getCharKernelEPv+0x138>
    800018c0:	00050913          	mv	s2,a0
    800018c4:	00048513          	mv	a0,s1
    800018c8:	00001097          	auipc	ra,0x1
    800018cc:	b90080e7          	jalr	-1136(ra) # 80002458 <_ZdlPv>
    800018d0:	00090513          	mv	a0,s2
    800018d4:	0000b097          	auipc	ra,0xb
    800018d8:	1e4080e7          	jalr	484(ra) # 8000cab8 <_Unwind_Resume>
    }
}
    800018dc:	01813083          	ld	ra,24(sp)
    800018e0:	01013403          	ld	s0,16(sp)
    800018e4:	00813483          	ld	s1,8(sp)
    800018e8:	00013903          	ld	s2,0(sp)
    800018ec:	02010113          	addi	sp,sp,32
    800018f0:	00008067          	ret
    800018f4:	00008067          	ret

00000000800018f8 <_ZN13ConsoleKernel13putCharKernelEPv>:

// Thread function for getting the character from the output buffer and putting it on the console.
// Output buffer -> console
void ConsoleKernel::putCharKernel(void* notUsed){
    while(!(TCB::running->isFinished())){
    800018f8:	0000a797          	auipc	a5,0xa
    800018fc:	ff87b783          	ld	a5,-8(a5) # 8000b8f0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001900:	0007b783          	ld	a5,0(a5)
    80001904:	0287a783          	lw	a5,40(a5)
    80001908:	24078c63          	beqz	a5,80001b60 <_ZN13ConsoleKernel13putCharKernelEPv+0x268>
void ConsoleKernel::putCharKernel(void* notUsed){
    8000190c:	fe010113          	addi	sp,sp,-32
    80001910:	00113c23          	sd	ra,24(sp)
    80001914:	00813823          	sd	s0,16(sp)
    80001918:	00913423          	sd	s1,8(sp)
    8000191c:	01213023          	sd	s2,0(sp)
    80001920:	02010413          	addi	s0,sp,32
    80001924:	0180006f          	j	8000193c <_ZN13ConsoleKernel13putCharKernelEPv+0x44>
    while(!(TCB::running->isFinished())){
    80001928:	0000a797          	auipc	a5,0xa
    8000192c:	fc87b783          	ld	a5,-56(a5) # 8000b8f0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80001930:	0007b783          	ld	a5,0(a5)
    80001934:	0287a783          	lw	a5,40(a5)
    80001938:	20078863          	beqz	a5,80001b48 <_ZN13ConsoleKernel13putCharKernelEPv+0x250>
    8000193c:	0000a797          	auipc	a5,0xa
    80001940:	0247b783          	ld	a5,36(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001944:	00078e63          	beqz	a5,80001960 <_ZN13ConsoleKernel13putCharKernelEPv+0x68>
        sem_wait(ConsoleKernel::get()->putSem);
    80001948:	0000a797          	auipc	a5,0xa
    8000194c:	0187b783          	ld	a5,24(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001950:	1187b503          	ld	a0,280(a5)
    80001954:	00000097          	auipc	ra,0x0
    80001958:	c38080e7          	jalr	-968(ra) # 8000158c <_Z8sem_waitP4_sem>
    8000195c:	17c0006f          	j	80001ad8 <_ZN13ConsoleKernel13putCharKernelEPv+0x1e0>
    80001960:	12000513          	li	a0,288
    80001964:	00001097          	auipc	ra,0x1
    80001968:	aa4080e7          	jalr	-1372(ra) # 80002408 <_Znwm>
    8000196c:	00050493          	mv	s1,a0
    BufferKernel(): head(0), tail(0), size(0){
    80001970:	00052023          	sw	zero,0(a0)
    80001974:	00052223          	sw	zero,4(a0)
    80001978:	00052423          	sw	zero,8(a0)
        sem_open(&mutexSem, 1);
    8000197c:	00100593          	li	a1,1
    80001980:	07050513          	addi	a0,a0,112
    80001984:	00000097          	auipc	ra,0x0
    80001988:	b8c080e7          	jalr	-1140(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    8000198c:	06400593          	li	a1,100
    80001990:	07848513          	addi	a0,s1,120
    80001994:	00000097          	auipc	ra,0x0
    80001998:	b7c080e7          	jalr	-1156(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    8000199c:	00000593          	li	a1,0
    800019a0:	08048513          	addi	a0,s1,128
    800019a4:	00000097          	auipc	ra,0x0
    800019a8:	b6c080e7          	jalr	-1172(ra) # 80001510 <_Z8sem_openPP4_semj>
    BufferKernel(): head(0), tail(0), size(0){
    800019ac:	0804a423          	sw	zero,136(s1)
    800019b0:	0804a623          	sw	zero,140(s1)
    800019b4:	0804a823          	sw	zero,144(s1)
        sem_open(&mutexSem, 1);
    800019b8:	00100593          	li	a1,1
    800019bc:	0f848513          	addi	a0,s1,248
    800019c0:	00000097          	auipc	ra,0x0
    800019c4:	b50080e7          	jalr	-1200(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    800019c8:	06400593          	li	a1,100
    800019cc:	10048513          	addi	a0,s1,256
    800019d0:	00000097          	auipc	ra,0x0
    800019d4:	b40080e7          	jalr	-1216(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    800019d8:	00000593          	li	a1,0
    800019dc:	10848513          	addi	a0,s1,264
    800019e0:	00000097          	auipc	ra,0x0
    800019e4:	b30080e7          	jalr	-1232(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&getSem,0);
    800019e8:	00000593          	li	a1,0
    800019ec:	11048513          	addi	a0,s1,272
    800019f0:	00000097          	auipc	ra,0x0
    800019f4:	b20080e7          	jalr	-1248(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&putSem,0);
    800019f8:	00000593          	li	a1,0
    800019fc:	11848513          	addi	a0,s1,280
    80001a00:	00000097          	auipc	ra,0x0
    80001a04:	b10080e7          	jalr	-1264(ra) # 80001510 <_Z8sem_openPP4_semj>
        if(!instance) instance = new ConsoleKernel();
    80001a08:	0000a797          	auipc	a5,0xa
    80001a0c:	f497bc23          	sd	s1,-168(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001a10:	f39ff06f          	j	80001948 <_ZN13ConsoleKernel13putCharKernelEPv+0x50>
    80001a14:	00050913          	mv	s2,a0
    80001a18:	00048513          	mv	a0,s1
    80001a1c:	00001097          	auipc	ra,0x1
    80001a20:	a3c080e7          	jalr	-1476(ra) # 80002458 <_ZdlPv>
    80001a24:	00090513          	mv	a0,s2
    80001a28:	0000b097          	auipc	ra,0xb
    80001a2c:	090080e7          	jalr	144(ra) # 8000cab8 <_Unwind_Resume>
        sem_open(&spacePutAv, maxSize);
    80001a30:	06400593          	li	a1,100
    80001a34:	07848513          	addi	a0,s1,120
    80001a38:	00000097          	auipc	ra,0x0
    80001a3c:	ad8080e7          	jalr	-1320(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80001a40:	00000593          	li	a1,0
    80001a44:	08048513          	addi	a0,s1,128
    80001a48:	00000097          	auipc	ra,0x0
    80001a4c:	ac8080e7          	jalr	-1336(ra) # 80001510 <_Z8sem_openPP4_semj>
    BufferKernel(): head(0), tail(0), size(0){
    80001a50:	0804a423          	sw	zero,136(s1)
    80001a54:	0804a623          	sw	zero,140(s1)
    80001a58:	0804a823          	sw	zero,144(s1)
        sem_open(&mutexSem, 1);
    80001a5c:	00100593          	li	a1,1
    80001a60:	0f848513          	addi	a0,s1,248
    80001a64:	00000097          	auipc	ra,0x0
    80001a68:	aac080e7          	jalr	-1364(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80001a6c:	06400593          	li	a1,100
    80001a70:	10048513          	addi	a0,s1,256
    80001a74:	00000097          	auipc	ra,0x0
    80001a78:	a9c080e7          	jalr	-1380(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80001a7c:	00000593          	li	a1,0
    80001a80:	10848513          	addi	a0,s1,264
    80001a84:	00000097          	auipc	ra,0x0
    80001a88:	a8c080e7          	jalr	-1396(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&getSem,0);
    80001a8c:	00000593          	li	a1,0
    80001a90:	11048513          	addi	a0,s1,272
    80001a94:	00000097          	auipc	ra,0x0
    80001a98:	a7c080e7          	jalr	-1412(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&putSem,0);
    80001a9c:	00000593          	li	a1,0
    80001aa0:	11848513          	addi	a0,s1,280
    80001aa4:	00000097          	auipc	ra,0x0
    80001aa8:	a6c080e7          	jalr	-1428(ra) # 80001510 <_Z8sem_openPP4_semj>
        if(!instance) instance = new ConsoleKernel();
    80001aac:	0000a797          	auipc	a5,0xa
    80001ab0:	ea97ba23          	sd	s1,-332(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
        char c;
        while ( *((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT ) {
            c = ConsoleKernel::get()->output.get();
    80001ab4:	0000a517          	auipc	a0,0xa
    80001ab8:	eac53503          	ld	a0,-340(a0) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001abc:	08850513          	addi	a0,a0,136
    80001ac0:	00000097          	auipc	ra,0x0
    80001ac4:	57c080e7          	jalr	1404(ra) # 8000203c <_ZN12BufferKernel3getEv>
//            if (c != '\x1b') {
//                if (c == '\r') c = '\n';
                *((char *) CONSOLE_TX_DATA) = c;
    80001ac8:	0000a797          	auipc	a5,0xa
    80001acc:	e107b783          	ld	a5,-496(a5) # 8000b8d8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80001ad0:	0007b783          	ld	a5,0(a5)
    80001ad4:	00a78023          	sb	a0,0(a5)
        while ( *((char*)CONSOLE_STATUS) & CONSOLE_TX_STATUS_BIT ) {
    80001ad8:	0000a797          	auipc	a5,0xa
    80001adc:	de07b783          	ld	a5,-544(a5) # 8000b8b8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80001ae0:	0007b783          	ld	a5,0(a5)
    80001ae4:	0007c783          	lbu	a5,0(a5)
    80001ae8:	0207f793          	andi	a5,a5,32
    80001aec:	e2078ee3          	beqz	a5,80001928 <_ZN13ConsoleKernel13putCharKernelEPv+0x30>
    80001af0:	0000a797          	auipc	a5,0xa
    80001af4:	e707b783          	ld	a5,-400(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001af8:	fa079ee3          	bnez	a5,80001ab4 <_ZN13ConsoleKernel13putCharKernelEPv+0x1bc>
    80001afc:	12000513          	li	a0,288
    80001b00:	00001097          	auipc	ra,0x1
    80001b04:	908080e7          	jalr	-1784(ra) # 80002408 <_Znwm>
    80001b08:	00050493          	mv	s1,a0
    BufferKernel(): head(0), tail(0), size(0){
    80001b0c:	00052023          	sw	zero,0(a0)
    80001b10:	00052223          	sw	zero,4(a0)
    80001b14:	00052423          	sw	zero,8(a0)
        sem_open(&mutexSem, 1);
    80001b18:	00100593          	li	a1,1
    80001b1c:	07050513          	addi	a0,a0,112
    80001b20:	00000097          	auipc	ra,0x0
    80001b24:	9f0080e7          	jalr	-1552(ra) # 80001510 <_Z8sem_openPP4_semj>
    80001b28:	f09ff06f          	j	80001a30 <_ZN13ConsoleKernel13putCharKernelEPv+0x138>
    80001b2c:	00050913          	mv	s2,a0
    80001b30:	00048513          	mv	a0,s1
    80001b34:	00001097          	auipc	ra,0x1
    80001b38:	924080e7          	jalr	-1756(ra) # 80002458 <_ZdlPv>
    80001b3c:	00090513          	mv	a0,s2
    80001b40:	0000b097          	auipc	ra,0xb
    80001b44:	f78080e7          	jalr	-136(ra) # 8000cab8 <_Unwind_Resume>
//            }
        }
    }
}
    80001b48:	01813083          	ld	ra,24(sp)
    80001b4c:	01013403          	ld	s0,16(sp)
    80001b50:	00813483          	ld	s1,8(sp)
    80001b54:	00013903          	ld	s2,0(sp)
    80001b58:	02010113          	addi	sp,sp,32
    80001b5c:	00008067          	ret
    80001b60:	00008067          	ret

0000000080001b64 <_ZN13ConsoleKernel4getcEv>:

// Get a character from the input buffer
char ConsoleKernel::getc(){
    80001b64:	fe010113          	addi	sp,sp,-32
    80001b68:	00113c23          	sd	ra,24(sp)
    80001b6c:	00813823          	sd	s0,16(sp)
    80001b70:	00913423          	sd	s1,8(sp)
    80001b74:	01213023          	sd	s2,0(sp)
    80001b78:	02010413          	addi	s0,sp,32
    80001b7c:	0000a797          	auipc	a5,0xa
    80001b80:	de47b783          	ld	a5,-540(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001b84:	02078663          	beqz	a5,80001bb0 <_ZN13ConsoleKernel4getcEv+0x4c>
    return ConsoleKernel::get()->input.get();
    80001b88:	0000a517          	auipc	a0,0xa
    80001b8c:	dd853503          	ld	a0,-552(a0) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001b90:	00000097          	auipc	ra,0x0
    80001b94:	4ac080e7          	jalr	1196(ra) # 8000203c <_ZN12BufferKernel3getEv>
}
    80001b98:	01813083          	ld	ra,24(sp)
    80001b9c:	01013403          	ld	s0,16(sp)
    80001ba0:	00813483          	ld	s1,8(sp)
    80001ba4:	00013903          	ld	s2,0(sp)
    80001ba8:	02010113          	addi	sp,sp,32
    80001bac:	00008067          	ret
    80001bb0:	12000513          	li	a0,288
    80001bb4:	00001097          	auipc	ra,0x1
    80001bb8:	854080e7          	jalr	-1964(ra) # 80002408 <_Znwm>
    80001bbc:	00050493          	mv	s1,a0
    BufferKernel(): head(0), tail(0), size(0){
    80001bc0:	00052023          	sw	zero,0(a0)
    80001bc4:	00052223          	sw	zero,4(a0)
    80001bc8:	00052423          	sw	zero,8(a0)
        sem_open(&mutexSem, 1);
    80001bcc:	00100593          	li	a1,1
    80001bd0:	07050513          	addi	a0,a0,112
    80001bd4:	00000097          	auipc	ra,0x0
    80001bd8:	93c080e7          	jalr	-1732(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80001bdc:	06400593          	li	a1,100
    80001be0:	07848513          	addi	a0,s1,120
    80001be4:	00000097          	auipc	ra,0x0
    80001be8:	92c080e7          	jalr	-1748(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80001bec:	00000593          	li	a1,0
    80001bf0:	08048513          	addi	a0,s1,128
    80001bf4:	00000097          	auipc	ra,0x0
    80001bf8:	91c080e7          	jalr	-1764(ra) # 80001510 <_Z8sem_openPP4_semj>
    BufferKernel(): head(0), tail(0), size(0){
    80001bfc:	0804a423          	sw	zero,136(s1)
    80001c00:	0804a623          	sw	zero,140(s1)
    80001c04:	0804a823          	sw	zero,144(s1)
        sem_open(&mutexSem, 1);
    80001c08:	00100593          	li	a1,1
    80001c0c:	0f848513          	addi	a0,s1,248
    80001c10:	00000097          	auipc	ra,0x0
    80001c14:	900080e7          	jalr	-1792(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80001c18:	06400593          	li	a1,100
    80001c1c:	10048513          	addi	a0,s1,256
    80001c20:	00000097          	auipc	ra,0x0
    80001c24:	8f0080e7          	jalr	-1808(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80001c28:	00000593          	li	a1,0
    80001c2c:	10848513          	addi	a0,s1,264
    80001c30:	00000097          	auipc	ra,0x0
    80001c34:	8e0080e7          	jalr	-1824(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&getSem,0);
    80001c38:	00000593          	li	a1,0
    80001c3c:	11048513          	addi	a0,s1,272
    80001c40:	00000097          	auipc	ra,0x0
    80001c44:	8d0080e7          	jalr	-1840(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&putSem,0);
    80001c48:	00000593          	li	a1,0
    80001c4c:	11848513          	addi	a0,s1,280
    80001c50:	00000097          	auipc	ra,0x0
    80001c54:	8c0080e7          	jalr	-1856(ra) # 80001510 <_Z8sem_openPP4_semj>
        if(!instance) instance = new ConsoleKernel();
    80001c58:	0000a797          	auipc	a5,0xa
    80001c5c:	d097b423          	sd	s1,-760(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001c60:	f29ff06f          	j	80001b88 <_ZN13ConsoleKernel4getcEv+0x24>
    80001c64:	00050913          	mv	s2,a0
    80001c68:	00048513          	mv	a0,s1
    80001c6c:	00000097          	auipc	ra,0x0
    80001c70:	7ec080e7          	jalr	2028(ra) # 80002458 <_ZdlPv>
    80001c74:	00090513          	mv	a0,s2
    80001c78:	0000b097          	auipc	ra,0xb
    80001c7c:	e40080e7          	jalr	-448(ra) # 8000cab8 <_Unwind_Resume>

0000000080001c80 <_ZN13ConsoleKernel4putcEc>:

// Put a character in the output buffer
void ConsoleKernel::putc(char putchar){
    80001c80:	fd010113          	addi	sp,sp,-48
    80001c84:	02113423          	sd	ra,40(sp)
    80001c88:	02813023          	sd	s0,32(sp)
    80001c8c:	00913c23          	sd	s1,24(sp)
    80001c90:	01213823          	sd	s2,16(sp)
    80001c94:	01313423          	sd	s3,8(sp)
    80001c98:	03010413          	addi	s0,sp,48
    80001c9c:	00050493          	mv	s1,a0
    80001ca0:	0000a797          	auipc	a5,0xa
    80001ca4:	cc07b783          	ld	a5,-832(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001ca8:	02078c63          	beqz	a5,80001ce0 <_ZN13ConsoleKernel4putcEc+0x60>
    ConsoleKernel::get()->output.put(putchar);
    80001cac:	00048593          	mv	a1,s1
    80001cb0:	0000a517          	auipc	a0,0xa
    80001cb4:	cb053503          	ld	a0,-848(a0) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001cb8:	08850513          	addi	a0,a0,136
    80001cbc:	00000097          	auipc	ra,0x0
    80001cc0:	410080e7          	jalr	1040(ra) # 800020cc <_ZN12BufferKernel3putEc>
    80001cc4:	02813083          	ld	ra,40(sp)
    80001cc8:	02013403          	ld	s0,32(sp)
    80001ccc:	01813483          	ld	s1,24(sp)
    80001cd0:	01013903          	ld	s2,16(sp)
    80001cd4:	00813983          	ld	s3,8(sp)
    80001cd8:	03010113          	addi	sp,sp,48
    80001cdc:	00008067          	ret
    80001ce0:	12000513          	li	a0,288
    80001ce4:	00000097          	auipc	ra,0x0
    80001ce8:	724080e7          	jalr	1828(ra) # 80002408 <_Znwm>
    80001cec:	00050913          	mv	s2,a0
    BufferKernel(): head(0), tail(0), size(0){
    80001cf0:	00052023          	sw	zero,0(a0)
    80001cf4:	00052223          	sw	zero,4(a0)
    80001cf8:	00052423          	sw	zero,8(a0)
        sem_open(&mutexSem, 1);
    80001cfc:	00100593          	li	a1,1
    80001d00:	07050513          	addi	a0,a0,112
    80001d04:	00000097          	auipc	ra,0x0
    80001d08:	80c080e7          	jalr	-2036(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80001d0c:	06400593          	li	a1,100
    80001d10:	07890513          	addi	a0,s2,120
    80001d14:	fffff097          	auipc	ra,0xfffff
    80001d18:	7fc080e7          	jalr	2044(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80001d1c:	00000593          	li	a1,0
    80001d20:	08090513          	addi	a0,s2,128
    80001d24:	fffff097          	auipc	ra,0xfffff
    80001d28:	7ec080e7          	jalr	2028(ra) # 80001510 <_Z8sem_openPP4_semj>
    BufferKernel(): head(0), tail(0), size(0){
    80001d2c:	08092423          	sw	zero,136(s2)
    80001d30:	08092623          	sw	zero,140(s2)
    80001d34:	08092823          	sw	zero,144(s2)
        sem_open(&mutexSem, 1);
    80001d38:	00100593          	li	a1,1
    80001d3c:	0f890513          	addi	a0,s2,248
    80001d40:	fffff097          	auipc	ra,0xfffff
    80001d44:	7d0080e7          	jalr	2000(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80001d48:	06400593          	li	a1,100
    80001d4c:	10090513          	addi	a0,s2,256
    80001d50:	fffff097          	auipc	ra,0xfffff
    80001d54:	7c0080e7          	jalr	1984(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80001d58:	00000593          	li	a1,0
    80001d5c:	10890513          	addi	a0,s2,264
    80001d60:	fffff097          	auipc	ra,0xfffff
    80001d64:	7b0080e7          	jalr	1968(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&getSem,0);
    80001d68:	00000593          	li	a1,0
    80001d6c:	11090513          	addi	a0,s2,272
    80001d70:	fffff097          	auipc	ra,0xfffff
    80001d74:	7a0080e7          	jalr	1952(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&putSem,0);
    80001d78:	00000593          	li	a1,0
    80001d7c:	11890513          	addi	a0,s2,280
    80001d80:	fffff097          	auipc	ra,0xfffff
    80001d84:	790080e7          	jalr	1936(ra) # 80001510 <_Z8sem_openPP4_semj>
        if(!instance) instance = new ConsoleKernel();
    80001d88:	0000a797          	auipc	a5,0xa
    80001d8c:	bd27bc23          	sd	s2,-1064(a5) # 8000b960 <_ZN13ConsoleKernel8instanceE>
    80001d90:	f1dff06f          	j	80001cac <_ZN13ConsoleKernel4putcEc+0x2c>
    80001d94:	00050493          	mv	s1,a0
    80001d98:	00090513          	mv	a0,s2
    80001d9c:	00000097          	auipc	ra,0x0
    80001da0:	6bc080e7          	jalr	1724(ra) # 80002458 <_ZdlPv>
    80001da4:	00048513          	mv	a0,s1
    80001da8:	0000b097          	auipc	ra,0xb
    80001dac:	d10080e7          	jalr	-752(ra) # 8000cab8 <_Unwind_Resume>

0000000080001db0 <_Z17kernelPrintStringPKc>:
//ideja preuzeta sa online vezbi
#include "../h/PrintKernel.hpp"
#include "../h/riscv.hpp"
//#include "../lib/console.h"
void kernelPrintString(char const *string)
{
    80001db0:	fe010113          	addi	sp,sp,-32
    80001db4:	00113c23          	sd	ra,24(sp)
    80001db8:	00813823          	sd	s0,16(sp)
    80001dbc:	00913423          	sd	s1,8(sp)
    80001dc0:	02010413          	addi	s0,sp,32
    80001dc4:	00050493          	mv	s1,a0
//    uint64 sstatus = riscv::r_sstatus();
//    riscv::mc_sstatus(riscv::SSTATUS_SIE);
    while (*string != '\0')
    80001dc8:	0004c503          	lbu	a0,0(s1)
    80001dcc:	00050a63          	beqz	a0,80001de0 <_Z17kernelPrintStringPKc+0x30>
    {
        putc(*string);
    80001dd0:	00000097          	auipc	ra,0x0
    80001dd4:	898080e7          	jalr	-1896(ra) # 80001668 <_Z4putcc>
        string++;
    80001dd8:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80001ddc:	fedff06f          	j	80001dc8 <_Z17kernelPrintStringPKc+0x18>
    }
//    riscv::ms_sstatus(sstatus & riscv::SSTATUS_SIE? riscv::SSTATUS_SIE:0);
}
    80001de0:	01813083          	ld	ra,24(sp)
    80001de4:	01013403          	ld	s0,16(sp)
    80001de8:	00813483          	ld	s1,8(sp)
    80001dec:	02010113          	addi	sp,sp,32
    80001df0:	00008067          	ret

0000000080001df4 <_Z18kernelPrintIntegerm>:

void kernelPrintInteger(uint64 integer)
{
    80001df4:	fd010113          	addi	sp,sp,-48
    80001df8:	02113423          	sd	ra,40(sp)
    80001dfc:	02813023          	sd	s0,32(sp)
    80001e00:	00913c23          	sd	s1,24(sp)
    80001e04:	03010413          	addi	s0,sp,48
    {
        neg = 1;
        x = -integer;
    } else
    {
        x = integer;
    80001e08:	0005051b          	sext.w	a0,a0
    }

    i = 0;
    80001e0c:	00000493          	li	s1,0
    do
    {
        buf[i++] = digits[x % 10];
    80001e10:	00a00613          	li	a2,10
    80001e14:	02c5773b          	remuw	a4,a0,a2
    80001e18:	02071693          	slli	a3,a4,0x20
    80001e1c:	0206d693          	srli	a3,a3,0x20
    80001e20:	00007717          	auipc	a4,0x7
    80001e24:	20070713          	addi	a4,a4,512 # 80009020 <_ZZ18kernelPrintIntegermE6digits>
    80001e28:	00d70733          	add	a4,a4,a3
    80001e2c:	00074703          	lbu	a4,0(a4)
    80001e30:	fe040693          	addi	a3,s0,-32
    80001e34:	009687b3          	add	a5,a3,s1
    80001e38:	0014849b          	addiw	s1,s1,1
    80001e3c:	fee78823          	sb	a4,-16(a5)
    } while ((x /= 10) != 0);
    80001e40:	0005071b          	sext.w	a4,a0
    80001e44:	02c5553b          	divuw	a0,a0,a2
    80001e48:	00900793          	li	a5,9
    80001e4c:	fce7e2e3          	bltu	a5,a4,80001e10 <_Z18kernelPrintIntegerm+0x1c>
    if (neg)
        buf[i++] = '-';

    while (--i >= 0) { putc(buf[i]); }
    80001e50:	fff4849b          	addiw	s1,s1,-1
    80001e54:	0004ce63          	bltz	s1,80001e70 <_Z18kernelPrintIntegerm+0x7c>
    80001e58:	fe040793          	addi	a5,s0,-32
    80001e5c:	009787b3          	add	a5,a5,s1
    80001e60:	ff07c503          	lbu	a0,-16(a5)
    80001e64:	00000097          	auipc	ra,0x0
    80001e68:	804080e7          	jalr	-2044(ra) # 80001668 <_Z4putcc>
    80001e6c:	fe5ff06f          	j	80001e50 <_Z18kernelPrintIntegerm+0x5c>
//    riscv::ms_sstatus(sstatus & riscv::SSTATUS_SIE? riscv::SSTATUS_SIE:0);
}
    80001e70:	02813083          	ld	ra,40(sp)
    80001e74:	02013403          	ld	s0,32(sp)
    80001e78:	01813483          	ld	s1,24(sp)
    80001e7c:	03010113          	addi	sp,sp,48
    80001e80:	00008067          	ret

0000000080001e84 <_ZN4List7addLastEP3TCB>:

#include "../h/list.hpp"
#include "../h/TCB.hpp"

void List::addLast(TCB* data)
{
    80001e84:	ff010113          	addi	sp,sp,-16
    80001e88:	00813423          	sd	s0,8(sp)
    80001e8c:	01010413          	addi	s0,sp,16
    data->next = 0;
    80001e90:	0005b023          	sd	zero,0(a1)
    if (tail)
    80001e94:	00853783          	ld	a5,8(a0)
    80001e98:	00078c63          	beqz	a5,80001eb0 <_ZN4List7addLastEP3TCB+0x2c>
    {
        tail->next = data;
    80001e9c:	00b7b023          	sd	a1,0(a5)
        tail = data;
    80001ea0:	00b53423          	sd	a1,8(a0)
    } else head = tail = data;

}
    80001ea4:	00813403          	ld	s0,8(sp)
    80001ea8:	01010113          	addi	sp,sp,16
    80001eac:	00008067          	ret
    } else head = tail = data;
    80001eb0:	00b53423          	sd	a1,8(a0)
    80001eb4:	00b53023          	sd	a1,0(a0)
}
    80001eb8:	fedff06f          	j	80001ea4 <_ZN4List7addLastEP3TCB+0x20>

0000000080001ebc <_ZN4List11removeFirstEv>:

TCB* List::removeFirst()
{
    80001ebc:	ff010113          	addi	sp,sp,-16
    80001ec0:	00813423          	sd	s0,8(sp)
    80001ec4:	01010413          	addi	s0,sp,16
    80001ec8:	00050793          	mv	a5,a0
    if (!head) return 0;
    80001ecc:	00053503          	ld	a0,0(a0)
    80001ed0:	00050863          	beqz	a0,80001ee0 <_ZN4List11removeFirstEv+0x24>

    TCB* elem = head;
    head = head->next;
    80001ed4:	00053703          	ld	a4,0(a0)
    80001ed8:	00e7b023          	sd	a4,0(a5)
    if (!head) tail = 0;
    80001edc:	00070863          	beqz	a4,80001eec <_ZN4List11removeFirstEv+0x30>

    return elem;
    80001ee0:	00813403          	ld	s0,8(sp)
    80001ee4:	01010113          	addi	sp,sp,16
    80001ee8:	00008067          	ret
    if (!head) tail = 0;
    80001eec:	0007b423          	sd	zero,8(a5)
    80001ef0:	ff1ff06f          	j	80001ee0 <_ZN4List11removeFirstEv+0x24>

0000000080001ef4 <_ZN8sleeping3putEP3TCBi>:
#include "../h/sleeping.hpp"
#include "../h/TCB.hpp"
TCB* sleeping::head = nullptr;

int sleeping::put(TCB *thrd, int sleep_time)
{
    80001ef4:	ff010113          	addi	sp,sp,-16
    80001ef8:	00813423          	sd	s0,8(sp)
    80001efc:	01010413          	addi	s0,sp,16
    // Exceptional situation check
    if(sleep_time < 0) return -1;
    80001f00:	0805ca63          	bltz	a1,80001f94 <_ZN8sleeping3putEP3TCBi+0xa0>
    if(thrd == nullptr) return -1;
    80001f04:	08050c63          	beqz	a0,80001f9c <_ZN8sleeping3putEP3TCBi+0xa8>
    if(sleep_time == 0) return 0;
    80001f08:	08058e63          	beqz	a1,80001fa4 <_ZN8sleeping3putEP3TCBi+0xb0>
    bool isBlocked() const { return this->state == BLOCKED; }
    void setBlocked(bool blocked) { this->state = blocked?BLOCKED:RUNNING; }

    // Sleeping
    bool isSleeping() const { return this->state == SLEEPING;}
    void setSleeping(bool sleeping) { this->state = sleeping?SLEEPING:RUNNING; }
    80001f0c:	00300793          	li	a5,3
    80001f10:	02f52423          	sw	a5,40(a0)

    // Initialize data
    thrd->setSleeping(true);
    thrd->next = nullptr;
    80001f14:	00053023          	sd	zero,0(a0)

    // Check if list is empty
    if(head == nullptr){
    80001f18:	0000a797          	auipc	a5,0xa
    80001f1c:	a507b783          	ld	a5,-1456(a5) # 8000b968 <_ZN8sleeping4headE>
    80001f20:	02078263          	beqz	a5,80001f44 <_ZN8sleeping3putEP3TCBi+0x50>
    // we go through all of them
    int compareTime = 0;

    // prethodni is a thread just before the current one in for loop.
    // temp is the current thread in for loop.
    TCB* prethodni = 0;
    80001f24:	00000693          	li	a3,0
    TCB* temp = head;

    // Main Algorithm
    for(;temp != nullptr; temp = temp->next){
    80001f28:	04078e63          	beqz	a5,80001f84 <_ZN8sleeping3putEP3TCBi+0x90>
    // Running
    bool isRunning(){ return this->state == RUNNING;}

    // Sleep time
    void setSleepTime(int time1) { this->sleep_time = time1; }
    int getSleepTime() { return this->sleep_time; }
    80001f2c:	0407a703          	lw	a4,64(a5)
        compareTime = temp->getSleepTime();
        if(time2 <= compareTime){
    80001f30:	02b75463          	bge	a4,a1,80001f58 <_ZN8sleeping3putEP3TCBi+0x64>
//                if (temp->getSleepTime() == 0) break;
//            }
            temp->setSleepTime(compareTime-time2);
            return 0;
        }
        time2 -= compareTime;
    80001f34:	40e585bb          	subw	a1,a1,a4
        prethodni = temp;
    80001f38:	00078693          	mv	a3,a5
    for(;temp != nullptr; temp = temp->next){
    80001f3c:	0007b783          	ld	a5,0(a5)
    80001f40:	fe9ff06f          	j	80001f28 <_ZN8sleeping3putEP3TCBi+0x34>
    void setSleepTime(int time1) { this->sleep_time = time1; }
    80001f44:	04b52023          	sw	a1,64(a0)
        head = thrd;
    80001f48:	0000a797          	auipc	a5,0xa
    80001f4c:	a2a7b023          	sd	a0,-1504(a5) # 8000b968 <_ZN8sleeping4headE>
        return 0;
    80001f50:	00000513          	li	a0,0
    80001f54:	0540006f          	j	80001fa8 <_ZN8sleeping3putEP3TCBi+0xb4>
    80001f58:	04b52023          	sw	a1,64(a0)
            thrd->next = temp;
    80001f5c:	00f53023          	sd	a5,0(a0)
            (prethodni? prethodni->next:head) = thrd;
    80001f60:	00068c63          	beqz	a3,80001f78 <_ZN8sleeping3putEP3TCBi+0x84>
    80001f64:	00a6b023          	sd	a0,0(a3)
            temp->setSleepTime(compareTime-time2);
    80001f68:	40b705bb          	subw	a1,a4,a1
    80001f6c:	04b7a023          	sw	a1,64(a5)
            return 0;
    80001f70:	00000513          	li	a0,0
    80001f74:	0340006f          	j	80001fa8 <_ZN8sleeping3putEP3TCBi+0xb4>
            (prethodni? prethodni->next:head) = thrd;
    80001f78:	0000a697          	auipc	a3,0xa
    80001f7c:	9ea6b823          	sd	a0,-1552(a3) # 8000b968 <_ZN8sleeping4headE>
    80001f80:	fe9ff06f          	j	80001f68 <_ZN8sleeping3putEP3TCBi+0x74>
    80001f84:	04b52023          	sw	a1,64(a0)

    // If we get to this section of the code, it means that there is no thread in
    // sleeping list with larger sleeping time, which means that we put our thread at
    // the end of the list.
    thrd->setSleepTime(time2);
    prethodni->next = thrd;
    80001f88:	00a6b023          	sd	a0,0(a3)

    return 0;
    80001f8c:	00000513          	li	a0,0
    80001f90:	0180006f          	j	80001fa8 <_ZN8sleeping3putEP3TCBi+0xb4>
    if(sleep_time < 0) return -1;
    80001f94:	fff00513          	li	a0,-1
    80001f98:	0100006f          	j	80001fa8 <_ZN8sleeping3putEP3TCBi+0xb4>
    if(thrd == nullptr) return -1;
    80001f9c:	fff00513          	li	a0,-1
    80001fa0:	0080006f          	j	80001fa8 <_ZN8sleeping3putEP3TCBi+0xb4>
    if(sleep_time == 0) return 0;
    80001fa4:	00058513          	mv	a0,a1
}
    80001fa8:	00813403          	ld	s0,8(sp)
    80001fac:	01010113          	addi	sp,sp,16
    80001fb0:	00008067          	ret

0000000080001fb4 <_ZN8sleeping12timeDecreaseEv>:

void sleeping::timeDecrease() {
    // Check if sleeping list is empty
    if(head == nullptr) return;
    80001fb4:	0000a517          	auipc	a0,0xa
    80001fb8:	9b453503          	ld	a0,-1612(a0) # 8000b968 <_ZN8sleeping4headE>
    80001fbc:	06050e63          	beqz	a0,80002038 <_ZN8sleeping12timeDecreaseEv+0x84>
    int getSleepTime() { return this->sleep_time; }
    80001fc0:	04052783          	lw	a5,64(a0)

    // Update sleep time of the first thread in list
    int sleeptime = head->getSleepTime();
    sleeptime--;
    80001fc4:	fff7879b          	addiw	a5,a5,-1
    void setSleepTime(int time1) { this->sleep_time = time1; }
    80001fc8:	04f52023          	sw	a5,64(a0)

    // temp is the current thread in the sleeping list as we go through all of them
    TCB* temp = head;
    while (true){
        // Check if we reached the end of the list
        if(temp == nullptr) break;
    80001fcc:	06050663          	beqz	a0,80002038 <_ZN8sleeping12timeDecreaseEv+0x84>
    int getSleepTime() { return this->sleep_time; }
    80001fd0:	04052783          	lw	a5,64(a0)

        sleeptime = temp->getSleepTime();
        if(sleeptime <= 0){ // We can put == as well, this just makes it more secure
    80001fd4:	06f04263          	bgtz	a5,80002038 <_ZN8sleeping12timeDecreaseEv+0x84>
void sleeping::timeDecrease() {
    80001fd8:	fe010113          	addi	sp,sp,-32
    80001fdc:	00113c23          	sd	ra,24(sp)
    80001fe0:	00813823          	sd	s0,16(sp)
    80001fe4:	00913423          	sd	s1,8(sp)
    80001fe8:	02010413          	addi	s0,sp,32
    80001fec:	00c0006f          	j	80001ff8 <_ZN8sleeping12timeDecreaseEv+0x44>
    80001ff0:	04052783          	lw	a5,64(a0)
        if(sleeptime <= 0){ // We can put == as well, this just makes it more secure
    80001ff4:	02f04863          	bgtz	a5,80002024 <_ZN8sleeping12timeDecreaseEv+0x70>
    void setSleeping(bool sleeping) { this->state = sleeping?SLEEPING:RUNNING; }
    80001ff8:	00100793          	li	a5,1
    80001ffc:	02f52423          	sw	a5,40(a0)
            // Putting the sleeping thread back in scheduler
            temp->setSleeping(false);
            head = temp->next;
    80002000:	00053783          	ld	a5,0(a0)
    80002004:	0000a497          	auipc	s1,0xa
    80002008:	96448493          	addi	s1,s1,-1692 # 8000b968 <_ZN8sleeping4headE>
    8000200c:	00f4b023          	sd	a5,0(s1)
            temp->next = 0;
    80002010:	00053023          	sd	zero,0(a0)
            Scheduler::put(temp);
    80002014:	00000097          	auipc	ra,0x0
    80002018:	1b8080e7          	jalr	440(ra) # 800021cc <_ZN9Scheduler3putEP3TCB>
            temp = head;
    8000201c:	0004b503          	ld	a0,0(s1)
        if(temp == nullptr) break;
    80002020:	fc0518e3          	bnez	a0,80001ff0 <_ZN8sleeping12timeDecreaseEv+0x3c>
        } else break;
    }
    80002024:	01813083          	ld	ra,24(sp)
    80002028:	01013403          	ld	s0,16(sp)
    8000202c:	00813483          	ld	s1,8(sp)
    80002030:	02010113          	addi	sp,sp,32
    80002034:	00008067          	ret
    80002038:	00008067          	ret

000000008000203c <_ZN12BufferKernel3getEv>:
//

#include "../h/BufferKernel.hpp"


char BufferKernel::get(){
    8000203c:	fe010113          	addi	sp,sp,-32
    80002040:	00113c23          	sd	ra,24(sp)
    80002044:	00813823          	sd	s0,16(sp)
    80002048:	00913423          	sd	s1,8(sp)
    8000204c:	01213023          	sd	s2,0(sp)
    80002050:	02010413          	addi	s0,sp,32
    80002054:	00050493          	mv	s1,a0

    sem_wait(charGetAv);
    80002058:	08053503          	ld	a0,128(a0)
    8000205c:	fffff097          	auipc	ra,0xfffff
    80002060:	530080e7          	jalr	1328(ra) # 8000158c <_Z8sem_waitP4_sem>
    sem_wait(mutexSem);
    80002064:	0704b503          	ld	a0,112(s1)
    80002068:	fffff097          	auipc	ra,0xfffff
    8000206c:	524080e7          	jalr	1316(ra) # 8000158c <_Z8sem_waitP4_sem>
    char ret = buffer[head];
    80002070:	0004a783          	lw	a5,0(s1)
    80002074:	00f48733          	add	a4,s1,a5
    80002078:	00c74903          	lbu	s2,12(a4)
    head++;
    8000207c:	0017879b          	addiw	a5,a5,1
    head %= maxSize;
    80002080:	06400713          	li	a4,100
    80002084:	02e7e7bb          	remw	a5,a5,a4
    80002088:	00f4a023          	sw	a5,0(s1)
    size--;
    8000208c:	0084a783          	lw	a5,8(s1)
    80002090:	fff7879b          	addiw	a5,a5,-1
    80002094:	00f4a423          	sw	a5,8(s1)

    sem_signal(mutexSem);
    80002098:	0704b503          	ld	a0,112(s1)
    8000209c:	fffff097          	auipc	ra,0xfffff
    800020a0:	528080e7          	jalr	1320(ra) # 800015c4 <_Z10sem_signalP4_sem>
    sem_signal(spacePutAv);
    800020a4:	0784b503          	ld	a0,120(s1)
    800020a8:	fffff097          	auipc	ra,0xfffff
    800020ac:	51c080e7          	jalr	1308(ra) # 800015c4 <_Z10sem_signalP4_sem>

    return ret;
}
    800020b0:	00090513          	mv	a0,s2
    800020b4:	01813083          	ld	ra,24(sp)
    800020b8:	01013403          	ld	s0,16(sp)
    800020bc:	00813483          	ld	s1,8(sp)
    800020c0:	00013903          	ld	s2,0(sp)
    800020c4:	02010113          	addi	sp,sp,32
    800020c8:	00008067          	ret

00000000800020cc <_ZN12BufferKernel3putEc>:

void BufferKernel::put(char putChar){
    800020cc:	fe010113          	addi	sp,sp,-32
    800020d0:	00113c23          	sd	ra,24(sp)
    800020d4:	00813823          	sd	s0,16(sp)
    800020d8:	00913423          	sd	s1,8(sp)
    800020dc:	01213023          	sd	s2,0(sp)
    800020e0:	02010413          	addi	s0,sp,32
    800020e4:	00050493          	mv	s1,a0
    800020e8:	00058913          	mv	s2,a1

    sem_wait(spacePutAv);
    800020ec:	07853503          	ld	a0,120(a0)
    800020f0:	fffff097          	auipc	ra,0xfffff
    800020f4:	49c080e7          	jalr	1180(ra) # 8000158c <_Z8sem_waitP4_sem>
    sem_wait(mutexSem);
    800020f8:	0704b503          	ld	a0,112(s1)
    800020fc:	fffff097          	auipc	ra,0xfffff
    80002100:	490080e7          	jalr	1168(ra) # 8000158c <_Z8sem_waitP4_sem>
    buffer[tail] = putChar;
    80002104:	0044a783          	lw	a5,4(s1)
    80002108:	00f48733          	add	a4,s1,a5
    8000210c:	01270623          	sb	s2,12(a4)
    tail++;
    80002110:	0017879b          	addiw	a5,a5,1
    tail %= maxSize;
    80002114:	06400713          	li	a4,100
    80002118:	02e7e7bb          	remw	a5,a5,a4
    8000211c:	00f4a223          	sw	a5,4(s1)
    size++;
    80002120:	0084a783          	lw	a5,8(s1)
    80002124:	0017879b          	addiw	a5,a5,1
    80002128:	00f4a423          	sw	a5,8(s1)
    sem_signal(mutexSem);
    8000212c:	0704b503          	ld	a0,112(s1)
    80002130:	fffff097          	auipc	ra,0xfffff
    80002134:	494080e7          	jalr	1172(ra) # 800015c4 <_Z10sem_signalP4_sem>
    sem_signal(charGetAv);
    80002138:	0804b503          	ld	a0,128(s1)
    8000213c:	fffff097          	auipc	ra,0xfffff
    80002140:	488080e7          	jalr	1160(ra) # 800015c4 <_Z10sem_signalP4_sem>
    80002144:	01813083          	ld	ra,24(sp)
    80002148:	01013403          	ld	s0,16(sp)
    8000214c:	00813483          	ld	s1,8(sp)
    80002150:	00013903          	ld	s2,0(sp)
    80002154:	02010113          	addi	sp,sp,32
    80002158:	00008067          	ret

000000008000215c <_Z41__static_initialization_and_destruction_0ii>:
    return readyThreadQueue.removeFirst();
}

void Scheduler::put(TCB* tcb){
    readyThreadQueue.addLast(tcb);
    8000215c:	ff010113          	addi	sp,sp,-16
    80002160:	00813423          	sd	s0,8(sp)
    80002164:	01010413          	addi	s0,sp,16
    80002168:	00100793          	li	a5,1
    8000216c:	00f50863          	beq	a0,a5,8000217c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80002170:	00813403          	ld	s0,8(sp)
    80002174:	01010113          	addi	sp,sp,16
    80002178:	00008067          	ret
    8000217c:	000107b7          	lui	a5,0x10
    80002180:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002184:	fef596e3          	bne	a1,a5,80002170 <_Z41__static_initialization_and_destruction_0ii+0x14>

class List{
    TCB* head;
    TCB* tail;
public:
    List() : head(0), tail(0) {}
    80002188:	00009797          	auipc	a5,0x9
    8000218c:	7e878793          	addi	a5,a5,2024 # 8000b970 <_ZN9Scheduler16readyThreadQueueE>
    80002190:	0007b023          	sd	zero,0(a5)
    80002194:	0007b423          	sd	zero,8(a5)
    80002198:	fd9ff06f          	j	80002170 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000219c <_ZN9Scheduler3getEv>:
TCB* Scheduler::get(){
    8000219c:	ff010113          	addi	sp,sp,-16
    800021a0:	00113423          	sd	ra,8(sp)
    800021a4:	00813023          	sd	s0,0(sp)
    800021a8:	01010413          	addi	s0,sp,16
    return readyThreadQueue.removeFirst();
    800021ac:	00009517          	auipc	a0,0x9
    800021b0:	7c450513          	addi	a0,a0,1988 # 8000b970 <_ZN9Scheduler16readyThreadQueueE>
    800021b4:	00000097          	auipc	ra,0x0
    800021b8:	d08080e7          	jalr	-760(ra) # 80001ebc <_ZN4List11removeFirstEv>
}
    800021bc:	00813083          	ld	ra,8(sp)
    800021c0:	00013403          	ld	s0,0(sp)
    800021c4:	01010113          	addi	sp,sp,16
    800021c8:	00008067          	ret

00000000800021cc <_ZN9Scheduler3putEP3TCB>:
void Scheduler::put(TCB* tcb){
    800021cc:	ff010113          	addi	sp,sp,-16
    800021d0:	00113423          	sd	ra,8(sp)
    800021d4:	00813023          	sd	s0,0(sp)
    800021d8:	01010413          	addi	s0,sp,16
    800021dc:	00050593          	mv	a1,a0
    readyThreadQueue.addLast(tcb);
    800021e0:	00009517          	auipc	a0,0x9
    800021e4:	79050513          	addi	a0,a0,1936 # 8000b970 <_ZN9Scheduler16readyThreadQueueE>
    800021e8:	00000097          	auipc	ra,0x0
    800021ec:	c9c080e7          	jalr	-868(ra) # 80001e84 <_ZN4List7addLastEP3TCB>
    800021f0:	00813083          	ld	ra,8(sp)
    800021f4:	00013403          	ld	s0,0(sp)
    800021f8:	01010113          	addi	sp,sp,16
    800021fc:	00008067          	ret

0000000080002200 <_GLOBAL__sub_I__ZN9Scheduler16readyThreadQueueE>:
    80002200:	ff010113          	addi	sp,sp,-16
    80002204:	00113423          	sd	ra,8(sp)
    80002208:	00813023          	sd	s0,0(sp)
    8000220c:	01010413          	addi	s0,sp,16
    80002210:	000105b7          	lui	a1,0x10
    80002214:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002218:	00100513          	li	a0,1
    8000221c:	00000097          	auipc	ra,0x0
    80002220:	f40080e7          	jalr	-192(ra) # 8000215c <_Z41__static_initialization_and_destruction_0ii>
    80002224:	00813083          	ld	ra,8(sp)
    80002228:	00013403          	ld	s0,0(sp)
    8000222c:	01010113          	addi	sp,sp,16
    80002230:	00008067          	ret

0000000080002234 <_Z10idleThreadPv>:
#include "../lib/hw.h"
#include "../h/syscall_c.hpp"
#include "../h/TCB.hpp"
#include "../h/riscv.hpp"

void idleThread (void*){
    80002234:	ff010113          	addi	sp,sp,-16
    80002238:	00113423          	sd	ra,8(sp)
    8000223c:	00813023          	sd	s0,0(sp)
    80002240:	01010413          	addi	s0,sp,16
    while(true)
        thread_dispatch();
    80002244:	fffff097          	auipc	ra,0xfffff
    80002248:	280080e7          	jalr	640(ra) # 800014c4 <_Z15thread_dispatchv>
    while(true)
    8000224c:	ff9ff06f          	j	80002244 <_Z10idleThreadPv+0x10>

0000000080002250 <_Z15userMainWrapperPv>:
}

void userMain();
void userMainWrapper(void*){
    80002250:	ff010113          	addi	sp,sp,-16
    80002254:	00113423          	sd	ra,8(sp)
    80002258:	00813023          	sd	s0,0(sp)
    8000225c:	01010413          	addi	s0,sp,16
    userMain();
    80002260:	00004097          	auipc	ra,0x4
    80002264:	f50080e7          	jalr	-176(ra) # 800061b0 <_Z8userMainv>
}
    80002268:	00813083          	ld	ra,8(sp)
    8000226c:	00013403          	ld	s0,0(sp)
    80002270:	01010113          	addi	sp,sp,16
    80002274:	00008067          	ret

0000000080002278 <main>:

extern "C" void interruptVector();

int main(){
    80002278:	fb010113          	addi	sp,sp,-80
    8000227c:	04113423          	sd	ra,72(sp)
    80002280:	04813023          	sd	s0,64(sp)
    80002284:	02913c23          	sd	s1,56(sp)
    80002288:	05010413          	addi	s0,sp,80
    // Setting the interrupt subroutine.
    riscv::w_stvec((uint64) &interruptVector|1UL);
    8000228c:	00009797          	auipc	a5,0x9
    80002290:	65c7b783          	ld	a5,1628(a5) # 8000b8e8 <_GLOBAL_OFFSET_TABLE_+0x40>
    80002294:	0017e793          	ori	a5,a5,1
        __asm__ volatile("csrr %[stvec], stvec" : [stvec] "=r"(stvec));
        return stvec;
    }
    //write stvec register
    static void w_stvec(uint64 stvec){
        __asm__ volatile("csrw stvec, %[stvec]": : [stvec] "r"(stvec));
    80002298:	10579073          	csrw	stvec,a5
    static void w_scratch(uint64 scratch) {
        __asm__ volatile("csrw scratch, %[scratch]": : [scratch] "r"(scratch));
    }

    static void ms_sstatus(uint64 mask) { // mask set sstatus
        __asm__ volatile("csrs sstatus, %[mask]"::[mask]"r"(mask));
    8000229c:	00200793          	li	a5,2
    800022a0:	1007a073          	csrs	sstatus,a5
    // Allowing interrupts
    riscv::ms_sstatus(riscv::SSTATUS_SIE);
    TCB* thread0; // main thread
    // Because the body is nullptr, this thread will not be put in the scheduler in the constructor.
    thread_create(&thread0, nullptr, nullptr);
    800022a4:	00000613          	li	a2,0
    800022a8:	00000593          	li	a1,0
    800022ac:	fd840513          	addi	a0,s0,-40
    800022b0:	fffff097          	auipc	ra,0xfffff
    800022b4:	158080e7          	jalr	344(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = thread0;
    800022b8:	fd843783          	ld	a5,-40(s0)
    800022bc:	00009717          	auipc	a4,0x9
    800022c0:	63473703          	ld	a4,1588(a4) # 8000b8f0 <_GLOBAL_OFFSET_TABLE_+0x48>
    800022c4:	00f73023          	sd	a5,0(a4)

    // System access
    void setSystemAccessFlag(){ this->systemAccessFlag = true; }
    800022c8:	00100713          	li	a4,1
    800022cc:	04e78c23          	sb	a4,88(a5)
    TCB::running->setSystemAccessFlag();
    TCB* thread1;
    thread_create(&thread1, &ConsoleKernel::putCharKernel,0);
    800022d0:	00000613          	li	a2,0
    800022d4:	00009597          	auipc	a1,0x9
    800022d8:	62c5b583          	ld	a1,1580(a1) # 8000b900 <_GLOBAL_OFFSET_TABLE_+0x58>
    800022dc:	fd040513          	addi	a0,s0,-48
    800022e0:	fffff097          	auipc	ra,0xfffff
    800022e4:	128080e7          	jalr	296(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB* thread2;
    thread_create(&thread2,&ConsoleKernel::getCharKernel,0);
    800022e8:	00000613          	li	a2,0
    800022ec:	00009597          	auipc	a1,0x9
    800022f0:	5dc5b583          	ld	a1,1500(a1) # 8000b8c8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800022f4:	fc840513          	addi	a0,s0,-56
    800022f8:	fffff097          	auipc	ra,0xfffff
    800022fc:	110080e7          	jalr	272(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    if(thread1); // prevents thread1 not used error
    if(thread2); // prevents thread2 not used error
    // idle thread
    thread_t thread3;
    thread_create(&thread3,&idleThread,nullptr);
    80002300:	00000613          	li	a2,0
    80002304:	00000597          	auipc	a1,0x0
    80002308:	f3058593          	addi	a1,a1,-208 # 80002234 <_Z10idleThreadPv>
    8000230c:	fc040513          	addi	a0,s0,-64
    80002310:	fffff097          	auipc	ra,0xfffff
    80002314:	0f8080e7          	jalr	248(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    if(thread3); // prevents thread3 not used error
    // userMain thread
    thread_t thread4;
    thread_create(&thread4,&userMainWrapper,nullptr);
    80002318:	00000613          	li	a2,0
    8000231c:	00000597          	auipc	a1,0x0
    80002320:	f3458593          	addi	a1,a1,-204 # 80002250 <_Z15userMainWrapperPv>
    80002324:	fb840513          	addi	a0,s0,-72
    80002328:	fffff097          	auipc	ra,0xfffff
    8000232c:	0e0080e7          	jalr	224(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_join(thread4);
    80002330:	fb843503          	ld	a0,-72(s0)
    80002334:	fffff097          	auipc	ra,0xfffff
    80002338:	1b4080e7          	jalr	436(ra) # 800014e8 <_Z11thread_joinP3TCB>

    delete thread0;
    8000233c:	fd843483          	ld	s1,-40(s0)
    80002340:	02048063          	beqz	s1,80002360 <main+0xe8>
    static void exit();

    static TCB* running;

    ~TCB(){
        if(stack)
    80002344:	0184b503          	ld	a0,24(s1)
    80002348:	00050663          	beqz	a0,80002354 <main+0xdc>
            delete[] stack;
    8000234c:	00000097          	auipc	ra,0x0
    80002350:	134080e7          	jalr	308(ra) # 80002480 <_ZdaPv>
    80002354:	00048513          	mv	a0,s1
    80002358:	00000097          	auipc	ra,0x0
    8000235c:	100080e7          	jalr	256(ra) # 80002458 <_ZdlPv>
    delete thread1;
    80002360:	fd043483          	ld	s1,-48(s0)
    80002364:	02048063          	beqz	s1,80002384 <main+0x10c>
        if(stack)
    80002368:	0184b503          	ld	a0,24(s1)
    8000236c:	00050663          	beqz	a0,80002378 <main+0x100>
            delete[] stack;
    80002370:	00000097          	auipc	ra,0x0
    80002374:	110080e7          	jalr	272(ra) # 80002480 <_ZdaPv>
    80002378:	00048513          	mv	a0,s1
    8000237c:	00000097          	auipc	ra,0x0
    80002380:	0dc080e7          	jalr	220(ra) # 80002458 <_ZdlPv>
    delete thread2;
    80002384:	fc843483          	ld	s1,-56(s0)
    80002388:	02048063          	beqz	s1,800023a8 <main+0x130>
        if(stack)
    8000238c:	0184b503          	ld	a0,24(s1)
    80002390:	00050663          	beqz	a0,8000239c <main+0x124>
            delete[] stack;
    80002394:	00000097          	auipc	ra,0x0
    80002398:	0ec080e7          	jalr	236(ra) # 80002480 <_ZdaPv>
    8000239c:	00048513          	mv	a0,s1
    800023a0:	00000097          	auipc	ra,0x0
    800023a4:	0b8080e7          	jalr	184(ra) # 80002458 <_ZdlPv>
    delete thread3;
    800023a8:	fc043483          	ld	s1,-64(s0)
    800023ac:	02048063          	beqz	s1,800023cc <main+0x154>
        if(stack)
    800023b0:	0184b503          	ld	a0,24(s1)
    800023b4:	00050663          	beqz	a0,800023c0 <main+0x148>
            delete[] stack;
    800023b8:	00000097          	auipc	ra,0x0
    800023bc:	0c8080e7          	jalr	200(ra) # 80002480 <_ZdaPv>
    800023c0:	00048513          	mv	a0,s1
    800023c4:	00000097          	auipc	ra,0x0
    800023c8:	094080e7          	jalr	148(ra) # 80002458 <_ZdlPv>
    delete thread4;
    800023cc:	fb843483          	ld	s1,-72(s0)
    800023d0:	02048063          	beqz	s1,800023f0 <main+0x178>
        if(stack)
    800023d4:	0184b503          	ld	a0,24(s1)
    800023d8:	00050663          	beqz	a0,800023e4 <main+0x16c>
            delete[] stack;
    800023dc:	00000097          	auipc	ra,0x0
    800023e0:	0a4080e7          	jalr	164(ra) # 80002480 <_ZdaPv>
    800023e4:	00048513          	mv	a0,s1
    800023e8:	00000097          	auipc	ra,0x0
    800023ec:	070080e7          	jalr	112(ra) # 80002458 <_ZdlPv>

    return 0;
    800023f0:	00000513          	li	a0,0
    800023f4:	04813083          	ld	ra,72(sp)
    800023f8:	04013403          	ld	s0,64(sp)
    800023fc:	03813483          	ld	s1,56(sp)
    80002400:	05010113          	addi	sp,sp,80
    80002404:	00008067          	ret

0000000080002408 <_Znwm>:

//#include "../lib/mem.h"
#include "../h/syscall_c.hpp"

void *operator new(size_t n)
{
    80002408:	ff010113          	addi	sp,sp,-16
    8000240c:	00113423          	sd	ra,8(sp)
    80002410:	00813023          	sd	s0,0(sp)
    80002414:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80002418:	fffff097          	auipc	ra,0xfffff
    8000241c:	f74080e7          	jalr	-140(ra) # 8000138c <_Z9mem_allocm>
}
    80002420:	00813083          	ld	ra,8(sp)
    80002424:	00013403          	ld	s0,0(sp)
    80002428:	01010113          	addi	sp,sp,16
    8000242c:	00008067          	ret

0000000080002430 <_Znam>:

void *operator new[](size_t n)
{
    80002430:	ff010113          	addi	sp,sp,-16
    80002434:	00113423          	sd	ra,8(sp)
    80002438:	00813023          	sd	s0,0(sp)
    8000243c:	01010413          	addi	s0,sp,16
    return mem_alloc(n);
    80002440:	fffff097          	auipc	ra,0xfffff
    80002444:	f4c080e7          	jalr	-180(ra) # 8000138c <_Z9mem_allocm>
}
    80002448:	00813083          	ld	ra,8(sp)
    8000244c:	00013403          	ld	s0,0(sp)
    80002450:	01010113          	addi	sp,sp,16
    80002454:	00008067          	ret

0000000080002458 <_ZdlPv>:

void operator delete(void *p) noexcept
{
    80002458:	ff010113          	addi	sp,sp,-16
    8000245c:	00113423          	sd	ra,8(sp)
    80002460:	00813023          	sd	s0,0(sp)
    80002464:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002468:	fffff097          	auipc	ra,0xfffff
    8000246c:	f68080e7          	jalr	-152(ra) # 800013d0 <_Z8mem_freePv>
}
    80002470:	00813083          	ld	ra,8(sp)
    80002474:	00013403          	ld	s0,0(sp)
    80002478:	01010113          	addi	sp,sp,16
    8000247c:	00008067          	ret

0000000080002480 <_ZdaPv>:

void operator delete[](void *p) noexcept
{
    80002480:	ff010113          	addi	sp,sp,-16
    80002484:	00113423          	sd	ra,8(sp)
    80002488:	00813023          	sd	s0,0(sp)
    8000248c:	01010413          	addi	s0,sp,16
    mem_free(p);
    80002490:	fffff097          	auipc	ra,0xfffff
    80002494:	f40080e7          	jalr	-192(ra) # 800013d0 <_Z8mem_freePv>
}
    80002498:	00813083          	ld	ra,8(sp)
    8000249c:	00013403          	ld	s0,0(sp)
    800024a0:	01010113          	addi	sp,sp,16
    800024a4:	00008067          	ret

00000000800024a8 <_ZN6Thread10runWrapperEPv>:
    this->body = body;
    this->arg = arg;
    this->myHandle = nullptr;
}

void Thread::runWrapper(void* thrd){
    800024a8:	ff010113          	addi	sp,sp,-16
    800024ac:	00113423          	sd	ra,8(sp)
    800024b0:	00813023          	sd	s0,0(sp)
    800024b4:	01010413          	addi	s0,sp,16
    ((Thread*)thrd)->run();
    800024b8:	00053783          	ld	a5,0(a0)
    800024bc:	0107b783          	ld	a5,16(a5)
    800024c0:	000780e7          	jalr	a5
}
    800024c4:	00813083          	ld	ra,8(sp)
    800024c8:	00013403          	ld	s0,0(sp)
    800024cc:	01010113          	addi	sp,sp,16
    800024d0:	00008067          	ret

00000000800024d4 <_ZN14PeriodicThread25periodicActivationWrapperEPv>:
}

PeriodicThread::PeriodicThread(time_t period) : Thread(&periodicActivationWrapper,this),
                                                period(period), state(RUNNING){}

void PeriodicThread::periodicActivationWrapper(void * thrd) {
    800024d4:	fe010113          	addi	sp,sp,-32
    800024d8:	00113c23          	sd	ra,24(sp)
    800024dc:	00813823          	sd	s0,16(sp)
    800024e0:	00913423          	sd	s1,8(sp)
    800024e4:	02010413          	addi	s0,sp,32
    800024e8:	00050493          	mv	s1,a0
    // After the thread gets terminated, it will simply leave periodicActivationWrapper,
    // and then automatically will leave the run function which will return into tcb threadWrapper
    // threadWrapper itself will finish the thread making sure it doesn't get back into the scheduler.
    while(   ((PeriodicThread*)thrd)->state == RUNNING  ){
    800024ec:	0284a783          	lw	a5,40(s1)
    800024f0:	02079263          	bnez	a5,80002514 <_ZN14PeriodicThread25periodicActivationWrapperEPv+0x40>
        ((PeriodicThread*)thrd)->periodicActivation();
    800024f4:	0004b783          	ld	a5,0(s1)
    800024f8:	0187b783          	ld	a5,24(a5)
    800024fc:	00048513          	mv	a0,s1
    80002500:	000780e7          	jalr	a5
        time_sleep(((PeriodicThread*)thrd)->period);
    80002504:	0204b503          	ld	a0,32(s1)
    80002508:	fffff097          	auipc	ra,0xfffff
    8000250c:	0f4080e7          	jalr	244(ra) # 800015fc <_Z10time_sleepm>
    while(   ((PeriodicThread*)thrd)->state == RUNNING  ){
    80002510:	fddff06f          	j	800024ec <_ZN14PeriodicThread25periodicActivationWrapperEPv+0x18>
    }
}
    80002514:	01813083          	ld	ra,24(sp)
    80002518:	01013403          	ld	s0,16(sp)
    8000251c:	00813483          	ld	s1,8(sp)
    80002520:	02010113          	addi	sp,sp,32
    80002524:	00008067          	ret

0000000080002528 <_ZN6ThreadD1Ev>:
Thread::~Thread(){
    80002528:	fe010113          	addi	sp,sp,-32
    8000252c:	00113c23          	sd	ra,24(sp)
    80002530:	00813823          	sd	s0,16(sp)
    80002534:	00913423          	sd	s1,8(sp)
    80002538:	02010413          	addi	s0,sp,32
    8000253c:	00009797          	auipc	a5,0x9
    80002540:	17c78793          	addi	a5,a5,380 # 8000b6b8 <_ZTV6Thread+0x10>
    80002544:	00f53023          	sd	a5,0(a0)
    if(this->myHandle)
    80002548:	00853483          	ld	s1,8(a0)
    8000254c:	02048063          	beqz	s1,8000256c <_ZN6ThreadD1Ev+0x44>
        if(stack)
    80002550:	0184b503          	ld	a0,24(s1)
    80002554:	00050663          	beqz	a0,80002560 <_ZN6ThreadD1Ev+0x38>
            delete[] stack;
    80002558:	00000097          	auipc	ra,0x0
    8000255c:	f28080e7          	jalr	-216(ra) # 80002480 <_ZdaPv>
        delete myHandle;
    80002560:	00048513          	mv	a0,s1
    80002564:	00000097          	auipc	ra,0x0
    80002568:	ef4080e7          	jalr	-268(ra) # 80002458 <_ZdlPv>
}
    8000256c:	01813083          	ld	ra,24(sp)
    80002570:	01013403          	ld	s0,16(sp)
    80002574:	00813483          	ld	s1,8(sp)
    80002578:	02010113          	addi	sp,sp,32
    8000257c:	00008067          	ret

0000000080002580 <_ZN6ThreadD0Ev>:
Thread::~Thread(){
    80002580:	fe010113          	addi	sp,sp,-32
    80002584:	00113c23          	sd	ra,24(sp)
    80002588:	00813823          	sd	s0,16(sp)
    8000258c:	00913423          	sd	s1,8(sp)
    80002590:	02010413          	addi	s0,sp,32
    80002594:	00050493          	mv	s1,a0
}
    80002598:	00000097          	auipc	ra,0x0
    8000259c:	f90080e7          	jalr	-112(ra) # 80002528 <_ZN6ThreadD1Ev>
    800025a0:	00048513          	mv	a0,s1
    800025a4:	00000097          	auipc	ra,0x0
    800025a8:	eb4080e7          	jalr	-332(ra) # 80002458 <_ZdlPv>
    800025ac:	01813083          	ld	ra,24(sp)
    800025b0:	01013403          	ld	s0,16(sp)
    800025b4:	00813483          	ld	s1,8(sp)
    800025b8:	02010113          	addi	sp,sp,32
    800025bc:	00008067          	ret

00000000800025c0 <_ZN9SemaphoreD1Ev>:

int Semaphore::signal() {
    return sem_signal(myHandle);
}

Semaphore::~Semaphore() {
    800025c0:	fe010113          	addi	sp,sp,-32
    800025c4:	00113c23          	sd	ra,24(sp)
    800025c8:	00813823          	sd	s0,16(sp)
    800025cc:	00913423          	sd	s1,8(sp)
    800025d0:	02010413          	addi	s0,sp,32
    800025d4:	00050493          	mv	s1,a0
    800025d8:	00009797          	auipc	a5,0x9
    800025dc:	10878793          	addi	a5,a5,264 # 8000b6e0 <_ZTV9Semaphore+0x10>
    800025e0:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    800025e4:	00853503          	ld	a0,8(a0)
    800025e8:	fffff097          	auipc	ra,0xfffff
    800025ec:	f6c080e7          	jalr	-148(ra) # 80001554 <_Z9sem_closeP4_sem>
    delete this->myHandle;
    800025f0:	0084b483          	ld	s1,8(s1)
    800025f4:	00048e63          	beqz	s1,80002610 <_ZN9SemaphoreD1Ev+0x50>
    int wait();
    int signal();


    ~_sem(){
        close();
    800025f8:	00048513          	mv	a0,s1
    800025fc:	00001097          	auipc	ra,0x1
    80002600:	d94080e7          	jalr	-620(ra) # 80003390 <_ZN4_sem5closeEv>
    80002604:	00048513          	mv	a0,s1
    80002608:	00000097          	auipc	ra,0x0
    8000260c:	e50080e7          	jalr	-432(ra) # 80002458 <_ZdlPv>
}
    80002610:	01813083          	ld	ra,24(sp)
    80002614:	01013403          	ld	s0,16(sp)
    80002618:	00813483          	ld	s1,8(sp)
    8000261c:	02010113          	addi	sp,sp,32
    80002620:	00008067          	ret

0000000080002624 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80002624:	fe010113          	addi	sp,sp,-32
    80002628:	00113c23          	sd	ra,24(sp)
    8000262c:	00813823          	sd	s0,16(sp)
    80002630:	00913423          	sd	s1,8(sp)
    80002634:	02010413          	addi	s0,sp,32
    80002638:	00050493          	mv	s1,a0
}
    8000263c:	00000097          	auipc	ra,0x0
    80002640:	f84080e7          	jalr	-124(ra) # 800025c0 <_ZN9SemaphoreD1Ev>
    80002644:	00048513          	mv	a0,s1
    80002648:	00000097          	auipc	ra,0x0
    8000264c:	e10080e7          	jalr	-496(ra) # 80002458 <_ZdlPv>
    80002650:	01813083          	ld	ra,24(sp)
    80002654:	01013403          	ld	s0,16(sp)
    80002658:	00813483          	ld	s1,8(sp)
    8000265c:	02010113          	addi	sp,sp,32
    80002660:	00008067          	ret

0000000080002664 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80002664:	ff010113          	addi	sp,sp,-16
    80002668:	00813423          	sd	s0,8(sp)
    8000266c:	01010413          	addi	s0,sp,16
    80002670:	00009797          	auipc	a5,0x9
    80002674:	04878793          	addi	a5,a5,72 # 8000b6b8 <_ZTV6Thread+0x10>
    80002678:	00f53023          	sd	a5,0(a0)
    this->body = body;
    8000267c:	00b53823          	sd	a1,16(a0)
    this->arg = arg;
    80002680:	00c53c23          	sd	a2,24(a0)
    this->myHandle = nullptr;
    80002684:	00053423          	sd	zero,8(a0)
}
    80002688:	00813403          	ld	s0,8(sp)
    8000268c:	01010113          	addi	sp,sp,16
    80002690:	00008067          	ret

0000000080002694 <_ZN6ThreadC1Ev>:
Thread::Thread(){
    80002694:	ff010113          	addi	sp,sp,-16
    80002698:	00813423          	sd	s0,8(sp)
    8000269c:	01010413          	addi	s0,sp,16
    800026a0:	00009797          	auipc	a5,0x9
    800026a4:	01878793          	addi	a5,a5,24 # 8000b6b8 <_ZTV6Thread+0x10>
    800026a8:	00f53023          	sd	a5,0(a0)
    this->body = &runWrapper;
    800026ac:	00000797          	auipc	a5,0x0
    800026b0:	dfc78793          	addi	a5,a5,-516 # 800024a8 <_ZN6Thread10runWrapperEPv>
    800026b4:	00f53823          	sd	a5,16(a0)
    this->arg = this;
    800026b8:	00a53c23          	sd	a0,24(a0)
    this->myHandle = nullptr;
    800026bc:	00053423          	sd	zero,8(a0)
}
    800026c0:	00813403          	ld	s0,8(sp)
    800026c4:	01010113          	addi	sp,sp,16
    800026c8:	00008067          	ret

00000000800026cc <_ZN6Thread5startEv>:
int Thread::start() {
    800026cc:	ff010113          	addi	sp,sp,-16
    800026d0:	00113423          	sd	ra,8(sp)
    800026d4:	00813023          	sd	s0,0(sp)
    800026d8:	01010413          	addi	s0,sp,16
    return thread_create(&(this->myHandle), this->body,this->arg);
    800026dc:	01853603          	ld	a2,24(a0)
    800026e0:	01053583          	ld	a1,16(a0)
    800026e4:	00850513          	addi	a0,a0,8
    800026e8:	fffff097          	auipc	ra,0xfffff
    800026ec:	d20080e7          	jalr	-736(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
}
    800026f0:	00813083          	ld	ra,8(sp)
    800026f4:	00013403          	ld	s0,0(sp)
    800026f8:	01010113          	addi	sp,sp,16
    800026fc:	00008067          	ret

0000000080002700 <_ZN6Thread4joinEv>:
void Thread::join(){
    80002700:	ff010113          	addi	sp,sp,-16
    80002704:	00113423          	sd	ra,8(sp)
    80002708:	00813023          	sd	s0,0(sp)
    8000270c:	01010413          	addi	s0,sp,16
    thread_join(this->myHandle);
    80002710:	00853503          	ld	a0,8(a0)
    80002714:	fffff097          	auipc	ra,0xfffff
    80002718:	dd4080e7          	jalr	-556(ra) # 800014e8 <_Z11thread_joinP3TCB>
}
    8000271c:	00813083          	ld	ra,8(sp)
    80002720:	00013403          	ld	s0,0(sp)
    80002724:	01010113          	addi	sp,sp,16
    80002728:	00008067          	ret

000000008000272c <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    8000272c:	ff010113          	addi	sp,sp,-16
    80002730:	00113423          	sd	ra,8(sp)
    80002734:	00813023          	sd	s0,0(sp)
    80002738:	01010413          	addi	s0,sp,16
    thread_dispatch();
    8000273c:	fffff097          	auipc	ra,0xfffff
    80002740:	d88080e7          	jalr	-632(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80002744:	00813083          	ld	ra,8(sp)
    80002748:	00013403          	ld	s0,0(sp)
    8000274c:	01010113          	addi	sp,sp,16
    80002750:	00008067          	ret

0000000080002754 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t t) {
    80002754:	ff010113          	addi	sp,sp,-16
    80002758:	00113423          	sd	ra,8(sp)
    8000275c:	00813023          	sd	s0,0(sp)
    80002760:	01010413          	addi	s0,sp,16
    return time_sleep(t);
    80002764:	fffff097          	auipc	ra,0xfffff
    80002768:	e98080e7          	jalr	-360(ra) # 800015fc <_Z10time_sleepm>
}
    8000276c:	00813083          	ld	ra,8(sp)
    80002770:	00013403          	ld	s0,0(sp)
    80002774:	01010113          	addi	sp,sp,16
    80002778:	00008067          	ret

000000008000277c <_ZN14PeriodicThreadC1Em>:
PeriodicThread::PeriodicThread(time_t period) : Thread(&periodicActivationWrapper,this),
    8000277c:	fe010113          	addi	sp,sp,-32
    80002780:	00113c23          	sd	ra,24(sp)
    80002784:	00813823          	sd	s0,16(sp)
    80002788:	00913423          	sd	s1,8(sp)
    8000278c:	01213023          	sd	s2,0(sp)
    80002790:	02010413          	addi	s0,sp,32
    80002794:	00050493          	mv	s1,a0
    80002798:	00058913          	mv	s2,a1
                                                period(period), state(RUNNING){}
    8000279c:	00050613          	mv	a2,a0
    800027a0:	00000597          	auipc	a1,0x0
    800027a4:	d3458593          	addi	a1,a1,-716 # 800024d4 <_ZN14PeriodicThread25periodicActivationWrapperEPv>
    800027a8:	00000097          	auipc	ra,0x0
    800027ac:	ebc080e7          	jalr	-324(ra) # 80002664 <_ZN6ThreadC1EPFvPvES0_>
    800027b0:	00009797          	auipc	a5,0x9
    800027b4:	ed878793          	addi	a5,a5,-296 # 8000b688 <_ZTV14PeriodicThread+0x10>
    800027b8:	00f4b023          	sd	a5,0(s1)
    800027bc:	0324b023          	sd	s2,32(s1)
    800027c0:	0204a423          	sw	zero,40(s1)
    800027c4:	01813083          	ld	ra,24(sp)
    800027c8:	01013403          	ld	s0,16(sp)
    800027cc:	00813483          	ld	s1,8(sp)
    800027d0:	00013903          	ld	s2,0(sp)
    800027d4:	02010113          	addi	sp,sp,32
    800027d8:	00008067          	ret

00000000800027dc <_ZN14PeriodicThread9terminateEv>:
void PeriodicThread::terminate() {
    800027dc:	ff010113          	addi	sp,sp,-16
    800027e0:	00813423          	sd	s0,8(sp)
    800027e4:	01010413          	addi	s0,sp,16
    this->state = TERMINATED;
    800027e8:	00100793          	li	a5,1
    800027ec:	02f52423          	sw	a5,40(a0)
}
    800027f0:	00813403          	ld	s0,8(sp)
    800027f4:	01010113          	addi	sp,sp,16
    800027f8:	00008067          	ret

00000000800027fc <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800027fc:	ff010113          	addi	sp,sp,-16
    80002800:	00113423          	sd	ra,8(sp)
    80002804:	00813023          	sd	s0,0(sp)
    80002808:	01010413          	addi	s0,sp,16
    8000280c:	00009797          	auipc	a5,0x9
    80002810:	ed478793          	addi	a5,a5,-300 # 8000b6e0 <_ZTV9Semaphore+0x10>
    80002814:	00f53023          	sd	a5,0(a0)
    sem_open(&myHandle,init);
    80002818:	00850513          	addi	a0,a0,8
    8000281c:	fffff097          	auipc	ra,0xfffff
    80002820:	cf4080e7          	jalr	-780(ra) # 80001510 <_Z8sem_openPP4_semj>
}
    80002824:	00813083          	ld	ra,8(sp)
    80002828:	00013403          	ld	s0,0(sp)
    8000282c:	01010113          	addi	sp,sp,16
    80002830:	00008067          	ret

0000000080002834 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002834:	ff010113          	addi	sp,sp,-16
    80002838:	00113423          	sd	ra,8(sp)
    8000283c:	00813023          	sd	s0,0(sp)
    80002840:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002844:	00853503          	ld	a0,8(a0)
    80002848:	fffff097          	auipc	ra,0xfffff
    8000284c:	d44080e7          	jalr	-700(ra) # 8000158c <_Z8sem_waitP4_sem>
}
    80002850:	00813083          	ld	ra,8(sp)
    80002854:	00013403          	ld	s0,0(sp)
    80002858:	01010113          	addi	sp,sp,16
    8000285c:	00008067          	ret

0000000080002860 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    80002860:	ff010113          	addi	sp,sp,-16
    80002864:	00113423          	sd	ra,8(sp)
    80002868:	00813023          	sd	s0,0(sp)
    8000286c:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    80002870:	00853503          	ld	a0,8(a0)
    80002874:	fffff097          	auipc	ra,0xfffff
    80002878:	d50080e7          	jalr	-688(ra) # 800015c4 <_Z10sem_signalP4_sem>
}
    8000287c:	00813083          	ld	ra,8(sp)
    80002880:	00013403          	ld	s0,0(sp)
    80002884:	01010113          	addi	sp,sp,16
    80002888:	00008067          	ret

000000008000288c <_ZN7Console4getcEv>:

char Console::getc() {
    8000288c:	ff010113          	addi	sp,sp,-16
    80002890:	00113423          	sd	ra,8(sp)
    80002894:	00813023          	sd	s0,0(sp)
    80002898:	01010413          	addi	s0,sp,16
    return ::getc();
    8000289c:	fffff097          	auipc	ra,0xfffff
    800028a0:	d98080e7          	jalr	-616(ra) # 80001634 <_Z4getcv>
}
    800028a4:	00813083          	ld	ra,8(sp)
    800028a8:	00013403          	ld	s0,0(sp)
    800028ac:	01010113          	addi	sp,sp,16
    800028b0:	00008067          	ret

00000000800028b4 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    800028b4:	ff010113          	addi	sp,sp,-16
    800028b8:	00113423          	sd	ra,8(sp)
    800028bc:	00813023          	sd	s0,0(sp)
    800028c0:	01010413          	addi	s0,sp,16
    ::putc(c);
    800028c4:	fffff097          	auipc	ra,0xfffff
    800028c8:	da4080e7          	jalr	-604(ra) # 80001668 <_Z4putcc>
}
    800028cc:	00813083          	ld	ra,8(sp)
    800028d0:	00013403          	ld	s0,0(sp)
    800028d4:	01010113          	addi	sp,sp,16
    800028d8:	00008067          	ret

00000000800028dc <_ZN6Thread3runEv>:
        static void dispatch ();
        static int sleep (time_t);

protected:
        Thread ();
        virtual void run () {}
    800028dc:	ff010113          	addi	sp,sp,-16
    800028e0:	00813423          	sd	s0,8(sp)
    800028e4:	01010413          	addi	s0,sp,16
    800028e8:	00813403          	ld	s0,8(sp)
    800028ec:	01010113          	addi	sp,sp,16
    800028f0:	00008067          	ret

00000000800028f4 <_ZN14PeriodicThread18periodicActivationEv>:
    void terminate();

protected:
    PeriodicThread(time_t period);

    virtual void periodicActivation() {}
    800028f4:	ff010113          	addi	sp,sp,-16
    800028f8:	00813423          	sd	s0,8(sp)
    800028fc:	01010413          	addi	s0,sp,16
    80002900:	00813403          	ld	s0,8(sp)
    80002904:	01010113          	addi	sp,sp,16
    80002908:	00008067          	ret

000000008000290c <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    8000290c:	ff010113          	addi	sp,sp,-16
    80002910:	00113423          	sd	ra,8(sp)
    80002914:	00813023          	sd	s0,0(sp)
    80002918:	01010413          	addi	s0,sp,16
    8000291c:	00009797          	auipc	a5,0x9
    80002920:	d6c78793          	addi	a5,a5,-660 # 8000b688 <_ZTV14PeriodicThread+0x10>
    80002924:	00f53023          	sd	a5,0(a0)
    80002928:	00000097          	auipc	ra,0x0
    8000292c:	c00080e7          	jalr	-1024(ra) # 80002528 <_ZN6ThreadD1Ev>
    80002930:	00813083          	ld	ra,8(sp)
    80002934:	00013403          	ld	s0,0(sp)
    80002938:	01010113          	addi	sp,sp,16
    8000293c:	00008067          	ret

0000000080002940 <_ZN14PeriodicThreadD0Ev>:
    80002940:	fe010113          	addi	sp,sp,-32
    80002944:	00113c23          	sd	ra,24(sp)
    80002948:	00813823          	sd	s0,16(sp)
    8000294c:	00913423          	sd	s1,8(sp)
    80002950:	02010413          	addi	s0,sp,32
    80002954:	00050493          	mv	s1,a0
    80002958:	00009797          	auipc	a5,0x9
    8000295c:	d3078793          	addi	a5,a5,-720 # 8000b688 <_ZTV14PeriodicThread+0x10>
    80002960:	00f53023          	sd	a5,0(a0)
    80002964:	00000097          	auipc	ra,0x0
    80002968:	bc4080e7          	jalr	-1084(ra) # 80002528 <_ZN6ThreadD1Ev>
    8000296c:	00048513          	mv	a0,s1
    80002970:	00000097          	auipc	ra,0x0
    80002974:	ae8080e7          	jalr	-1304(ra) # 80002458 <_ZdlPv>
    80002978:	01813083          	ld	ra,24(sp)
    8000297c:	01013403          	ld	s0,16(sp)
    80002980:	00813483          	ld	s1,8(sp)
    80002984:	02010113          	addi	sp,sp,32
    80002988:	00008067          	ret

000000008000298c <_ZN5riscv20handleSupervisorTrapEv>:

#include "../h/riscv.hpp"
#include "../lib/console.h"
#include "../h/ConsoleKernel.hpp"
#include "../h/MemoryAllocator.hpp"
void riscv::handleSupervisorTrap() {
    8000298c:	f8010113          	addi	sp,sp,-128
    80002990:	06113c23          	sd	ra,120(sp)
    80002994:	06813823          	sd	s0,112(sp)
    80002998:	06913423          	sd	s1,104(sp)
    8000299c:	08010413          	addi	s0,sp,128
        __asm__ volatile("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800029a0:	141027f3          	csrr	a5,sepc
    800029a4:	f8f43c23          	sd	a5,-104(s0)
        return sepc;
    800029a8:	f9843783          	ld	a5,-104(s0)
    volatile uint64 sepc = riscv::r_sepc();
    800029ac:	fcf43c23          	sd	a5,-40(s0)
        __asm__ volatile("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800029b0:	100027f3          	csrr	a5,sstatus
    800029b4:	f8f43823          	sd	a5,-112(s0)
        return sstatus;
    800029b8:	f9043783          	ld	a5,-112(s0)
    volatile uint64 sstatus = riscv::r_sstatus();
    800029bc:	fcf43823          	sd	a5,-48(s0)
        __asm__ volatile("csrr %[scause], scause" : [scause] "=r"(scause));
    800029c0:	142027f3          	csrr	a5,scause
    800029c4:	f8f43423          	sd	a5,-120(s0)
        return scause;
    800029c8:	f8843783          	ld	a5,-120(s0)
    volatile uint64 scause = riscv::r_scause();
    800029cc:	fcf43423          	sd	a5,-56(s0)

    if(scause == 0x0000000000000009UL || scause == 0x0000000000000008UL){
    800029d0:	fc843703          	ld	a4,-56(s0)
    800029d4:	00900793          	li	a5,9
    800029d8:	00f70863          	beq	a4,a5,800029e8 <_ZN5riscv20handleSupervisorTrapEv+0x5c>
    800029dc:	fc843703          	ld	a4,-56(s0)
    800029e0:	00800793          	li	a5,8
    800029e4:	06f71063          	bne	a4,a5,80002a44 <_ZN5riscv20handleSupervisorTrapEv+0xb8>
        sepc+=4;
    800029e8:	fd843783          	ld	a5,-40(s0)
    800029ec:	00478793          	addi	a5,a5,4
    800029f0:	fcf43c23          	sd	a5,-40(s0)

        volatile uint64 argument[5];

        // citanje a0 sa steka (broj funkcije)
        __asm__ volatile("ld %0, 10*8(fp)":"=r" (argument[0]));
    800029f4:	05043783          	ld	a5,80(s0)
    800029f8:	faf43023          	sd	a5,-96(s0)
        // citanje a1 sa steka
        __asm__ volatile("ld %0, 11*8(fp)":"=r" (argument[1]));
    800029fc:	05843783          	ld	a5,88(s0)
    80002a00:	faf43423          	sd	a5,-88(s0)
        // citanje a2 sa steka
        __asm__ volatile("ld %0, 12*8(fp)":"=r" (argument[2]));
    80002a04:	06043783          	ld	a5,96(s0)
    80002a08:	faf43823          	sd	a5,-80(s0)
        // citanje a3 sa steka
        __asm__ volatile("ld %0, 13*8(fp)":"=r" (argument[3]));
    80002a0c:	06843783          	ld	a5,104(s0)
    80002a10:	faf43c23          	sd	a5,-72(s0)
        // citanje a4 sa steka
        __asm__ volatile("ld %0, 14*8(fp)":"=r" (argument[4]));
    80002a14:	07043783          	ld	a5,112(s0)
    80002a18:	fcf43023          	sd	a5,-64(s0)

        volatile uint64 return_val;

        switch(argument[0]){
    80002a1c:	fa043783          	ld	a5,-96(s0)
    80002a20:	04200713          	li	a4,66
    80002a24:	20f76e63          	bltu	a4,a5,80002c40 <_ZN5riscv20handleSupervisorTrapEv+0x2b4>
    80002a28:	00279793          	slli	a5,a5,0x2
    80002a2c:	00006717          	auipc	a4,0x6
    80002a30:	60070713          	addi	a4,a4,1536 # 8000902c <_ZZ18kernelPrintIntegermE6digits+0xc>
    80002a34:	00e787b3          	add	a5,a5,a4
    80002a38:	0007a783          	lw	a5,0(a5)
    80002a3c:	00e787b3          	add	a5,a5,a4
    80002a40:	00078067          	jr	a5
                break;
        }
    }
    else { // unresolved trap number
        //__putc('e');
        ConsoleKernel::putc('e');
    80002a44:	06500513          	li	a0,101
    80002a48:	fffff097          	auipc	ra,0xfffff
    80002a4c:	238080e7          	jalr	568(ra) # 80001c80 <_ZN13ConsoleKernel4putcEc>
        // printInteger(scause);
    }
    w_sepc(sepc);
    80002a50:	fd843783          	ld	a5,-40(s0)
        __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80002a54:	14179073          	csrw	sepc,a5
    w_sstatus(sstatus);
    80002a58:	fd043783          	ld	a5,-48(s0)
        __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r"(sstatus));
    80002a5c:	10079073          	csrw	sstatus,a5
}
    80002a60:	07813083          	ld	ra,120(sp)
    80002a64:	07013403          	ld	s0,112(sp)
    80002a68:	06813483          	ld	s1,104(sp)
    80002a6c:	08010113          	addi	sp,sp,128
    80002a70:	00008067          	ret
                return_val = (uint64)MemoryAllocator::mem_alloc((size_t)argument[1]);
    80002a74:	fa843503          	ld	a0,-88(s0)
    80002a78:	00001097          	auipc	ra,0x1
    80002a7c:	9b8080e7          	jalr	-1608(ra) # 80003430 <_ZN15MemoryAllocator9mem_allocEm>
    80002a80:	f8a43023          	sd	a0,-128(s0)
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002a84:	f8043783          	ld	a5,-128(s0)
    80002a88:	04f43823          	sd	a5,80(s0)
                break;
    80002a8c:	fc5ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                return_val = (uint64)MemoryAllocator::mem_free((void*)argument[1]);
    80002a90:	fa843503          	ld	a0,-88(s0)
    80002a94:	00001097          	auipc	ra,0x1
    80002a98:	a7c080e7          	jalr	-1412(ra) # 80003510 <_ZN15MemoryAllocator8mem_freeEPv>
    80002a9c:	f8a43023          	sd	a0,-128(s0)
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002aa0:	f8043783          	ld	a5,-128(s0)
    80002aa4:	04f43823          	sd	a5,80(s0)
                break;
    80002aa8:	fa9ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                *((uint64*)argument[1]) = (uint64)TCB::createThread((TCB::Body) argument[2], (TCB::Argument) argument[3], (uint8*) argument[4]);
    80002aac:	fb043503          	ld	a0,-80(s0)
    80002ab0:	fb843583          	ld	a1,-72(s0)
    80002ab4:	fc043603          	ld	a2,-64(s0)
    80002ab8:	00000097          	auipc	ra,0x0
    80002abc:	510080e7          	jalr	1296(ra) # 80002fc8 <_ZN3TCB12createThreadEPFvPvES0_Ph>
    80002ac0:	fa843783          	ld	a5,-88(s0)
    80002ac4:	00a7b023          	sd	a0,0(a5)
                if (argument[1] == 0)
    80002ac8:	fa843783          	ld	a5,-88(s0)
    80002acc:	00079c63          	bnez	a5,80002ae4 <_ZN5riscv20handleSupervisorTrapEv+0x158>
                    return_val = -1;
    80002ad0:	fff00793          	li	a5,-1
    80002ad4:	f8f43023          	sd	a5,-128(s0)
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002ad8:	f8043783          	ld	a5,-128(s0)
    80002adc:	04f43823          	sd	a5,80(s0)
                break;
    80002ae0:	f71ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                else return_val = 0;
    80002ae4:	f8043023          	sd	zero,-128(s0)
    80002ae8:	ff1ff06f          	j	80002ad8 <_ZN5riscv20handleSupervisorTrapEv+0x14c>
                TCB::exit();
    80002aec:	00000097          	auipc	ra,0x0
    80002af0:	660080e7          	jalr	1632(ra) # 8000314c <_ZN3TCB4exitEv>
                return_val = 0;
    80002af4:	f8043023          	sd	zero,-128(s0)
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002af8:	f8043783          	ld	a5,-128(s0)
    80002afc:	04f43823          	sd	a5,80(s0)
                break;
    80002b00:	f51ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                TCB::timeSliceCounter = 0;
    80002b04:	00009797          	auipc	a5,0x9
    80002b08:	dcc7b783          	ld	a5,-564(a5) # 8000b8d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002b0c:	0007b023          	sd	zero,0(a5)
                TCB::dispatch();
    80002b10:	00000097          	auipc	ra,0x0
    80002b14:	5cc080e7          	jalr	1484(ra) # 800030dc <_ZN3TCB8dispatchEv>
                break;
    80002b18:	f39ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                TCB::join((TCB*)argument[1]);
    80002b1c:	fa843503          	ld	a0,-88(s0)
    80002b20:	00000097          	auipc	ra,0x0
    80002b24:	6dc080e7          	jalr	1756(ra) # 800031fc <_ZN3TCB4joinEPS_>
                break;
    80002b28:	f29ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                return_val = *(uint64*)argument[1] = (uint64)(new _sem((int)argument[2]));
    80002b2c:	fb043483          	ld	s1,-80(s0)
    80002b30:	0004849b          	sext.w	s1,s1
    80002b34:	01800513          	li	a0,24
    80002b38:	00000097          	auipc	ra,0x0
    80002b3c:	8d0080e7          	jalr	-1840(ra) # 80002408 <_Znwm>
    _sem(int init): val(init), closed(false){}
    80002b40:	00952023          	sw	s1,0(a0)
    80002b44:	00050223          	sb	zero,4(a0)
    80002b48:	00053423          	sd	zero,8(a0)
    80002b4c:	00053823          	sd	zero,16(a0)
    80002b50:	fa843783          	ld	a5,-88(s0)
    80002b54:	00a7b023          	sd	a0,0(a5)
    80002b58:	f8a43023          	sd	a0,-128(s0)
                return_val = (return_val == 0)? -1: 0;
    80002b5c:	f8043783          	ld	a5,-128(s0)
    80002b60:	00079c63          	bnez	a5,80002b78 <_ZN5riscv20handleSupervisorTrapEv+0x1ec>
    80002b64:	fff00793          	li	a5,-1
    80002b68:	f8f43023          	sd	a5,-128(s0)
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002b6c:	f8043783          	ld	a5,-128(s0)
    80002b70:	04f43823          	sd	a5,80(s0)
                break;
    80002b74:	eddff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                return_val = (return_val == 0)? -1: 0;
    80002b78:	00000793          	li	a5,0
    80002b7c:	fedff06f          	j	80002b68 <_ZN5riscv20handleSupervisorTrapEv+0x1dc>
                return_val = ((_sem*)argument[1])->close();
    80002b80:	fa843503          	ld	a0,-88(s0)
    80002b84:	00001097          	auipc	ra,0x1
    80002b88:	80c080e7          	jalr	-2036(ra) # 80003390 <_ZN4_sem5closeEv>
    80002b8c:	f8a43023          	sd	a0,-128(s0)
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002b90:	f8043783          	ld	a5,-128(s0)
    80002b94:	04f43823          	sd	a5,80(s0)
                break;
    80002b98:	eb9ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                return_val = ((_sem*)argument[1])->wait();
    80002b9c:	fa843503          	ld	a0,-88(s0)
    80002ba0:	00000097          	auipc	ra,0x0
    80002ba4:	700080e7          	jalr	1792(ra) # 800032a0 <_ZN4_sem4waitEv>
    80002ba8:	f8a43023          	sd	a0,-128(s0)
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002bac:	f8043783          	ld	a5,-128(s0)
    80002bb0:	04f43823          	sd	a5,80(s0)
                break;
    80002bb4:	e9dff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                return_val = ((_sem*)argument[1])->signal();
    80002bb8:	fa843503          	ld	a0,-88(s0)
    80002bbc:	00000097          	auipc	ra,0x0
    80002bc0:	77c080e7          	jalr	1916(ra) # 80003338 <_ZN4_sem6signalEv>
    80002bc4:	f8a43023          	sd	a0,-128(s0)
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002bc8:	f8043783          	ld	a5,-128(s0)
    80002bcc:	04f43823          	sd	a5,80(s0)
                break;
    80002bd0:	e81ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                return_val = (uint64)sleeping::put(TCB::running, (int)argument[1]);
    80002bd4:	fa843583          	ld	a1,-88(s0)
    80002bd8:	0005859b          	sext.w	a1,a1
    80002bdc:	00009797          	auipc	a5,0x9
    80002be0:	d147b783          	ld	a5,-748(a5) # 8000b8f0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002be4:	0007b503          	ld	a0,0(a5)
    80002be8:	fffff097          	auipc	ra,0xfffff
    80002bec:	30c080e7          	jalr	780(ra) # 80001ef4 <_ZN8sleeping3putEP3TCBi>
    80002bf0:	f8a43023          	sd	a0,-128(s0)
                TCB::timeSliceCounter = 0; // we have to set it to 0 because we are dispatching without interrupt.
    80002bf4:	00009797          	auipc	a5,0x9
    80002bf8:	cdc7b783          	ld	a5,-804(a5) # 8000b8d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002bfc:	0007b023          	sd	zero,0(a5)
                TCB::dispatch();
    80002c00:	00000097          	auipc	ra,0x0
    80002c04:	4dc080e7          	jalr	1244(ra) # 800030dc <_ZN3TCB8dispatchEv>
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002c08:	f8043783          	ld	a5,-128(s0)
    80002c0c:	04f43823          	sd	a5,80(s0)
                break;
    80002c10:	e41ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                return_val = (uint64)ConsoleKernel::getc();
    80002c14:	fffff097          	auipc	ra,0xfffff
    80002c18:	f50080e7          	jalr	-176(ra) # 80001b64 <_ZN13ConsoleKernel4getcEv>
    80002c1c:	f8a43023          	sd	a0,-128(s0)
                __asm__ volatile("sd %0, 10*8(fp)": :"r"(return_val));
    80002c20:	f8043783          	ld	a5,-128(s0)
    80002c24:	04f43823          	sd	a5,80(s0)
                break;
    80002c28:	e29ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                ConsoleKernel::putc((char)argument[1]);
    80002c2c:	fa843503          	ld	a0,-88(s0)
    80002c30:	0ff57513          	andi	a0,a0,255
    80002c34:	fffff097          	auipc	ra,0xfffff
    80002c38:	04c080e7          	jalr	76(ra) # 80001c80 <_ZN13ConsoleKernel4putcEc>
                break;
    80002c3c:	e15ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>
                ConsoleKernel::putc('c');
    80002c40:	06300513          	li	a0,99
    80002c44:	fffff097          	auipc	ra,0xfffff
    80002c48:	03c080e7          	jalr	60(ra) # 80001c80 <_ZN13ConsoleKernel4putcEc>
                break;
    80002c4c:	e05ff06f          	j	80002a50 <_ZN5riscv20handleSupervisorTrapEv+0xc4>

0000000080002c50 <_ZN5riscv21timerInterruptHandlerEv>:
void riscv::timerInterruptHandler(){// timer
    80002c50:	fd010113          	addi	sp,sp,-48
    80002c54:	02113423          	sd	ra,40(sp)
    80002c58:	02813023          	sd	s0,32(sp)
    80002c5c:	03010413          	addi	s0,sp,48
        __asm__ volatile("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002c60:	141027f3          	csrr	a5,sepc
    80002c64:	fcf43c23          	sd	a5,-40(s0)
        return sepc;
    80002c68:	fd843783          	ld	a5,-40(s0)
    volatile uint64 sepc = riscv::r_sepc();
    80002c6c:	fef43423          	sd	a5,-24(s0)
        __asm__ volatile("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002c70:	100027f3          	csrr	a5,sstatus
    80002c74:	fcf43823          	sd	a5,-48(s0)
        return sstatus;
    80002c78:	fd043783          	ld	a5,-48(s0)
    volatile uint64 sstatus = riscv::r_sstatus();
    80002c7c:	fef43023          	sd	a5,-32(s0)

    TCB::timeSliceCounter++;
    80002c80:	00009717          	auipc	a4,0x9
    80002c84:	c5073703          	ld	a4,-944(a4) # 8000b8d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002c88:	00073783          	ld	a5,0(a4)
    80002c8c:	00178793          	addi	a5,a5,1
    80002c90:	00f73023          	sd	a5,0(a4)
    sleeping::timeDecrease();
    80002c94:	fffff097          	auipc	ra,0xfffff
    80002c98:	320080e7          	jalr	800(ra) # 80001fb4 <_ZN8sleeping12timeDecreaseEv>
    if(TCB::running!=nullptr) {
    80002c9c:	00009797          	auipc	a5,0x9
    80002ca0:	c547b783          	ld	a5,-940(a5) # 8000b8f0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002ca4:	0007b783          	ld	a5,0(a5)
    80002ca8:	00078c63          	beqz	a5,80002cc0 <_ZN5riscv21timerInterruptHandlerEv+0x70>
        return t_slice;
    80002cac:	0207b783          	ld	a5,32(a5)
        if (TCB::timeSliceCounter >= TCB::running->getTimeSlice()) {
    80002cb0:	00009717          	auipc	a4,0x9
    80002cb4:	c2073703          	ld	a4,-992(a4) # 8000b8d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002cb8:	00073703          	ld	a4,0(a4)
    80002cbc:	02f77663          	bgeu	a4,a5,80002ce8 <_ZN5riscv21timerInterruptHandlerEv+0x98>
    }
    static void ms_sip(uint64 mask){ // mask set sip
        __asm__ volatile("csrs sstatus, %[mask]"::[mask]"r"(mask));
    }
    static void mc_sip(uint64 mask){ // mask clear sip
        __asm__ volatile("csrc sip, %[mask]": : [mask]"r"(mask));
    80002cc0:	00200793          	li	a5,2
    80002cc4:	1447b073          	csrc	sip,a5
            TCB::timeSliceCounter = 0;
            TCB::dispatch();
        }
    }
    mc_sip(SIP_SSIP); // signal da je prekid obradjen
    w_sepc(sepc);
    80002cc8:	fe843783          	ld	a5,-24(s0)
        __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80002ccc:	14179073          	csrw	sepc,a5
    w_sstatus(sstatus);
    80002cd0:	fe043783          	ld	a5,-32(s0)
        __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r"(sstatus));
    80002cd4:	10079073          	csrw	sstatus,a5
}
    80002cd8:	02813083          	ld	ra,40(sp)
    80002cdc:	02013403          	ld	s0,32(sp)
    80002ce0:	03010113          	addi	sp,sp,48
    80002ce4:	00008067          	ret
            TCB::timeSliceCounter = 0;
    80002ce8:	00009797          	auipc	a5,0x9
    80002cec:	be87b783          	ld	a5,-1048(a5) # 8000b8d0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002cf0:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80002cf4:	00000097          	auipc	ra,0x0
    80002cf8:	3e8080e7          	jalr	1000(ra) # 800030dc <_ZN3TCB8dispatchEv>
    80002cfc:	fc5ff06f          	j	80002cc0 <_ZN5riscv21timerInterruptHandlerEv+0x70>

0000000080002d00 <_ZN5riscv23consoleInterruptHandlerEv>:

void riscv::consoleInterruptHandler() { // Console
    80002d00:	fb010113          	addi	sp,sp,-80
    80002d04:	04113423          	sd	ra,72(sp)
    80002d08:	04813023          	sd	s0,64(sp)
    80002d0c:	02913c23          	sd	s1,56(sp)
    80002d10:	03213823          	sd	s2,48(sp)
    80002d14:	03313423          	sd	s3,40(sp)
    80002d18:	05010413          	addi	s0,sp,80
        __asm__ volatile("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002d1c:	141027f3          	csrr	a5,sepc
    80002d20:	faf43c23          	sd	a5,-72(s0)
        return sepc;
    80002d24:	fb843783          	ld	a5,-72(s0)
    volatile uint64 sepc = riscv::r_sepc();
    80002d28:	fcf43423          	sd	a5,-56(s0)
        __asm__ volatile("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002d2c:	100027f3          	csrr	a5,sstatus
    80002d30:	faf43823          	sd	a5,-80(s0)
        return sstatus;
    80002d34:	fb043783          	ld	a5,-80(s0)
    volatile uint64 sstatus = riscv::r_sstatus();
    80002d38:	fcf43023          	sd	a5,-64(s0)
    int deviceNum = plic_claim();
    80002d3c:	00005097          	auipc	ra,0x5
    80002d40:	858080e7          	jalr	-1960(ra) # 80007594 <plic_claim>
    80002d44:	00050493          	mv	s1,a0
    // Clears ninth bit stating that the hardware interrupt has been processed
    __asm__ volatile("csrc sip, %0" ::"r"(1UL<<9));
    80002d48:	20000793          	li	a5,512
    80002d4c:	1447b073          	csrc	sip,a5
    80002d50:	00009797          	auipc	a5,0x9
    80002d54:	bb87b783          	ld	a5,-1096(a5) # 8000b908 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002d58:	0007b783          	ld	a5,0(a5)
    80002d5c:	06078a63          	beqz	a5,80002dd0 <_ZN5riscv23consoleInterruptHandlerEv+0xd0>
        return instance;
    80002d60:	00009917          	auipc	s2,0x9
    80002d64:	ba893903          	ld	s2,-1112(s2) # 8000b908 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002d68:	00093783          	ld	a5,0(s2)
    sem_signal(ConsoleKernel::get()->getSem);
    80002d6c:	1107b503          	ld	a0,272(a5)
    80002d70:	fffff097          	auipc	ra,0xfffff
    80002d74:	854080e7          	jalr	-1964(ra) # 800015c4 <_Z10sem_signalP4_sem>
        if(!instance) instance = new ConsoleKernel();
    80002d78:	00093783          	ld	a5,0(s2)
    80002d7c:	12078463          	beqz	a5,80002ea4 <_ZN5riscv23consoleInterruptHandlerEv+0x1a4>
        return instance;
    80002d80:	00009797          	auipc	a5,0x9
    80002d84:	b887b783          	ld	a5,-1144(a5) # 8000b908 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002d88:	0007b783          	ld	a5,0(a5)
    sem_signal(ConsoleKernel::get()->putSem);
    80002d8c:	1187b503          	ld	a0,280(a5)
    80002d90:	fffff097          	auipc	ra,0xfffff
    80002d94:	834080e7          	jalr	-1996(ra) # 800015c4 <_Z10sem_signalP4_sem>
    plic_complete(deviceNum);
    80002d98:	00048513          	mv	a0,s1
    80002d9c:	00005097          	auipc	ra,0x5
    80002da0:	830080e7          	jalr	-2000(ra) # 800075cc <plic_complete>
    //console_handler();
//    mc_sip(SIP_SSIP); // signal da je prekid obradjen
    w_sepc(sepc);
    80002da4:	fc843783          	ld	a5,-56(s0)
        __asm__ volatile("csrw sepc, %[sepc]": : [sepc] "r"(sepc));
    80002da8:	14179073          	csrw	sepc,a5
    w_sstatus(sstatus);
    80002dac:	fc043783          	ld	a5,-64(s0)
        __asm__ volatile("csrw sstatus, %[sstatus]": : [sstatus] "r"(sstatus));
    80002db0:	10079073          	csrw	sstatus,a5
}
    80002db4:	04813083          	ld	ra,72(sp)
    80002db8:	04013403          	ld	s0,64(sp)
    80002dbc:	03813483          	ld	s1,56(sp)
    80002dc0:	03013903          	ld	s2,48(sp)
    80002dc4:	02813983          	ld	s3,40(sp)
    80002dc8:	05010113          	addi	sp,sp,80
    80002dcc:	00008067          	ret
        if(!instance) instance = new ConsoleKernel();
    80002dd0:	12000513          	li	a0,288
    80002dd4:	fffff097          	auipc	ra,0xfffff
    80002dd8:	634080e7          	jalr	1588(ra) # 80002408 <_Znwm>
    80002ddc:	00050913          	mv	s2,a0
    BufferKernel(): head(0), tail(0), size(0){
    80002de0:	00052023          	sw	zero,0(a0)
    80002de4:	00052223          	sw	zero,4(a0)
    80002de8:	00052423          	sw	zero,8(a0)
        sem_open(&mutexSem, 1);
    80002dec:	00100593          	li	a1,1
    80002df0:	07050513          	addi	a0,a0,112
    80002df4:	ffffe097          	auipc	ra,0xffffe
    80002df8:	71c080e7          	jalr	1820(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80002dfc:	06400593          	li	a1,100
    80002e00:	07890513          	addi	a0,s2,120
    80002e04:	ffffe097          	auipc	ra,0xffffe
    80002e08:	70c080e7          	jalr	1804(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80002e0c:	00000593          	li	a1,0
    80002e10:	08090513          	addi	a0,s2,128
    80002e14:	ffffe097          	auipc	ra,0xffffe
    80002e18:	6fc080e7          	jalr	1788(ra) # 80001510 <_Z8sem_openPP4_semj>
    BufferKernel(): head(0), tail(0), size(0){
    80002e1c:	08092423          	sw	zero,136(s2)
    80002e20:	08092623          	sw	zero,140(s2)
    80002e24:	08092823          	sw	zero,144(s2)
        sem_open(&mutexSem, 1);
    80002e28:	00100593          	li	a1,1
    80002e2c:	0f890513          	addi	a0,s2,248
    80002e30:	ffffe097          	auipc	ra,0xffffe
    80002e34:	6e0080e7          	jalr	1760(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80002e38:	06400593          	li	a1,100
    80002e3c:	10090513          	addi	a0,s2,256
    80002e40:	ffffe097          	auipc	ra,0xffffe
    80002e44:	6d0080e7          	jalr	1744(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80002e48:	00000593          	li	a1,0
    80002e4c:	10890513          	addi	a0,s2,264
    80002e50:	ffffe097          	auipc	ra,0xffffe
    80002e54:	6c0080e7          	jalr	1728(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&getSem,0);
    80002e58:	00000593          	li	a1,0
    80002e5c:	11090513          	addi	a0,s2,272
    80002e60:	ffffe097          	auipc	ra,0xffffe
    80002e64:	6b0080e7          	jalr	1712(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&putSem,0);
    80002e68:	00000593          	li	a1,0
    80002e6c:	11890513          	addi	a0,s2,280
    80002e70:	ffffe097          	auipc	ra,0xffffe
    80002e74:	6a0080e7          	jalr	1696(ra) # 80001510 <_Z8sem_openPP4_semj>
        if(!instance) instance = new ConsoleKernel();
    80002e78:	00009797          	auipc	a5,0x9
    80002e7c:	a907b783          	ld	a5,-1392(a5) # 8000b908 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002e80:	0127b023          	sd	s2,0(a5)
    80002e84:	eddff06f          	j	80002d60 <_ZN5riscv23consoleInterruptHandlerEv+0x60>
    80002e88:	00050493          	mv	s1,a0
    80002e8c:	00090513          	mv	a0,s2
    80002e90:	fffff097          	auipc	ra,0xfffff
    80002e94:	5c8080e7          	jalr	1480(ra) # 80002458 <_ZdlPv>
    80002e98:	00048513          	mv	a0,s1
    80002e9c:	0000a097          	auipc	ra,0xa
    80002ea0:	c1c080e7          	jalr	-996(ra) # 8000cab8 <_Unwind_Resume>
    80002ea4:	12000513          	li	a0,288
    80002ea8:	fffff097          	auipc	ra,0xfffff
    80002eac:	560080e7          	jalr	1376(ra) # 80002408 <_Znwm>
    80002eb0:	00050913          	mv	s2,a0
    BufferKernel(): head(0), tail(0), size(0){
    80002eb4:	00052023          	sw	zero,0(a0)
    80002eb8:	00052223          	sw	zero,4(a0)
    80002ebc:	00052423          	sw	zero,8(a0)
        sem_open(&mutexSem, 1);
    80002ec0:	00100593          	li	a1,1
    80002ec4:	07050513          	addi	a0,a0,112
    80002ec8:	ffffe097          	auipc	ra,0xffffe
    80002ecc:	648080e7          	jalr	1608(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80002ed0:	06400593          	li	a1,100
    80002ed4:	07890513          	addi	a0,s2,120
    80002ed8:	ffffe097          	auipc	ra,0xffffe
    80002edc:	638080e7          	jalr	1592(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80002ee0:	00000593          	li	a1,0
    80002ee4:	08090513          	addi	a0,s2,128
    80002ee8:	ffffe097          	auipc	ra,0xffffe
    80002eec:	628080e7          	jalr	1576(ra) # 80001510 <_Z8sem_openPP4_semj>
    BufferKernel(): head(0), tail(0), size(0){
    80002ef0:	08092423          	sw	zero,136(s2)
    80002ef4:	08092623          	sw	zero,140(s2)
    80002ef8:	08092823          	sw	zero,144(s2)
        sem_open(&mutexSem, 1);
    80002efc:	00100593          	li	a1,1
    80002f00:	0f890513          	addi	a0,s2,248
    80002f04:	ffffe097          	auipc	ra,0xffffe
    80002f08:	60c080e7          	jalr	1548(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&spacePutAv, maxSize);
    80002f0c:	06400593          	li	a1,100
    80002f10:	10090513          	addi	a0,s2,256
    80002f14:	ffffe097          	auipc	ra,0xffffe
    80002f18:	5fc080e7          	jalr	1532(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&charGetAv, 0);
    80002f1c:	00000593          	li	a1,0
    80002f20:	10890513          	addi	a0,s2,264
    80002f24:	ffffe097          	auipc	ra,0xffffe
    80002f28:	5ec080e7          	jalr	1516(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&getSem,0);
    80002f2c:	00000593          	li	a1,0
    80002f30:	11090513          	addi	a0,s2,272
    80002f34:	ffffe097          	auipc	ra,0xffffe
    80002f38:	5dc080e7          	jalr	1500(ra) # 80001510 <_Z8sem_openPP4_semj>
        sem_open(&putSem,0);
    80002f3c:	00000593          	li	a1,0
    80002f40:	11890513          	addi	a0,s2,280
    80002f44:	ffffe097          	auipc	ra,0xffffe
    80002f48:	5cc080e7          	jalr	1484(ra) # 80001510 <_Z8sem_openPP4_semj>
        if(!instance) instance = new ConsoleKernel();
    80002f4c:	00009797          	auipc	a5,0x9
    80002f50:	9bc7b783          	ld	a5,-1604(a5) # 8000b908 <_GLOBAL_OFFSET_TABLE_+0x60>
    80002f54:	0127b023          	sd	s2,0(a5)
    80002f58:	e29ff06f          	j	80002d80 <_ZN5riscv23consoleInterruptHandlerEv+0x80>
    80002f5c:	00050493          	mv	s1,a0
    80002f60:	00090513          	mv	a0,s2
    80002f64:	fffff097          	auipc	ra,0xfffff
    80002f68:	4f4080e7          	jalr	1268(ra) # 80002458 <_ZdlPv>
    80002f6c:	00048513          	mv	a0,s1
    80002f70:	0000a097          	auipc	ra,0xa
    80002f74:	b48080e7          	jalr	-1208(ra) # 8000cab8 <_Unwind_Resume>

0000000080002f78 <_ZN5riscv10popSppSpieEv>:

// Ensure that the user mode doesn't have access to the system registers
// This function must not be inline because we must ensure that ra register changes.
// That's why it's defined in cpp.
void riscv::popSppSpie() {
    80002f78:	ff010113          	addi	sp,sp,-16
    80002f7c:	00813423          	sd	s0,8(sp)
    80002f80:	01010413          	addi	s0,sp,16
        __asm__ volatile("csrs sstatus, %[mask]"::[mask]"r"(mask));
    80002f84:	02000793          	li	a5,32
    80002f88:	1007a073          	csrs	sstatus,a5
    ms_sstatus(SSTATUS_SPIE); // Setujemo bit za dozvoljavanje prekida na aktivno

    // When we call popSppSpie, ra register has the return pc value. We write it in sepc
    // so that that's the place where we land after we call sret at the very end of popSppSpie
    __asm__ volatile ("csrw sepc, ra");
    80002f8c:	14109073          	csrw	sepc,ra

    if(TCB::running->getSystemAccessFlag())
    80002f90:	00009797          	auipc	a5,0x9
    80002f94:	9607b783          	ld	a5,-1696(a5) # 8000b8f0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80002f98:	0007b783          	ld	a5,0(a5)
    bool getSystemAccessFlag(){ return this->systemAccessFlag; }
    80002f9c:	0587c783          	lbu	a5,88(a5)
    80002fa0:	00078e63          	beqz	a5,80002fbc <_ZN5riscv10popSppSpieEv+0x44>
        __asm__ volatile ("csrs sstatus, %0"::"r"(0x100)); // Dajemo sistemske privilegije
    80002fa4:	10000793          	li	a5,256
    80002fa8:	1007a073          	csrs	sstatus,a5
    else
        __asm__ volatile ("csrc sstatus, %0"::"r"(0x100)); // Dajemo user privilegije

    __asm__ volatile("sret");
    80002fac:	10200073          	sret
}
    80002fb0:	00813403          	ld	s0,8(sp)
    80002fb4:	01010113          	addi	sp,sp,16
    80002fb8:	00008067          	ret
        __asm__ volatile ("csrc sstatus, %0"::"r"(0x100)); // Dajemo user privilegije
    80002fbc:	10000793          	li	a5,256
    80002fc0:	1007b073          	csrc	sstatus,a5
    80002fc4:	fe9ff06f          	j	80002fac <_ZN5riscv10popSppSpieEv+0x34>

0000000080002fc8 <_ZN3TCB12createThreadEPFvPvES0_Ph>:


TCB* TCB::running = nullptr;
uint64 TCB::timeSliceCounter = 0;

TCB* TCB::createThread(TCB::Body body, TCB::Argument argument, uint8* st) {
    80002fc8:	fd010113          	addi	sp,sp,-48
    80002fcc:	02113423          	sd	ra,40(sp)
    80002fd0:	02813023          	sd	s0,32(sp)
    80002fd4:	00913c23          	sd	s1,24(sp)
    80002fd8:	01213823          	sd	s2,16(sp)
    80002fdc:	01313423          	sd	s3,8(sp)
    80002fe0:	01413023          	sd	s4,0(sp)
    80002fe4:	03010413          	addi	s0,sp,48
    80002fe8:	00050993          	mv	s3,a0
    80002fec:	00058a13          	mv	s4,a1
    80002ff0:	00060913          	mv	s2,a2
    return new TCB(body, argument, TIME_SLICE, st);
    80002ff4:	06000513          	li	a0,96
    80002ff8:	fffff097          	auipc	ra,0xfffff
    80002ffc:	410080e7          	jalr	1040(ra) # 80002408 <_Znwm>
    80003000:	00050493          	mv	s1,a0
        t_slice(timesl),
        state(RUNNING),
        context({(uint64) &threadWrapper,
                 stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
                }),
        systemAccessFlag(false)
    80003004:	00053023          	sd	zero,0(a0)
    80003008:	01353423          	sd	s3,8(a0)
    8000300c:	01453823          	sd	s4,16(a0)
        stack(body != nullptr ? st : nullptr),
    80003010:	04098a63          	beqz	s3,80003064 <_ZN3TCB12createThreadEPFvPvES0_Ph+0x9c>
        systemAccessFlag(false)
    80003014:	0124bc23          	sd	s2,24(s1)
    80003018:	00200793          	li	a5,2
    8000301c:	02f4b023          	sd	a5,32(s1)
    80003020:	00100793          	li	a5,1
    80003024:	02f4a423          	sw	a5,40(s1)
    80003028:	00000797          	auipc	a5,0x0
    8000302c:	19078793          	addi	a5,a5,400 # 800031b8 <_ZN3TCB13threadWrapperEv>
    80003030:	02f4b823          	sd	a5,48(s1)
                 stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    80003034:	02090c63          	beqz	s2,8000306c <_ZN3TCB12createThreadEPFvPvES0_Ph+0xa4>
    80003038:	00001637          	lui	a2,0x1
    8000303c:	00c90933          	add	s2,s2,a2
        systemAccessFlag(false)
    80003040:	0324bc23          	sd	s2,56(s1)
    80003044:	0404b423          	sd	zero,72(s1)
    80003048:	0404b823          	sd	zero,80(s1)
    8000304c:	04048c23          	sb	zero,88(s1)
    {
        if(body) Scheduler::put(this);
    80003050:	04098063          	beqz	s3,80003090 <_ZN3TCB12createThreadEPFvPvES0_Ph+0xc8>
    80003054:	00048513          	mv	a0,s1
    80003058:	fffff097          	auipc	ra,0xfffff
    8000305c:	174080e7          	jalr	372(ra) # 800021cc <_ZN9Scheduler3putEP3TCB>
    80003060:	0300006f          	j	80003090 <_ZN3TCB12createThreadEPFvPvES0_Ph+0xc8>
        stack(body != nullptr ? st : nullptr),
    80003064:	00000913          	li	s2,0
    80003068:	fadff06f          	j	80003014 <_ZN3TCB12createThreadEPFvPvES0_Ph+0x4c>
                 stack != nullptr ? (uint64) &stack[DEFAULT_STACK_SIZE] : 0
    8000306c:	00000913          	li	s2,0
    80003070:	fd1ff06f          	j	80003040 <_ZN3TCB12createThreadEPFvPvES0_Ph+0x78>
    80003074:	00050913          	mv	s2,a0
    80003078:	00048513          	mv	a0,s1
    8000307c:	fffff097          	auipc	ra,0xfffff
    80003080:	3dc080e7          	jalr	988(ra) # 80002458 <_ZdlPv>
    80003084:	00090513          	mv	a0,s2
    80003088:	0000a097          	auipc	ra,0xa
    8000308c:	a30080e7          	jalr	-1488(ra) # 8000cab8 <_Unwind_Resume>
}
    80003090:	00048513          	mv	a0,s1
    80003094:	02813083          	ld	ra,40(sp)
    80003098:	02013403          	ld	s0,32(sp)
    8000309c:	01813483          	ld	s1,24(sp)
    800030a0:	01013903          	ld	s2,16(sp)
    800030a4:	00813983          	ld	s3,8(sp)
    800030a8:	00013a03          	ld	s4,0(sp)
    800030ac:	03010113          	addi	sp,sp,48
    800030b0:	00008067          	ret

00000000800030b4 <_ZN3TCB5yieldEv>:

void TCB::yield(){
    800030b4:	ff010113          	addi	sp,sp,-16
    800030b8:	00113423          	sd	ra,8(sp)
    800030bc:	00813023          	sd	s0,0(sp)
    800030c0:	01010413          	addi	s0,sp,16
    thread_dispatch();
    800030c4:	ffffe097          	auipc	ra,0xffffe
    800030c8:	400080e7          	jalr	1024(ra) # 800014c4 <_Z15thread_dispatchv>
}
    800030cc:	00813083          	ld	ra,8(sp)
    800030d0:	00013403          	ld	s0,0(sp)
    800030d4:	01010113          	addi	sp,sp,16
    800030d8:	00008067          	ret

00000000800030dc <_ZN3TCB8dispatchEv>:

void TCB::dispatch(){
    800030dc:	fe010113          	addi	sp,sp,-32
    800030e0:	00113c23          	sd	ra,24(sp)
    800030e4:	00813823          	sd	s0,16(sp)
    800030e8:	00913423          	sd	s1,8(sp)
    800030ec:	02010413          	addi	s0,sp,32
     // The nullptr ifs in the code below are used in case the user forgot to add
     // the main thread in the main function. Something like that is rare, but
     // in case it happens this mechanism will prevent the total system crash.
     // Such a scenario can also occur if all threads somehow get blocked and there
     // is no idle thread in the system.
     TCB* old = running;
    800030f0:	00009497          	auipc	s1,0x9
    800030f4:	8904b483          	ld	s1,-1904(s1) # 8000b980 <_ZN3TCB7runningE>
     if(old != nullptr) {
    800030f8:	00048863          	beqz	s1,80003108 <_ZN3TCB8dispatchEv+0x2c>
    bool isRunning(){ return this->state == RUNNING;}
    800030fc:	0284a703          	lw	a4,40(s1)
         if (old->isRunning()) {
    80003100:	00100793          	li	a5,1
    80003104:	02f70c63          	beq	a4,a5,8000313c <_ZN3TCB8dispatchEv+0x60>
             Scheduler::put(old);
         }
     }
     running = Scheduler::get();
    80003108:	fffff097          	auipc	ra,0xfffff
    8000310c:	094080e7          	jalr	148(ra) # 8000219c <_ZN9Scheduler3getEv>
    80003110:	00009797          	auipc	a5,0x9
    80003114:	86a7b823          	sd	a0,-1936(a5) # 8000b980 <_ZN3TCB7runningE>

     //if(running != nullptr)
        contextSwitch(&old->context, &running->context);
    80003118:	03050593          	addi	a1,a0,48
    8000311c:	03048513          	addi	a0,s1,48
    80003120:	ffffe097          	auipc	ra,0xffffe
    80003124:	238080e7          	jalr	568(ra) # 80001358 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
}
    80003128:	01813083          	ld	ra,24(sp)
    8000312c:	01013403          	ld	s0,16(sp)
    80003130:	00813483          	ld	s1,8(sp)
    80003134:	02010113          	addi	sp,sp,32
    80003138:	00008067          	ret
             Scheduler::put(old);
    8000313c:	00048513          	mv	a0,s1
    80003140:	fffff097          	auipc	ra,0xfffff
    80003144:	08c080e7          	jalr	140(ra) # 800021cc <_ZN9Scheduler3putEP3TCB>
    80003148:	fc1ff06f          	j	80003108 <_ZN3TCB8dispatchEv+0x2c>

000000008000314c <_ZN3TCB4exitEv>:

void TCB::exit(){
    8000314c:	ff010113          	addi	sp,sp,-16
    80003150:	00113423          	sd	ra,8(sp)
    80003154:	00813023          	sd	s0,0(sp)
    80003158:	01010413          	addi	s0,sp,16
    // Set its flag to because it's done
    running->setFinished(true);
    8000315c:	00009517          	auipc	a0,0x9
    80003160:	82453503          	ld	a0,-2012(a0) # 8000b980 <_ZN3TCB7runningE>
    void setFinished(bool finished){ this->state = finished? FINISHED:RUNNING; }
    80003164:	02052423          	sw	zero,40(a0)

    // Put in scheduler all the threads that were waiting for this one to end. (join function)
    for(TCB* temp = running->joinWaitList.removeFirst(); temp; temp = running->joinWaitList.removeFirst()) {
    80003168:	04850513          	addi	a0,a0,72
    8000316c:	fffff097          	auipc	ra,0xfffff
    80003170:	d50080e7          	jalr	-688(ra) # 80001ebc <_ZN4List11removeFirstEv>
    80003174:	02050663          	beqz	a0,800031a0 <_ZN3TCB4exitEv+0x54>
    void setSleeping(bool sleeping) { this->state = sleeping?SLEEPING:RUNNING; }
    80003178:	00100793          	li	a5,1
    8000317c:	02f52423          	sw	a5,40(a0)
        temp->setSleeping(false);
        Scheduler::put(temp);
    80003180:	fffff097          	auipc	ra,0xfffff
    80003184:	04c080e7          	jalr	76(ra) # 800021cc <_ZN9Scheduler3putEP3TCB>
    for(TCB* temp = running->joinWaitList.removeFirst(); temp; temp = running->joinWaitList.removeFirst()) {
    80003188:	00008517          	auipc	a0,0x8
    8000318c:	7f853503          	ld	a0,2040(a0) # 8000b980 <_ZN3TCB7runningE>
    80003190:	04850513          	addi	a0,a0,72
    80003194:	fffff097          	auipc	ra,0xfffff
    80003198:	d28080e7          	jalr	-728(ra) # 80001ebc <_ZN4List11removeFirstEv>
    8000319c:	fd9ff06f          	j	80003174 <_ZN3TCB4exitEv+0x28>
    }

    // Dispatch at the very end
    yield();
    800031a0:	00000097          	auipc	ra,0x0
    800031a4:	f14080e7          	jalr	-236(ra) # 800030b4 <_ZN3TCB5yieldEv>
}
    800031a8:	00813083          	ld	ra,8(sp)
    800031ac:	00013403          	ld	s0,0(sp)
    800031b0:	01010113          	addi	sp,sp,16
    800031b4:	00008067          	ret

00000000800031b8 <_ZN3TCB13threadWrapperEv>:
    running->setSleeping(true);
    thread->joinWaitList.addLast(running); // Current thread added to the wait list
    yield(); // dispatch
}

void TCB::threadWrapper(){
    800031b8:	ff010113          	addi	sp,sp,-16
    800031bc:	00113423          	sd	ra,8(sp)
    800031c0:	00813023          	sd	s0,0(sp)
    800031c4:	01010413          	addi	s0,sp,16
    // Kada se uradi dispatch, iz sistemskog moda ili nekog drugog se skace
    // na threadWrapper nekog threada, ako se on prvi put startuje. To ce
    // dovesti do toga da sistemske ili user privilegije ostanu kao stare (thread odakle se skocilo)
    // iako mi vise nismo tamo. popSppSpie obezbedjuje da se te privilegije promene i da budu onakve
    // kakve treba da budu za ovaj thread koji sada startuje.
    riscv::popSppSpie();
    800031c8:	00000097          	auipc	ra,0x0
    800031cc:	db0080e7          	jalr	-592(ra) # 80002f78 <_ZN5riscv10popSppSpieEv>

    // Start the thread (Glavni poziv funkcije koju zapravo obavlja thread)
    running->body(running->argument);
    800031d0:	00008797          	auipc	a5,0x8
    800031d4:	7b07b783          	ld	a5,1968(a5) # 8000b980 <_ZN3TCB7runningE>
    800031d8:	0087b703          	ld	a4,8(a5)
    800031dc:	0107b503          	ld	a0,16(a5)
    800031e0:	000700e7          	jalr	a4

    // Call the exit of the thread at the end
    exit();
    800031e4:	00000097          	auipc	ra,0x0
    800031e8:	f68080e7          	jalr	-152(ra) # 8000314c <_ZN3TCB4exitEv>
    800031ec:	00813083          	ld	ra,8(sp)
    800031f0:	00013403          	ld	s0,0(sp)
    800031f4:	01010113          	addi	sp,sp,16
    800031f8:	00008067          	ret

00000000800031fc <_ZN3TCB4joinEPS_>:
    bool isFinished() const{ return this->state == FINISHED; }
    800031fc:	02852783          	lw	a5,40(a0)
    if(thread->isFinished()) return;
    80003200:	00079463          	bnez	a5,80003208 <_ZN3TCB4joinEPS_+0xc>
    80003204:	00008067          	ret
void TCB::join(TCB* thread){
    80003208:	ff010113          	addi	sp,sp,-16
    8000320c:	00113423          	sd	ra,8(sp)
    80003210:	00813023          	sd	s0,0(sp)
    80003214:	01010413          	addi	s0,sp,16
    running->setSleeping(true);
    80003218:	00008597          	auipc	a1,0x8
    8000321c:	7685b583          	ld	a1,1896(a1) # 8000b980 <_ZN3TCB7runningE>
    void setSleeping(bool sleeping) { this->state = sleeping?SLEEPING:RUNNING; }
    80003220:	00300793          	li	a5,3
    80003224:	02f5a423          	sw	a5,40(a1)
    thread->joinWaitList.addLast(running); // Current thread added to the wait list
    80003228:	04850513          	addi	a0,a0,72
    8000322c:	fffff097          	auipc	ra,0xfffff
    80003230:	c58080e7          	jalr	-936(ra) # 80001e84 <_ZN4List7addLastEP3TCB>
    yield(); // dispatch
    80003234:	00000097          	auipc	ra,0x0
    80003238:	e80080e7          	jalr	-384(ra) # 800030b4 <_ZN3TCB5yieldEv>
}
    8000323c:	00813083          	ld	ra,8(sp)
    80003240:	00013403          	ld	s0,0(sp)
    80003244:	01010113          	addi	sp,sp,16
    80003248:	00008067          	ret

000000008000324c <_ZN4_sem5blockEv>:
    if(closed) return -1;
    if(++val <= 0) unblock();
    return 0;
}

void _sem::block() {
    8000324c:	fe010113          	addi	sp,sp,-32
    80003250:	00113c23          	sd	ra,24(sp)
    80003254:	00813823          	sd	s0,16(sp)
    80003258:	00913423          	sd	s1,8(sp)
    8000325c:	02010413          	addi	s0,sp,32
    // Adding the running thread to a blocked list by a FIFO mechanism
    this->blocked.addLast(TCB::running);
    80003260:	00008497          	auipc	s1,0x8
    80003264:	6904b483          	ld	s1,1680(s1) # 8000b8f0 <_GLOBAL_OFFSET_TABLE_+0x48>
    80003268:	0004b583          	ld	a1,0(s1)
    8000326c:	00850513          	addi	a0,a0,8
    80003270:	fffff097          	auipc	ra,0xfffff
    80003274:	c14080e7          	jalr	-1004(ra) # 80001e84 <_ZN4List7addLastEP3TCB>

    // Blocking
    TCB::running->setBlocked(true);
    80003278:	0004b783          	ld	a5,0(s1)
    void setBlocked(bool blocked) { this->state = blocked?BLOCKED:RUNNING; }
    8000327c:	00200713          	li	a4,2
    80003280:	02e7a423          	sw	a4,40(a5)
    TCB::yield();
    80003284:	00000097          	auipc	ra,0x0
    80003288:	e30080e7          	jalr	-464(ra) # 800030b4 <_ZN3TCB5yieldEv>
}
    8000328c:	01813083          	ld	ra,24(sp)
    80003290:	01013403          	ld	s0,16(sp)
    80003294:	00813483          	ld	s1,8(sp)
    80003298:	02010113          	addi	sp,sp,32
    8000329c:	00008067          	ret

00000000800032a0 <_ZN4_sem4waitEv>:
    if(closed) return -1;
    800032a0:	00454783          	lbu	a5,4(a0)
    800032a4:	04079663          	bnez	a5,800032f0 <_ZN4_sem4waitEv+0x50>
    if(--val<0) block();
    800032a8:	00052783          	lw	a5,0(a0)
    800032ac:	fff7879b          	addiw	a5,a5,-1
    800032b0:	00f52023          	sw	a5,0(a0)
    800032b4:	02079713          	slli	a4,a5,0x20
    800032b8:	00074663          	bltz	a4,800032c4 <_ZN4_sem4waitEv+0x24>
    return 0;
    800032bc:	00000513          	li	a0,0
}
    800032c0:	00008067          	ret
int _sem::wait() {
    800032c4:	ff010113          	addi	sp,sp,-16
    800032c8:	00113423          	sd	ra,8(sp)
    800032cc:	00813023          	sd	s0,0(sp)
    800032d0:	01010413          	addi	s0,sp,16
    if(--val<0) block();
    800032d4:	00000097          	auipc	ra,0x0
    800032d8:	f78080e7          	jalr	-136(ra) # 8000324c <_ZN4_sem5blockEv>
    return 0;
    800032dc:	00000513          	li	a0,0
}
    800032e0:	00813083          	ld	ra,8(sp)
    800032e4:	00013403          	ld	s0,0(sp)
    800032e8:	01010113          	addi	sp,sp,16
    800032ec:	00008067          	ret
    if(closed) return -1;
    800032f0:	fff00513          	li	a0,-1
    800032f4:	00008067          	ret

00000000800032f8 <_ZN4_sem7unblockEv>:

void _sem::unblock(){
    800032f8:	ff010113          	addi	sp,sp,-16
    800032fc:	00113423          	sd	ra,8(sp)
    80003300:	00813023          	sd	s0,0(sp)
    80003304:	01010413          	addi	s0,sp,16
    // Getting a blocked thread by a FIFO mechanism
    TCB* temp = this->blocked.removeFirst();
    80003308:	00850513          	addi	a0,a0,8
    8000330c:	fffff097          	auipc	ra,0xfffff
    80003310:	bb0080e7          	jalr	-1104(ra) # 80001ebc <_ZN4List11removeFirstEv>

    // Checking if unblock was called on an empty blocked list.
    if (temp == nullptr) return;
    80003314:	00050a63          	beqz	a0,80003328 <_ZN4_sem7unblockEv+0x30>
    80003318:	00100793          	li	a5,1
    8000331c:	02f52423          	sw	a5,40(a0)

    // Unblocking
    temp->setBlocked(false);
    Scheduler::put(temp);
    80003320:	fffff097          	auipc	ra,0xfffff
    80003324:	eac080e7          	jalr	-340(ra) # 800021cc <_ZN9Scheduler3putEP3TCB>
}
    80003328:	00813083          	ld	ra,8(sp)
    8000332c:	00013403          	ld	s0,0(sp)
    80003330:	01010113          	addi	sp,sp,16
    80003334:	00008067          	ret

0000000080003338 <_ZN4_sem6signalEv>:
    if(closed) return -1;
    80003338:	00454783          	lbu	a5,4(a0)
    8000333c:	04079663          	bnez	a5,80003388 <_ZN4_sem6signalEv+0x50>
    if(++val <= 0) unblock();
    80003340:	00052783          	lw	a5,0(a0)
    80003344:	0017879b          	addiw	a5,a5,1
    80003348:	0007871b          	sext.w	a4,a5
    8000334c:	00f52023          	sw	a5,0(a0)
    80003350:	00e05663          	blez	a4,8000335c <_ZN4_sem6signalEv+0x24>
    return 0;
    80003354:	00000513          	li	a0,0
}
    80003358:	00008067          	ret
int _sem::signal() {
    8000335c:	ff010113          	addi	sp,sp,-16
    80003360:	00113423          	sd	ra,8(sp)
    80003364:	00813023          	sd	s0,0(sp)
    80003368:	01010413          	addi	s0,sp,16
    if(++val <= 0) unblock();
    8000336c:	00000097          	auipc	ra,0x0
    80003370:	f8c080e7          	jalr	-116(ra) # 800032f8 <_ZN4_sem7unblockEv>
    return 0;
    80003374:	00000513          	li	a0,0
}
    80003378:	00813083          	ld	ra,8(sp)
    8000337c:	00013403          	ld	s0,0(sp)
    80003380:	01010113          	addi	sp,sp,16
    80003384:	00008067          	ret
    if(closed) return -1;
    80003388:	fff00513          	li	a0,-1
    8000338c:	00008067          	ret

0000000080003390 <_ZN4_sem5closeEv>:

int _sem::close(){
    80003390:	fe010113          	addi	sp,sp,-32
    80003394:	00113c23          	sd	ra,24(sp)
    80003398:	00813823          	sd	s0,16(sp)
    8000339c:	00913423          	sd	s1,8(sp)
    800033a0:	02010413          	addi	s0,sp,32
    800033a4:	00050493          	mv	s1,a0
    // We assume that closing a semaphore that has already been closed is not an error
    // if (this->closed) return -1;

    this->closed = true;
    800033a8:	00100793          	li	a5,1
    800033ac:	00f50223          	sb	a5,4(a0)

    // Unblocking all the threads blocked on this semaphore
    TCB* temp;
    while((temp = this->blocked.removeFirst()) != nullptr){
    800033b0:	00848513          	addi	a0,s1,8
    800033b4:	fffff097          	auipc	ra,0xfffff
    800033b8:	b08080e7          	jalr	-1272(ra) # 80001ebc <_ZN4List11removeFirstEv>
    800033bc:	00050c63          	beqz	a0,800033d4 <_ZN4_sem5closeEv+0x44>
    800033c0:	00100793          	li	a5,1
    800033c4:	02f52423          	sw	a5,40(a0)
        temp->setBlocked(false);
        Scheduler::put(temp);
    800033c8:	fffff097          	auipc	ra,0xfffff
    800033cc:	e04080e7          	jalr	-508(ra) # 800021cc <_ZN9Scheduler3putEP3TCB>
    while((temp = this->blocked.removeFirst()) != nullptr){
    800033d0:	fe1ff06f          	j	800033b0 <_ZN4_sem5closeEv+0x20>
    }
    return 0;
}
    800033d4:	00000513          	li	a0,0
    800033d8:	01813083          	ld	ra,24(sp)
    800033dc:	01013403          	ld	s0,16(sp)
    800033e0:	00813483          	ld	s1,8(sp)
    800033e4:	02010113          	addi	sp,sp,32
    800033e8:	00008067          	ret

00000000800033ec <_Z41__static_initialization_and_destruction_0ii>:
        }
        head = newFreeDesc;
    }
    return 0;

}
    800033ec:	ff010113          	addi	sp,sp,-16
    800033f0:	00813423          	sd	s0,8(sp)
    800033f4:	01010413          	addi	s0,sp,16
    800033f8:	00100793          	li	a5,1
    800033fc:	00f50863          	beq	a0,a5,8000340c <_Z41__static_initialization_and_destruction_0ii+0x20>
    80003400:	00813403          	ld	s0,8(sp)
    80003404:	01010113          	addi	sp,sp,16
    80003408:	00008067          	ret
    8000340c:	000107b7          	lui	a5,0x10
    80003410:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80003414:	fef596e3          	bne	a1,a5,80003400 <_Z41__static_initialization_and_destruction_0ii+0x14>
free_memory* MemoryAllocator::head = (free_memory*)HEAP_START_ADDR;// Initializes to 0
    80003418:	00008797          	auipc	a5,0x8
    8000341c:	4a87b783          	ld	a5,1192(a5) # 8000b8c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003420:	0007b783          	ld	a5,0(a5)
    80003424:	00008717          	auipc	a4,0x8
    80003428:	56f73623          	sd	a5,1388(a4) # 8000b990 <_ZN15MemoryAllocator4headE>
}
    8000342c:	fd5ff06f          	j	80003400 <_Z41__static_initialization_and_destruction_0ii+0x14>

0000000080003430 <_ZN15MemoryAllocator9mem_allocEm>:
void* MemoryAllocator::mem_alloc(size_t size){
    80003430:	ff010113          	addi	sp,sp,-16
    80003434:	00813423          	sd	s0,8(sp)
    80003438:	01010413          	addi	s0,sp,16
    8000343c:	00050713          	mv	a4,a0
    if(stateZero){
    80003440:	00008797          	auipc	a5,0x8
    80003444:	2b07c783          	lbu	a5,688(a5) # 8000b6f0 <_ZN15MemoryAllocator9stateZeroE>
    80003448:	02078e63          	beqz	a5,80003484 <_ZN15MemoryAllocator9mem_allocEm+0x54>
        head = (free_memory*)HEAP_START_ADDR; // Added initialization because of first value 0
    8000344c:	00008797          	auipc	a5,0x8
    80003450:	4747b783          	ld	a5,1140(a5) # 8000b8c0 <_GLOBAL_OFFSET_TABLE_+0x18>
    80003454:	0007b683          	ld	a3,0(a5)
    80003458:	00008797          	auipc	a5,0x8
    8000345c:	52d7bc23          	sd	a3,1336(a5) # 8000b990 <_ZN15MemoryAllocator4headE>
        head->size = ((uint8*)HEAP_END_ADDR - (uint8*)HEAP_START_ADDR)/MEM_BLOCK_SIZE;
    80003460:	00008797          	auipc	a5,0x8
    80003464:	4987b783          	ld	a5,1176(a5) # 8000b8f8 <_GLOBAL_OFFSET_TABLE_+0x50>
    80003468:	0007b783          	ld	a5,0(a5)
    8000346c:	40d787b3          	sub	a5,a5,a3
    80003470:	0067d793          	srli	a5,a5,0x6
    80003474:	00f6b423          	sd	a5,8(a3)
        head->next = nullptr;
    80003478:	0006b023          	sd	zero,0(a3)
        stateZero = false;
    8000347c:	00008797          	auipc	a5,0x8
    80003480:	26078a23          	sb	zero,628(a5) # 8000b6f0 <_ZN15MemoryAllocator9stateZeroE>
    for(free_memory* temp = head; temp; temp = temp->next){
    80003484:	00008517          	auipc	a0,0x8
    80003488:	50c53503          	ld	a0,1292(a0) # 8000b990 <_ZN15MemoryAllocator4headE>
    free_memory* prev = nullptr;
    8000348c:	00000693          	li	a3,0
    for(free_memory* temp = head; temp; temp = temp->next){
    80003490:	04050463          	beqz	a0,800034d8 <_ZN15MemoryAllocator9mem_allocEm+0xa8>
        if(temp->size >= size){
    80003494:	00853783          	ld	a5,8(a0)
    80003498:	00e7f863          	bgeu	a5,a4,800034a8 <_ZN15MemoryAllocator9mem_allocEm+0x78>
        prev = temp;
    8000349c:	00050693          	mv	a3,a0
    for(free_memory* temp = head; temp; temp = temp->next){
    800034a0:	00053503          	ld	a0,0(a0)
    800034a4:	fedff06f          	j	80003490 <_ZN15MemoryAllocator9mem_allocEm+0x60>
            if(temp->size == size) {
    800034a8:	02e78e63          	beq	a5,a4,800034e4 <_ZN15MemoryAllocator9mem_allocEm+0xb4>
                temp = (free_memory*)((uint8*)temp + size*MEM_BLOCK_SIZE);
    800034ac:	00671793          	slli	a5,a4,0x6
    800034b0:	00f507b3          	add	a5,a0,a5
                temp->size -= size;
    800034b4:	0087b603          	ld	a2,8(a5)
    800034b8:	40e60633          	sub	a2,a2,a4
    800034bc:	00c7b423          	sd	a2,8(a5)
                if(prev) prev->next = temp;
    800034c0:	04068263          	beqz	a3,80003504 <_ZN15MemoryAllocator9mem_allocEm+0xd4>
    800034c4:	00f6b023          	sd	a5,0(a3)
            *((uint64*)ret) = size;
    800034c8:	00e53023          	sd	a4,0(a0)
            ret += prefixSize;
    800034cc:	00008797          	auipc	a5,0x8
    800034d0:	22c7b783          	ld	a5,556(a5) # 8000b6f8 <_ZN15MemoryAllocator10prefixSizeE>
    800034d4:	00f50533          	add	a0,a0,a5
}
    800034d8:	00813403          	ld	s0,8(sp)
    800034dc:	01010113          	addi	sp,sp,16
    800034e0:	00008067          	ret
                if(prev) prev->next = temp->next;
    800034e4:	00068863          	beqz	a3,800034f4 <_ZN15MemoryAllocator9mem_allocEm+0xc4>
    800034e8:	00053783          	ld	a5,0(a0)
    800034ec:	00f6b023          	sd	a5,0(a3)
    800034f0:	fd9ff06f          	j	800034c8 <_ZN15MemoryAllocator9mem_allocEm+0x98>
                else head = temp->next;
    800034f4:	00053783          	ld	a5,0(a0)
    800034f8:	00008697          	auipc	a3,0x8
    800034fc:	48f6bc23          	sd	a5,1176(a3) # 8000b990 <_ZN15MemoryAllocator4headE>
    80003500:	fc9ff06f          	j	800034c8 <_ZN15MemoryAllocator9mem_allocEm+0x98>
                else head = temp;
    80003504:	00008697          	auipc	a3,0x8
    80003508:	48f6b623          	sd	a5,1164(a3) # 8000b990 <_ZN15MemoryAllocator4headE>
    8000350c:	fbdff06f          	j	800034c8 <_ZN15MemoryAllocator9mem_allocEm+0x98>

0000000080003510 <_ZN15MemoryAllocator8mem_freeEPv>:
int MemoryAllocator::mem_free(void* fragment) {
    80003510:	ff010113          	addi	sp,sp,-16
    80003514:	00813423          	sd	s0,8(sp)
    80003518:	01010413          	addi	s0,sp,16
    if(fragment == nullptr) return -1;
    8000351c:	10050c63          	beqz	a0,80003634 <_ZN15MemoryAllocator8mem_freeEPv+0x124>
    uint8* fragToBeFreed = (uint8*)fragment - prefixSize;
    80003520:	00008797          	auipc	a5,0x8
    80003524:	1d87b783          	ld	a5,472(a5) # 8000b6f8 <_ZN15MemoryAllocator10prefixSizeE>
    80003528:	40f50533          	sub	a0,a0,a5
    free_memory* temp = ((void*)head > fragToBeFreed)? nullptr: head;
    8000352c:	00008797          	auipc	a5,0x8
    80003530:	4647b783          	ld	a5,1124(a5) # 8000b990 <_ZN15MemoryAllocator4headE>
    80003534:	00f57463          	bgeu	a0,a5,8000353c <_ZN15MemoryAllocator8mem_freeEPv+0x2c>
    80003538:	00000793          	li	a5,0
    8000353c:	00000713          	li	a4,0
    80003540:	00c0006f          	j	8000354c <_ZN15MemoryAllocator8mem_freeEPv+0x3c>
        prev = temp;
    80003544:	00078713          	mv	a4,a5
    for(; temp && temp<=(free_memory*)fragToBeFreed; temp = temp->next) {
    80003548:	0007b783          	ld	a5,0(a5)
    8000354c:	02078063          	beqz	a5,8000356c <_ZN15MemoryAllocator8mem_freeEPv+0x5c>
    80003550:	00f56e63          	bltu	a0,a5,8000356c <_ZN15MemoryAllocator8mem_freeEPv+0x5c>
        if ((uint8 *) temp + temp->size*MEM_BLOCK_SIZE > (uint8*)fragToBeFreed)
    80003554:	0087b703          	ld	a4,8(a5)
    80003558:	00671713          	slli	a4,a4,0x6
    8000355c:	00e78733          	add	a4,a5,a4
    80003560:	fee572e3          	bgeu	a0,a4,80003544 <_ZN15MemoryAllocator8mem_freeEPv+0x34>
            return -1; // error, fragment to be freed intersects a free memory block
    80003564:	fff00513          	li	a0,-1
    80003568:	04c0006f          	j	800035b4 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
    newFreeDesc->size = *((uint64*)fragToBeFreed);
    8000356c:	00053783          	ld	a5,0(a0)
    80003570:	00f53423          	sd	a5,8(a0)
    if(prev) {
    80003574:	02070c63          	beqz	a4,800035ac <_ZN15MemoryAllocator8mem_freeEPv+0x9c>
        newFreeDesc->next = prev->next? prev->next : nullptr;
    80003578:	00073783          	ld	a5,0(a4)
    8000357c:	00f53023          	sd	a5,0(a0)
        prev->next = newFreeDesc;
    80003580:	00a73023          	sd	a0,0(a4)
        if (newFreeDesc->next && ((uint8 *) newFreeDesc + newFreeDesc->size*MEM_BLOCK_SIZE == (uint8 *) newFreeDesc->next)) {
    80003584:	00053783          	ld	a5,0(a0)
    80003588:	00078a63          	beqz	a5,8000359c <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
    8000358c:	00853603          	ld	a2,8(a0)
    80003590:	00661693          	slli	a3,a2,0x6
    80003594:	00d506b3          	add	a3,a0,a3
    80003598:	02d78463          	beq	a5,a3,800035c0 <_ZN15MemoryAllocator8mem_freeEPv+0xb0>
        if((uint8*)prev + prev->size*MEM_BLOCK_SIZE == (uint8*)newFreeDesc) {
    8000359c:	00873683          	ld	a3,8(a4)
    800035a0:	00669793          	slli	a5,a3,0x6
    800035a4:	00f707b3          	add	a5,a4,a5
    800035a8:	02a78863          	beq	a5,a0,800035d8 <_ZN15MemoryAllocator8mem_freeEPv+0xc8>
    if(!prev){
    800035ac:	04070263          	beqz	a4,800035f0 <_ZN15MemoryAllocator8mem_freeEPv+0xe0>
    return 0;
    800035b0:	00000513          	li	a0,0
}
    800035b4:	00813403          	ld	s0,8(sp)
    800035b8:	01010113          	addi	sp,sp,16
    800035bc:	00008067          	ret
            newFreeDesc->size += newFreeDesc->next->size;
    800035c0:	0087b683          	ld	a3,8(a5)
    800035c4:	00d60633          	add	a2,a2,a3
    800035c8:	00c53423          	sd	a2,8(a0)
            newFreeDesc->next = newFreeDesc->next->next? newFreeDesc->next->next : nullptr;
    800035cc:	0007b783          	ld	a5,0(a5)
    800035d0:	00f53023          	sd	a5,0(a0)
    800035d4:	fc9ff06f          	j	8000359c <_ZN15MemoryAllocator8mem_freeEPv+0x8c>
            prev->size += newFreeDesc->size;
    800035d8:	00853783          	ld	a5,8(a0)
    800035dc:	00f686b3          	add	a3,a3,a5
    800035e0:	00d73423          	sd	a3,8(a4)
            prev->next = newFreeDesc->next;
    800035e4:	00053783          	ld	a5,0(a0)
    800035e8:	00f73023          	sd	a5,0(a4)
    800035ec:	fc1ff06f          	j	800035ac <_ZN15MemoryAllocator8mem_freeEPv+0x9c>
        newFreeDesc->next = head;
    800035f0:	00008717          	auipc	a4,0x8
    800035f4:	3a073703          	ld	a4,928(a4) # 8000b990 <_ZN15MemoryAllocator4headE>
    800035f8:	00e53023          	sd	a4,0(a0)
        if ((uint8*)newFreeDesc + newFreeDesc->size*MEM_BLOCK_SIZE == (uint8 *)head) {
    800035fc:	00853683          	ld	a3,8(a0)
    80003600:	00669793          	slli	a5,a3,0x6
    80003604:	00f507b3          	add	a5,a0,a5
    80003608:	00f70a63          	beq	a4,a5,8000361c <_ZN15MemoryAllocator8mem_freeEPv+0x10c>
        head = newFreeDesc;
    8000360c:	00008797          	auipc	a5,0x8
    80003610:	38a7b223          	sd	a0,900(a5) # 8000b990 <_ZN15MemoryAllocator4headE>
    return 0;
    80003614:	00000513          	li	a0,0
    80003618:	f9dff06f          	j	800035b4 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>
            newFreeDesc->size += head->size;
    8000361c:	00873783          	ld	a5,8(a4)
    80003620:	00f686b3          	add	a3,a3,a5
    80003624:	00d53423          	sd	a3,8(a0)
            newFreeDesc->next = head->next;
    80003628:	00073783          	ld	a5,0(a4)
    8000362c:	00f53023          	sd	a5,0(a0)
    80003630:	fddff06f          	j	8000360c <_ZN15MemoryAllocator8mem_freeEPv+0xfc>
    if(fragment == nullptr) return -1;
    80003634:	fff00513          	li	a0,-1
    80003638:	f7dff06f          	j	800035b4 <_ZN15MemoryAllocator8mem_freeEPv+0xa4>

000000008000363c <_GLOBAL__sub_I__ZN15MemoryAllocator4headE>:
}
    8000363c:	ff010113          	addi	sp,sp,-16
    80003640:	00113423          	sd	ra,8(sp)
    80003644:	00813023          	sd	s0,0(sp)
    80003648:	01010413          	addi	s0,sp,16
    8000364c:	000105b7          	lui	a1,0x10
    80003650:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80003654:	00100513          	li	a0,1
    80003658:	00000097          	auipc	ra,0x0
    8000365c:	d94080e7          	jalr	-620(ra) # 800033ec <_Z41__static_initialization_and_destruction_0ii>
    80003660:	00813083          	ld	ra,8(sp)
    80003664:	00013403          	ld	s0,0(sp)
    80003668:	01010113          	addi	sp,sp,16
    8000366c:	00008067          	ret

0000000080003670 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80003670:	fe010113          	addi	sp,sp,-32
    80003674:	00113c23          	sd	ra,24(sp)
    80003678:	00813823          	sd	s0,16(sp)
    8000367c:	00913423          	sd	s1,8(sp)
    80003680:	01213023          	sd	s2,0(sp)
    80003684:	02010413          	addi	s0,sp,32
    80003688:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    8000368c:	00000913          	li	s2,0
    80003690:	00c0006f          	j	8000369c <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003694:	ffffe097          	auipc	ra,0xffffe
    80003698:	e30080e7          	jalr	-464(ra) # 800014c4 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    8000369c:	ffffe097          	auipc	ra,0xffffe
    800036a0:	f98080e7          	jalr	-104(ra) # 80001634 <_Z4getcv>
    800036a4:	0005059b          	sext.w	a1,a0
    800036a8:	01b00793          	li	a5,27
    800036ac:	02f58a63          	beq	a1,a5,800036e0 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    800036b0:	0084b503          	ld	a0,8(s1)
    800036b4:	00003097          	auipc	ra,0x3
    800036b8:	400080e7          	jalr	1024(ra) # 80006ab4 <_ZN6Buffer3putEi>
        i++;
    800036bc:	0019071b          	addiw	a4,s2,1
    800036c0:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800036c4:	0004a683          	lw	a3,0(s1)
    800036c8:	0026979b          	slliw	a5,a3,0x2
    800036cc:	00d787bb          	addw	a5,a5,a3
    800036d0:	0017979b          	slliw	a5,a5,0x1
    800036d4:	02f767bb          	remw	a5,a4,a5
    800036d8:	fc0792e3          	bnez	a5,8000369c <_ZL16producerKeyboardPv+0x2c>
    800036dc:	fb9ff06f          	j	80003694 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    800036e0:	00100793          	li	a5,1
    800036e4:	00008717          	auipc	a4,0x8
    800036e8:	2af72a23          	sw	a5,692(a4) # 8000b998 <_ZL9threadEnd>
    data->buffer->put('!');
    800036ec:	02100593          	li	a1,33
    800036f0:	0084b503          	ld	a0,8(s1)
    800036f4:	00003097          	auipc	ra,0x3
    800036f8:	3c0080e7          	jalr	960(ra) # 80006ab4 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    800036fc:	0104b503          	ld	a0,16(s1)
    80003700:	ffffe097          	auipc	ra,0xffffe
    80003704:	ec4080e7          	jalr	-316(ra) # 800015c4 <_Z10sem_signalP4_sem>
}
    80003708:	01813083          	ld	ra,24(sp)
    8000370c:	01013403          	ld	s0,16(sp)
    80003710:	00813483          	ld	s1,8(sp)
    80003714:	00013903          	ld	s2,0(sp)
    80003718:	02010113          	addi	sp,sp,32
    8000371c:	00008067          	ret

0000000080003720 <_ZL8producerPv>:

static void producer(void *arg) {
    80003720:	fe010113          	addi	sp,sp,-32
    80003724:	00113c23          	sd	ra,24(sp)
    80003728:	00813823          	sd	s0,16(sp)
    8000372c:	00913423          	sd	s1,8(sp)
    80003730:	01213023          	sd	s2,0(sp)
    80003734:	02010413          	addi	s0,sp,32
    80003738:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000373c:	00000913          	li	s2,0
    80003740:	00c0006f          	j	8000374c <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80003744:	ffffe097          	auipc	ra,0xffffe
    80003748:	d80080e7          	jalr	-640(ra) # 800014c4 <_Z15thread_dispatchv>
    while (!threadEnd) {
    8000374c:	00008797          	auipc	a5,0x8
    80003750:	24c7a783          	lw	a5,588(a5) # 8000b998 <_ZL9threadEnd>
    80003754:	02079e63          	bnez	a5,80003790 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003758:	0004a583          	lw	a1,0(s1)
    8000375c:	0305859b          	addiw	a1,a1,48
    80003760:	0084b503          	ld	a0,8(s1)
    80003764:	00003097          	auipc	ra,0x3
    80003768:	350080e7          	jalr	848(ra) # 80006ab4 <_ZN6Buffer3putEi>
        i++;
    8000376c:	0019071b          	addiw	a4,s2,1
    80003770:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80003774:	0004a683          	lw	a3,0(s1)
    80003778:	0026979b          	slliw	a5,a3,0x2
    8000377c:	00d787bb          	addw	a5,a5,a3
    80003780:	0017979b          	slliw	a5,a5,0x1
    80003784:	02f767bb          	remw	a5,a4,a5
    80003788:	fc0792e3          	bnez	a5,8000374c <_ZL8producerPv+0x2c>
    8000378c:	fb9ff06f          	j	80003744 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80003790:	0104b503          	ld	a0,16(s1)
    80003794:	ffffe097          	auipc	ra,0xffffe
    80003798:	e30080e7          	jalr	-464(ra) # 800015c4 <_Z10sem_signalP4_sem>
}
    8000379c:	01813083          	ld	ra,24(sp)
    800037a0:	01013403          	ld	s0,16(sp)
    800037a4:	00813483          	ld	s1,8(sp)
    800037a8:	00013903          	ld	s2,0(sp)
    800037ac:	02010113          	addi	sp,sp,32
    800037b0:	00008067          	ret

00000000800037b4 <_ZL8consumerPv>:

static void consumer(void *arg) {
    800037b4:	fd010113          	addi	sp,sp,-48
    800037b8:	02113423          	sd	ra,40(sp)
    800037bc:	02813023          	sd	s0,32(sp)
    800037c0:	00913c23          	sd	s1,24(sp)
    800037c4:	01213823          	sd	s2,16(sp)
    800037c8:	01313423          	sd	s3,8(sp)
    800037cc:	03010413          	addi	s0,sp,48
    800037d0:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800037d4:	00000993          	li	s3,0
    800037d8:	01c0006f          	j	800037f4 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800037dc:	ffffe097          	auipc	ra,0xffffe
    800037e0:	ce8080e7          	jalr	-792(ra) # 800014c4 <_Z15thread_dispatchv>
    800037e4:	0500006f          	j	80003834 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    800037e8:	00a00513          	li	a0,10
    800037ec:	ffffe097          	auipc	ra,0xffffe
    800037f0:	e7c080e7          	jalr	-388(ra) # 80001668 <_Z4putcc>
    while (!threadEnd) {
    800037f4:	00008797          	auipc	a5,0x8
    800037f8:	1a47a783          	lw	a5,420(a5) # 8000b998 <_ZL9threadEnd>
    800037fc:	06079063          	bnez	a5,8000385c <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003800:	00893503          	ld	a0,8(s2)
    80003804:	00003097          	auipc	ra,0x3
    80003808:	340080e7          	jalr	832(ra) # 80006b44 <_ZN6Buffer3getEv>
        i++;
    8000380c:	0019849b          	addiw	s1,s3,1
    80003810:	0004899b          	sext.w	s3,s1
        putc(key);
    80003814:	0ff57513          	andi	a0,a0,255
    80003818:	ffffe097          	auipc	ra,0xffffe
    8000381c:	e50080e7          	jalr	-432(ra) # 80001668 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003820:	00092703          	lw	a4,0(s2)
    80003824:	0027179b          	slliw	a5,a4,0x2
    80003828:	00e787bb          	addw	a5,a5,a4
    8000382c:	02f4e7bb          	remw	a5,s1,a5
    80003830:	fa0786e3          	beqz	a5,800037dc <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80003834:	05000793          	li	a5,80
    80003838:	02f4e4bb          	remw	s1,s1,a5
    8000383c:	fa049ce3          	bnez	s1,800037f4 <_ZL8consumerPv+0x40>
    80003840:	fa9ff06f          	j	800037e8 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80003844:	00893503          	ld	a0,8(s2)
    80003848:	00003097          	auipc	ra,0x3
    8000384c:	2fc080e7          	jalr	764(ra) # 80006b44 <_ZN6Buffer3getEv>
        putc(key);
    80003850:	0ff57513          	andi	a0,a0,255
    80003854:	ffffe097          	auipc	ra,0xffffe
    80003858:	e14080e7          	jalr	-492(ra) # 80001668 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    8000385c:	00893503          	ld	a0,8(s2)
    80003860:	00003097          	auipc	ra,0x3
    80003864:	370080e7          	jalr	880(ra) # 80006bd0 <_ZN6Buffer6getCntEv>
    80003868:	fca04ee3          	bgtz	a0,80003844 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    8000386c:	01093503          	ld	a0,16(s2)
    80003870:	ffffe097          	auipc	ra,0xffffe
    80003874:	d54080e7          	jalr	-684(ra) # 800015c4 <_Z10sem_signalP4_sem>
}
    80003878:	02813083          	ld	ra,40(sp)
    8000387c:	02013403          	ld	s0,32(sp)
    80003880:	01813483          	ld	s1,24(sp)
    80003884:	01013903          	ld	s2,16(sp)
    80003888:	00813983          	ld	s3,8(sp)
    8000388c:	03010113          	addi	sp,sp,48
    80003890:	00008067          	ret

0000000080003894 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80003894:	f9010113          	addi	sp,sp,-112
    80003898:	06113423          	sd	ra,104(sp)
    8000389c:	06813023          	sd	s0,96(sp)
    800038a0:	04913c23          	sd	s1,88(sp)
    800038a4:	05213823          	sd	s2,80(sp)
    800038a8:	05313423          	sd	s3,72(sp)
    800038ac:	05413023          	sd	s4,64(sp)
    800038b0:	03513c23          	sd	s5,56(sp)
    800038b4:	03613823          	sd	s6,48(sp)
    800038b8:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800038bc:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800038c0:	00006517          	auipc	a0,0x6
    800038c4:	87850513          	addi	a0,a0,-1928 # 80009138 <_ZZ18kernelPrintIntegermE6digits+0x118>
    800038c8:	00002097          	auipc	ra,0x2
    800038cc:	220080e7          	jalr	544(ra) # 80005ae8 <_Z11printStringPKc>
    getString(input, 30);
    800038d0:	01e00593          	li	a1,30
    800038d4:	fa040493          	addi	s1,s0,-96
    800038d8:	00048513          	mv	a0,s1
    800038dc:	00002097          	auipc	ra,0x2
    800038e0:	294080e7          	jalr	660(ra) # 80005b70 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800038e4:	00048513          	mv	a0,s1
    800038e8:	00002097          	auipc	ra,0x2
    800038ec:	360080e7          	jalr	864(ra) # 80005c48 <_Z11stringToIntPKc>
    800038f0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800038f4:	00006517          	auipc	a0,0x6
    800038f8:	86450513          	addi	a0,a0,-1948 # 80009158 <_ZZ18kernelPrintIntegermE6digits+0x138>
    800038fc:	00002097          	auipc	ra,0x2
    80003900:	1ec080e7          	jalr	492(ra) # 80005ae8 <_Z11printStringPKc>
    getString(input, 30);
    80003904:	01e00593          	li	a1,30
    80003908:	00048513          	mv	a0,s1
    8000390c:	00002097          	auipc	ra,0x2
    80003910:	264080e7          	jalr	612(ra) # 80005b70 <_Z9getStringPci>
    n = stringToInt(input);
    80003914:	00048513          	mv	a0,s1
    80003918:	00002097          	auipc	ra,0x2
    8000391c:	330080e7          	jalr	816(ra) # 80005c48 <_Z11stringToIntPKc>
    80003920:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80003924:	00006517          	auipc	a0,0x6
    80003928:	85450513          	addi	a0,a0,-1964 # 80009178 <_ZZ18kernelPrintIntegermE6digits+0x158>
    8000392c:	00002097          	auipc	ra,0x2
    80003930:	1bc080e7          	jalr	444(ra) # 80005ae8 <_Z11printStringPKc>
    80003934:	00000613          	li	a2,0
    80003938:	00a00593          	li	a1,10
    8000393c:	00090513          	mv	a0,s2
    80003940:	00002097          	auipc	ra,0x2
    80003944:	358080e7          	jalr	856(ra) # 80005c98 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003948:	00006517          	auipc	a0,0x6
    8000394c:	84850513          	addi	a0,a0,-1976 # 80009190 <_ZZ18kernelPrintIntegermE6digits+0x170>
    80003950:	00002097          	auipc	ra,0x2
    80003954:	198080e7          	jalr	408(ra) # 80005ae8 <_Z11printStringPKc>
    80003958:	00000613          	li	a2,0
    8000395c:	00a00593          	li	a1,10
    80003960:	00048513          	mv	a0,s1
    80003964:	00002097          	auipc	ra,0x2
    80003968:	334080e7          	jalr	820(ra) # 80005c98 <_Z8printIntiii>
    printString(".\n");
    8000396c:	00006517          	auipc	a0,0x6
    80003970:	83c50513          	addi	a0,a0,-1988 # 800091a8 <_ZZ18kernelPrintIntegermE6digits+0x188>
    80003974:	00002097          	auipc	ra,0x2
    80003978:	174080e7          	jalr	372(ra) # 80005ae8 <_Z11printStringPKc>
    if(threadNum > n) {
    8000397c:	0324c463          	blt	s1,s2,800039a4 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003980:	03205c63          	blez	s2,800039b8 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80003984:	03800513          	li	a0,56
    80003988:	fffff097          	auipc	ra,0xfffff
    8000398c:	a80080e7          	jalr	-1408(ra) # 80002408 <_Znwm>
    80003990:	00050a13          	mv	s4,a0
    80003994:	00048593          	mv	a1,s1
    80003998:	00003097          	auipc	ra,0x3
    8000399c:	080080e7          	jalr	128(ra) # 80006a18 <_ZN6BufferC1Ei>
    800039a0:	0300006f          	j	800039d0 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800039a4:	00006517          	auipc	a0,0x6
    800039a8:	80c50513          	addi	a0,a0,-2036 # 800091b0 <_ZZ18kernelPrintIntegermE6digits+0x190>
    800039ac:	00002097          	auipc	ra,0x2
    800039b0:	13c080e7          	jalr	316(ra) # 80005ae8 <_Z11printStringPKc>
        return;
    800039b4:	0140006f          	j	800039c8 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800039b8:	00006517          	auipc	a0,0x6
    800039bc:	83850513          	addi	a0,a0,-1992 # 800091f0 <_ZZ18kernelPrintIntegermE6digits+0x1d0>
    800039c0:	00002097          	auipc	ra,0x2
    800039c4:	128080e7          	jalr	296(ra) # 80005ae8 <_Z11printStringPKc>
        return;
    800039c8:	000b0113          	mv	sp,s6
    800039cc:	1500006f          	j	80003b1c <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800039d0:	00000593          	li	a1,0
    800039d4:	00008517          	auipc	a0,0x8
    800039d8:	fcc50513          	addi	a0,a0,-52 # 8000b9a0 <_ZL10waitForAll>
    800039dc:	ffffe097          	auipc	ra,0xffffe
    800039e0:	b34080e7          	jalr	-1228(ra) # 80001510 <_Z8sem_openPP4_semj>
    thread_t threads[threadNum];
    800039e4:	00391793          	slli	a5,s2,0x3
    800039e8:	00f78793          	addi	a5,a5,15
    800039ec:	ff07f793          	andi	a5,a5,-16
    800039f0:	40f10133          	sub	sp,sp,a5
    800039f4:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    800039f8:	0019071b          	addiw	a4,s2,1
    800039fc:	00171793          	slli	a5,a4,0x1
    80003a00:	00e787b3          	add	a5,a5,a4
    80003a04:	00379793          	slli	a5,a5,0x3
    80003a08:	00f78793          	addi	a5,a5,15
    80003a0c:	ff07f793          	andi	a5,a5,-16
    80003a10:	40f10133          	sub	sp,sp,a5
    80003a14:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003a18:	00191613          	slli	a2,s2,0x1
    80003a1c:	012607b3          	add	a5,a2,s2
    80003a20:	00379793          	slli	a5,a5,0x3
    80003a24:	00f987b3          	add	a5,s3,a5
    80003a28:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003a2c:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003a30:	00008717          	auipc	a4,0x8
    80003a34:	f7073703          	ld	a4,-144(a4) # 8000b9a0 <_ZL10waitForAll>
    80003a38:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003a3c:	00078613          	mv	a2,a5
    80003a40:	00000597          	auipc	a1,0x0
    80003a44:	d7458593          	addi	a1,a1,-652 # 800037b4 <_ZL8consumerPv>
    80003a48:	f9840513          	addi	a0,s0,-104
    80003a4c:	ffffe097          	auipc	ra,0xffffe
    80003a50:	9bc080e7          	jalr	-1604(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003a54:	00000493          	li	s1,0
    80003a58:	0280006f          	j	80003a80 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003a5c:	00000597          	auipc	a1,0x0
    80003a60:	c1458593          	addi	a1,a1,-1004 # 80003670 <_ZL16producerKeyboardPv>
                      data + i);
    80003a64:	00179613          	slli	a2,a5,0x1
    80003a68:	00f60633          	add	a2,a2,a5
    80003a6c:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003a70:	00c98633          	add	a2,s3,a2
    80003a74:	ffffe097          	auipc	ra,0xffffe
    80003a78:	994080e7          	jalr	-1644(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003a7c:	0014849b          	addiw	s1,s1,1
    80003a80:	0524d263          	bge	s1,s2,80003ac4 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80003a84:	00149793          	slli	a5,s1,0x1
    80003a88:	009787b3          	add	a5,a5,s1
    80003a8c:	00379793          	slli	a5,a5,0x3
    80003a90:	00f987b3          	add	a5,s3,a5
    80003a94:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80003a98:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80003a9c:	00008717          	auipc	a4,0x8
    80003aa0:	f0473703          	ld	a4,-252(a4) # 8000b9a0 <_ZL10waitForAll>
    80003aa4:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80003aa8:	00048793          	mv	a5,s1
    80003aac:	00349513          	slli	a0,s1,0x3
    80003ab0:	00aa8533          	add	a0,s5,a0
    80003ab4:	fa9054e3          	blez	s1,80003a5c <_Z22producerConsumer_C_APIv+0x1c8>
    80003ab8:	00000597          	auipc	a1,0x0
    80003abc:	c6858593          	addi	a1,a1,-920 # 80003720 <_ZL8producerPv>
    80003ac0:	fa5ff06f          	j	80003a64 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80003ac4:	ffffe097          	auipc	ra,0xffffe
    80003ac8:	a00080e7          	jalr	-1536(ra) # 800014c4 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80003acc:	00000493          	li	s1,0
    80003ad0:	00994e63          	blt	s2,s1,80003aec <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80003ad4:	00008517          	auipc	a0,0x8
    80003ad8:	ecc53503          	ld	a0,-308(a0) # 8000b9a0 <_ZL10waitForAll>
    80003adc:	ffffe097          	auipc	ra,0xffffe
    80003ae0:	ab0080e7          	jalr	-1360(ra) # 8000158c <_Z8sem_waitP4_sem>
    for (int i = 0; i <= threadNum; i++) {
    80003ae4:	0014849b          	addiw	s1,s1,1
    80003ae8:	fe9ff06f          	j	80003ad0 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003aec:	00008517          	auipc	a0,0x8
    80003af0:	eb453503          	ld	a0,-332(a0) # 8000b9a0 <_ZL10waitForAll>
    80003af4:	ffffe097          	auipc	ra,0xffffe
    80003af8:	a60080e7          	jalr	-1440(ra) # 80001554 <_Z9sem_closeP4_sem>
    delete buffer;
    80003afc:	000a0e63          	beqz	s4,80003b18 <_Z22producerConsumer_C_APIv+0x284>
    80003b00:	000a0513          	mv	a0,s4
    80003b04:	00003097          	auipc	ra,0x3
    80003b08:	154080e7          	jalr	340(ra) # 80006c58 <_ZN6BufferD1Ev>
    80003b0c:	000a0513          	mv	a0,s4
    80003b10:	fffff097          	auipc	ra,0xfffff
    80003b14:	948080e7          	jalr	-1720(ra) # 80002458 <_ZdlPv>
    80003b18:	000b0113          	mv	sp,s6

}
    80003b1c:	f9040113          	addi	sp,s0,-112
    80003b20:	06813083          	ld	ra,104(sp)
    80003b24:	06013403          	ld	s0,96(sp)
    80003b28:	05813483          	ld	s1,88(sp)
    80003b2c:	05013903          	ld	s2,80(sp)
    80003b30:	04813983          	ld	s3,72(sp)
    80003b34:	04013a03          	ld	s4,64(sp)
    80003b38:	03813a83          	ld	s5,56(sp)
    80003b3c:	03013b03          	ld	s6,48(sp)
    80003b40:	07010113          	addi	sp,sp,112
    80003b44:	00008067          	ret
    80003b48:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003b4c:	000a0513          	mv	a0,s4
    80003b50:	fffff097          	auipc	ra,0xfffff
    80003b54:	908080e7          	jalr	-1784(ra) # 80002458 <_ZdlPv>
    80003b58:	00048513          	mv	a0,s1
    80003b5c:	00009097          	auipc	ra,0x9
    80003b60:	f5c080e7          	jalr	-164(ra) # 8000cab8 <_Unwind_Resume>

0000000080003b64 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003b64:	fe010113          	addi	sp,sp,-32
    80003b68:	00113c23          	sd	ra,24(sp)
    80003b6c:	00813823          	sd	s0,16(sp)
    80003b70:	00913423          	sd	s1,8(sp)
    80003b74:	01213023          	sd	s2,0(sp)
    80003b78:	02010413          	addi	s0,sp,32
    80003b7c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003b80:	00100793          	li	a5,1
    80003b84:	02a7f863          	bgeu	a5,a0,80003bb4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80003b88:	00a00793          	li	a5,10
    80003b8c:	02f577b3          	remu	a5,a0,a5
    80003b90:	02078e63          	beqz	a5,80003bcc <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003b94:	fff48513          	addi	a0,s1,-1
    80003b98:	00000097          	auipc	ra,0x0
    80003b9c:	fcc080e7          	jalr	-52(ra) # 80003b64 <_ZL9fibonaccim>
    80003ba0:	00050913          	mv	s2,a0
    80003ba4:	ffe48513          	addi	a0,s1,-2
    80003ba8:	00000097          	auipc	ra,0x0
    80003bac:	fbc080e7          	jalr	-68(ra) # 80003b64 <_ZL9fibonaccim>
    80003bb0:	00a90533          	add	a0,s2,a0
}
    80003bb4:	01813083          	ld	ra,24(sp)
    80003bb8:	01013403          	ld	s0,16(sp)
    80003bbc:	00813483          	ld	s1,8(sp)
    80003bc0:	00013903          	ld	s2,0(sp)
    80003bc4:	02010113          	addi	sp,sp,32
    80003bc8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003bcc:	ffffe097          	auipc	ra,0xffffe
    80003bd0:	8f8080e7          	jalr	-1800(ra) # 800014c4 <_Z15thread_dispatchv>
    80003bd4:	fc1ff06f          	j	80003b94 <_ZL9fibonaccim+0x30>

0000000080003bd8 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    80003bd8:	fe010113          	addi	sp,sp,-32
    80003bdc:	00113c23          	sd	ra,24(sp)
    80003be0:	00813823          	sd	s0,16(sp)
    80003be4:	00913423          	sd	s1,8(sp)
    80003be8:	01213023          	sd	s2,0(sp)
    80003bec:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003bf0:	00000913          	li	s2,0
    80003bf4:	0380006f          	j	80003c2c <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003bf8:	ffffe097          	auipc	ra,0xffffe
    80003bfc:	8cc080e7          	jalr	-1844(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003c00:	00148493          	addi	s1,s1,1
    80003c04:	000027b7          	lui	a5,0x2
    80003c08:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003c0c:	0097ee63          	bltu	a5,s1,80003c28 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003c10:	00000713          	li	a4,0
    80003c14:	000077b7          	lui	a5,0x7
    80003c18:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003c1c:	fce7eee3          	bltu	a5,a4,80003bf8 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003c20:	00170713          	addi	a4,a4,1
    80003c24:	ff1ff06f          	j	80003c14 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003c28:	00190913          	addi	s2,s2,1
    80003c2c:	00900793          	li	a5,9
    80003c30:	0527e063          	bltu	a5,s2,80003c70 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80003c34:	00005517          	auipc	a0,0x5
    80003c38:	5ec50513          	addi	a0,a0,1516 # 80009220 <_ZZ18kernelPrintIntegermE6digits+0x200>
    80003c3c:	00002097          	auipc	ra,0x2
    80003c40:	eac080e7          	jalr	-340(ra) # 80005ae8 <_Z11printStringPKc>
    80003c44:	00000613          	li	a2,0
    80003c48:	00a00593          	li	a1,10
    80003c4c:	0009051b          	sext.w	a0,s2
    80003c50:	00002097          	auipc	ra,0x2
    80003c54:	048080e7          	jalr	72(ra) # 80005c98 <_Z8printIntiii>
    80003c58:	00006517          	auipc	a0,0x6
    80003c5c:	81850513          	addi	a0,a0,-2024 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80003c60:	00002097          	auipc	ra,0x2
    80003c64:	e88080e7          	jalr	-376(ra) # 80005ae8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003c68:	00000493          	li	s1,0
    80003c6c:	f99ff06f          	j	80003c04 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003c70:	00005517          	auipc	a0,0x5
    80003c74:	5b850513          	addi	a0,a0,1464 # 80009228 <_ZZ18kernelPrintIntegermE6digits+0x208>
    80003c78:	00002097          	auipc	ra,0x2
    80003c7c:	e70080e7          	jalr	-400(ra) # 80005ae8 <_Z11printStringPKc>
    finishedA = true;
    80003c80:	00100793          	li	a5,1
    80003c84:	00008717          	auipc	a4,0x8
    80003c88:	d2f70223          	sb	a5,-732(a4) # 8000b9a8 <_ZL9finishedA>
}
    80003c8c:	01813083          	ld	ra,24(sp)
    80003c90:	01013403          	ld	s0,16(sp)
    80003c94:	00813483          	ld	s1,8(sp)
    80003c98:	00013903          	ld	s2,0(sp)
    80003c9c:	02010113          	addi	sp,sp,32
    80003ca0:	00008067          	ret

0000000080003ca4 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003ca4:	fe010113          	addi	sp,sp,-32
    80003ca8:	00113c23          	sd	ra,24(sp)
    80003cac:	00813823          	sd	s0,16(sp)
    80003cb0:	00913423          	sd	s1,8(sp)
    80003cb4:	01213023          	sd	s2,0(sp)
    80003cb8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003cbc:	00000913          	li	s2,0
    80003cc0:	0380006f          	j	80003cf8 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003cc4:	ffffe097          	auipc	ra,0xffffe
    80003cc8:	800080e7          	jalr	-2048(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003ccc:	00148493          	addi	s1,s1,1
    80003cd0:	000027b7          	lui	a5,0x2
    80003cd4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003cd8:	0097ee63          	bltu	a5,s1,80003cf4 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003cdc:	00000713          	li	a4,0
    80003ce0:	000077b7          	lui	a5,0x7
    80003ce4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003ce8:	fce7eee3          	bltu	a5,a4,80003cc4 <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003cec:	00170713          	addi	a4,a4,1
    80003cf0:	ff1ff06f          	j	80003ce0 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80003cf4:	00190913          	addi	s2,s2,1
    80003cf8:	00f00793          	li	a5,15
    80003cfc:	0527e063          	bltu	a5,s2,80003d3c <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003d00:	00005517          	auipc	a0,0x5
    80003d04:	53850513          	addi	a0,a0,1336 # 80009238 <_ZZ18kernelPrintIntegermE6digits+0x218>
    80003d08:	00002097          	auipc	ra,0x2
    80003d0c:	de0080e7          	jalr	-544(ra) # 80005ae8 <_Z11printStringPKc>
    80003d10:	00000613          	li	a2,0
    80003d14:	00a00593          	li	a1,10
    80003d18:	0009051b          	sext.w	a0,s2
    80003d1c:	00002097          	auipc	ra,0x2
    80003d20:	f7c080e7          	jalr	-132(ra) # 80005c98 <_Z8printIntiii>
    80003d24:	00005517          	auipc	a0,0x5
    80003d28:	74c50513          	addi	a0,a0,1868 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80003d2c:	00002097          	auipc	ra,0x2
    80003d30:	dbc080e7          	jalr	-580(ra) # 80005ae8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003d34:	00000493          	li	s1,0
    80003d38:	f99ff06f          	j	80003cd0 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003d3c:	00005517          	auipc	a0,0x5
    80003d40:	50450513          	addi	a0,a0,1284 # 80009240 <_ZZ18kernelPrintIntegermE6digits+0x220>
    80003d44:	00002097          	auipc	ra,0x2
    80003d48:	da4080e7          	jalr	-604(ra) # 80005ae8 <_Z11printStringPKc>
    finishedB = true;
    80003d4c:	00100793          	li	a5,1
    80003d50:	00008717          	auipc	a4,0x8
    80003d54:	c4f70ca3          	sb	a5,-935(a4) # 8000b9a9 <_ZL9finishedB>
    thread_dispatch();
    80003d58:	ffffd097          	auipc	ra,0xffffd
    80003d5c:	76c080e7          	jalr	1900(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80003d60:	01813083          	ld	ra,24(sp)
    80003d64:	01013403          	ld	s0,16(sp)
    80003d68:	00813483          	ld	s1,8(sp)
    80003d6c:	00013903          	ld	s2,0(sp)
    80003d70:	02010113          	addi	sp,sp,32
    80003d74:	00008067          	ret

0000000080003d78 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003d78:	fe010113          	addi	sp,sp,-32
    80003d7c:	00113c23          	sd	ra,24(sp)
    80003d80:	00813823          	sd	s0,16(sp)
    80003d84:	00913423          	sd	s1,8(sp)
    80003d88:	01213023          	sd	s2,0(sp)
    80003d8c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003d90:	00000493          	li	s1,0
    80003d94:	0400006f          	j	80003dd4 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003d98:	00005517          	auipc	a0,0x5
    80003d9c:	4b850513          	addi	a0,a0,1208 # 80009250 <_ZZ18kernelPrintIntegermE6digits+0x230>
    80003da0:	00002097          	auipc	ra,0x2
    80003da4:	d48080e7          	jalr	-696(ra) # 80005ae8 <_Z11printStringPKc>
    80003da8:	00000613          	li	a2,0
    80003dac:	00a00593          	li	a1,10
    80003db0:	00048513          	mv	a0,s1
    80003db4:	00002097          	auipc	ra,0x2
    80003db8:	ee4080e7          	jalr	-284(ra) # 80005c98 <_Z8printIntiii>
    80003dbc:	00005517          	auipc	a0,0x5
    80003dc0:	6b450513          	addi	a0,a0,1716 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80003dc4:	00002097          	auipc	ra,0x2
    80003dc8:	d24080e7          	jalr	-732(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003dcc:	0014849b          	addiw	s1,s1,1
    80003dd0:	0ff4f493          	andi	s1,s1,255
    80003dd4:	00200793          	li	a5,2
    80003dd8:	fc97f0e3          	bgeu	a5,s1,80003d98 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003ddc:	00005517          	auipc	a0,0x5
    80003de0:	47c50513          	addi	a0,a0,1148 # 80009258 <_ZZ18kernelPrintIntegermE6digits+0x238>
    80003de4:	00002097          	auipc	ra,0x2
    80003de8:	d04080e7          	jalr	-764(ra) # 80005ae8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003dec:	00700313          	li	t1,7
    thread_dispatch();
    80003df0:	ffffd097          	auipc	ra,0xffffd
    80003df4:	6d4080e7          	jalr	1748(ra) # 800014c4 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003df8:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003dfc:	00005517          	auipc	a0,0x5
    80003e00:	46c50513          	addi	a0,a0,1132 # 80009268 <_ZZ18kernelPrintIntegermE6digits+0x248>
    80003e04:	00002097          	auipc	ra,0x2
    80003e08:	ce4080e7          	jalr	-796(ra) # 80005ae8 <_Z11printStringPKc>
    80003e0c:	00000613          	li	a2,0
    80003e10:	00a00593          	li	a1,10
    80003e14:	0009051b          	sext.w	a0,s2
    80003e18:	00002097          	auipc	ra,0x2
    80003e1c:	e80080e7          	jalr	-384(ra) # 80005c98 <_Z8printIntiii>
    80003e20:	00005517          	auipc	a0,0x5
    80003e24:	65050513          	addi	a0,a0,1616 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80003e28:	00002097          	auipc	ra,0x2
    80003e2c:	cc0080e7          	jalr	-832(ra) # 80005ae8 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003e30:	00c00513          	li	a0,12
    80003e34:	00000097          	auipc	ra,0x0
    80003e38:	d30080e7          	jalr	-720(ra) # 80003b64 <_ZL9fibonaccim>
    80003e3c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003e40:	00005517          	auipc	a0,0x5
    80003e44:	43050513          	addi	a0,a0,1072 # 80009270 <_ZZ18kernelPrintIntegermE6digits+0x250>
    80003e48:	00002097          	auipc	ra,0x2
    80003e4c:	ca0080e7          	jalr	-864(ra) # 80005ae8 <_Z11printStringPKc>
    80003e50:	00000613          	li	a2,0
    80003e54:	00a00593          	li	a1,10
    80003e58:	0009051b          	sext.w	a0,s2
    80003e5c:	00002097          	auipc	ra,0x2
    80003e60:	e3c080e7          	jalr	-452(ra) # 80005c98 <_Z8printIntiii>
    80003e64:	00005517          	auipc	a0,0x5
    80003e68:	60c50513          	addi	a0,a0,1548 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80003e6c:	00002097          	auipc	ra,0x2
    80003e70:	c7c080e7          	jalr	-900(ra) # 80005ae8 <_Z11printStringPKc>
    80003e74:	0400006f          	j	80003eb4 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003e78:	00005517          	auipc	a0,0x5
    80003e7c:	3d850513          	addi	a0,a0,984 # 80009250 <_ZZ18kernelPrintIntegermE6digits+0x230>
    80003e80:	00002097          	auipc	ra,0x2
    80003e84:	c68080e7          	jalr	-920(ra) # 80005ae8 <_Z11printStringPKc>
    80003e88:	00000613          	li	a2,0
    80003e8c:	00a00593          	li	a1,10
    80003e90:	00048513          	mv	a0,s1
    80003e94:	00002097          	auipc	ra,0x2
    80003e98:	e04080e7          	jalr	-508(ra) # 80005c98 <_Z8printIntiii>
    80003e9c:	00005517          	auipc	a0,0x5
    80003ea0:	5d450513          	addi	a0,a0,1492 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80003ea4:	00002097          	auipc	ra,0x2
    80003ea8:	c44080e7          	jalr	-956(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003eac:	0014849b          	addiw	s1,s1,1
    80003eb0:	0ff4f493          	andi	s1,s1,255
    80003eb4:	00500793          	li	a5,5
    80003eb8:	fc97f0e3          	bgeu	a5,s1,80003e78 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003ebc:	00005517          	auipc	a0,0x5
    80003ec0:	36c50513          	addi	a0,a0,876 # 80009228 <_ZZ18kernelPrintIntegermE6digits+0x208>
    80003ec4:	00002097          	auipc	ra,0x2
    80003ec8:	c24080e7          	jalr	-988(ra) # 80005ae8 <_Z11printStringPKc>
    finishedC = true;
    80003ecc:	00100793          	li	a5,1
    80003ed0:	00008717          	auipc	a4,0x8
    80003ed4:	acf70d23          	sb	a5,-1318(a4) # 8000b9aa <_ZL9finishedC>
    thread_dispatch();
    80003ed8:	ffffd097          	auipc	ra,0xffffd
    80003edc:	5ec080e7          	jalr	1516(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80003ee0:	01813083          	ld	ra,24(sp)
    80003ee4:	01013403          	ld	s0,16(sp)
    80003ee8:	00813483          	ld	s1,8(sp)
    80003eec:	00013903          	ld	s2,0(sp)
    80003ef0:	02010113          	addi	sp,sp,32
    80003ef4:	00008067          	ret

0000000080003ef8 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003ef8:	fe010113          	addi	sp,sp,-32
    80003efc:	00113c23          	sd	ra,24(sp)
    80003f00:	00813823          	sd	s0,16(sp)
    80003f04:	00913423          	sd	s1,8(sp)
    80003f08:	01213023          	sd	s2,0(sp)
    80003f0c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003f10:	00a00493          	li	s1,10
    80003f14:	0400006f          	j	80003f54 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003f18:	00005517          	auipc	a0,0x5
    80003f1c:	36850513          	addi	a0,a0,872 # 80009280 <_ZZ18kernelPrintIntegermE6digits+0x260>
    80003f20:	00002097          	auipc	ra,0x2
    80003f24:	bc8080e7          	jalr	-1080(ra) # 80005ae8 <_Z11printStringPKc>
    80003f28:	00000613          	li	a2,0
    80003f2c:	00a00593          	li	a1,10
    80003f30:	00048513          	mv	a0,s1
    80003f34:	00002097          	auipc	ra,0x2
    80003f38:	d64080e7          	jalr	-668(ra) # 80005c98 <_Z8printIntiii>
    80003f3c:	00005517          	auipc	a0,0x5
    80003f40:	53450513          	addi	a0,a0,1332 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80003f44:	00002097          	auipc	ra,0x2
    80003f48:	ba4080e7          	jalr	-1116(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003f4c:	0014849b          	addiw	s1,s1,1
    80003f50:	0ff4f493          	andi	s1,s1,255
    80003f54:	00c00793          	li	a5,12
    80003f58:	fc97f0e3          	bgeu	a5,s1,80003f18 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003f5c:	00005517          	auipc	a0,0x5
    80003f60:	32c50513          	addi	a0,a0,812 # 80009288 <_ZZ18kernelPrintIntegermE6digits+0x268>
    80003f64:	00002097          	auipc	ra,0x2
    80003f68:	b84080e7          	jalr	-1148(ra) # 80005ae8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003f6c:	00500313          	li	t1,5
    thread_dispatch();
    80003f70:	ffffd097          	auipc	ra,0xffffd
    80003f74:	554080e7          	jalr	1364(ra) # 800014c4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003f78:	01000513          	li	a0,16
    80003f7c:	00000097          	auipc	ra,0x0
    80003f80:	be8080e7          	jalr	-1048(ra) # 80003b64 <_ZL9fibonaccim>
    80003f84:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80003f88:	00005517          	auipc	a0,0x5
    80003f8c:	31050513          	addi	a0,a0,784 # 80009298 <_ZZ18kernelPrintIntegermE6digits+0x278>
    80003f90:	00002097          	auipc	ra,0x2
    80003f94:	b58080e7          	jalr	-1192(ra) # 80005ae8 <_Z11printStringPKc>
    80003f98:	00000613          	li	a2,0
    80003f9c:	00a00593          	li	a1,10
    80003fa0:	0009051b          	sext.w	a0,s2
    80003fa4:	00002097          	auipc	ra,0x2
    80003fa8:	cf4080e7          	jalr	-780(ra) # 80005c98 <_Z8printIntiii>
    80003fac:	00005517          	auipc	a0,0x5
    80003fb0:	4c450513          	addi	a0,a0,1220 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80003fb4:	00002097          	auipc	ra,0x2
    80003fb8:	b34080e7          	jalr	-1228(ra) # 80005ae8 <_Z11printStringPKc>
    80003fbc:	0400006f          	j	80003ffc <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003fc0:	00005517          	auipc	a0,0x5
    80003fc4:	2c050513          	addi	a0,a0,704 # 80009280 <_ZZ18kernelPrintIntegermE6digits+0x260>
    80003fc8:	00002097          	auipc	ra,0x2
    80003fcc:	b20080e7          	jalr	-1248(ra) # 80005ae8 <_Z11printStringPKc>
    80003fd0:	00000613          	li	a2,0
    80003fd4:	00a00593          	li	a1,10
    80003fd8:	00048513          	mv	a0,s1
    80003fdc:	00002097          	auipc	ra,0x2
    80003fe0:	cbc080e7          	jalr	-836(ra) # 80005c98 <_Z8printIntiii>
    80003fe4:	00005517          	auipc	a0,0x5
    80003fe8:	48c50513          	addi	a0,a0,1164 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80003fec:	00002097          	auipc	ra,0x2
    80003ff0:	afc080e7          	jalr	-1284(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80003ff4:	0014849b          	addiw	s1,s1,1
    80003ff8:	0ff4f493          	andi	s1,s1,255
    80003ffc:	00f00793          	li	a5,15
    80004000:	fc97f0e3          	bgeu	a5,s1,80003fc0 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    80004004:	00005517          	auipc	a0,0x5
    80004008:	2a450513          	addi	a0,a0,676 # 800092a8 <_ZZ18kernelPrintIntegermE6digits+0x288>
    8000400c:	00002097          	auipc	ra,0x2
    80004010:	adc080e7          	jalr	-1316(ra) # 80005ae8 <_Z11printStringPKc>
    finishedD = true;
    80004014:	00100793          	li	a5,1
    80004018:	00008717          	auipc	a4,0x8
    8000401c:	98f709a3          	sb	a5,-1645(a4) # 8000b9ab <_ZL9finishedD>
    thread_dispatch();
    80004020:	ffffd097          	auipc	ra,0xffffd
    80004024:	4a4080e7          	jalr	1188(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80004028:	01813083          	ld	ra,24(sp)
    8000402c:	01013403          	ld	s0,16(sp)
    80004030:	00813483          	ld	s1,8(sp)
    80004034:	00013903          	ld	s2,0(sp)
    80004038:	02010113          	addi	sp,sp,32
    8000403c:	00008067          	ret

0000000080004040 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80004040:	fc010113          	addi	sp,sp,-64
    80004044:	02113c23          	sd	ra,56(sp)
    80004048:	02813823          	sd	s0,48(sp)
    8000404c:	02913423          	sd	s1,40(sp)
    80004050:	03213023          	sd	s2,32(sp)
    80004054:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80004058:	02000513          	li	a0,32
    8000405c:	ffffe097          	auipc	ra,0xffffe
    80004060:	3ac080e7          	jalr	940(ra) # 80002408 <_Znwm>
    80004064:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80004068:	ffffe097          	auipc	ra,0xffffe
    8000406c:	62c080e7          	jalr	1580(ra) # 80002694 <_ZN6ThreadC1Ev>
    80004070:	00007797          	auipc	a5,0x7
    80004074:	6a078793          	addi	a5,a5,1696 # 8000b710 <_ZTV7WorkerA+0x10>
    80004078:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    8000407c:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80004080:	00005517          	auipc	a0,0x5
    80004084:	23850513          	addi	a0,a0,568 # 800092b8 <_ZZ18kernelPrintIntegermE6digits+0x298>
    80004088:	00002097          	auipc	ra,0x2
    8000408c:	a60080e7          	jalr	-1440(ra) # 80005ae8 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80004090:	02000513          	li	a0,32
    80004094:	ffffe097          	auipc	ra,0xffffe
    80004098:	374080e7          	jalr	884(ra) # 80002408 <_Znwm>
    8000409c:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800040a0:	ffffe097          	auipc	ra,0xffffe
    800040a4:	5f4080e7          	jalr	1524(ra) # 80002694 <_ZN6ThreadC1Ev>
    800040a8:	00007797          	auipc	a5,0x7
    800040ac:	69078793          	addi	a5,a5,1680 # 8000b738 <_ZTV7WorkerB+0x10>
    800040b0:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800040b4:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800040b8:	00005517          	auipc	a0,0x5
    800040bc:	21850513          	addi	a0,a0,536 # 800092d0 <_ZZ18kernelPrintIntegermE6digits+0x2b0>
    800040c0:	00002097          	auipc	ra,0x2
    800040c4:	a28080e7          	jalr	-1496(ra) # 80005ae8 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800040c8:	02000513          	li	a0,32
    800040cc:	ffffe097          	auipc	ra,0xffffe
    800040d0:	33c080e7          	jalr	828(ra) # 80002408 <_Znwm>
    800040d4:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800040d8:	ffffe097          	auipc	ra,0xffffe
    800040dc:	5bc080e7          	jalr	1468(ra) # 80002694 <_ZN6ThreadC1Ev>
    800040e0:	00007797          	auipc	a5,0x7
    800040e4:	68078793          	addi	a5,a5,1664 # 8000b760 <_ZTV7WorkerC+0x10>
    800040e8:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800040ec:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800040f0:	00005517          	auipc	a0,0x5
    800040f4:	1f850513          	addi	a0,a0,504 # 800092e8 <_ZZ18kernelPrintIntegermE6digits+0x2c8>
    800040f8:	00002097          	auipc	ra,0x2
    800040fc:	9f0080e7          	jalr	-1552(ra) # 80005ae8 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80004100:	02000513          	li	a0,32
    80004104:	ffffe097          	auipc	ra,0xffffe
    80004108:	304080e7          	jalr	772(ra) # 80002408 <_Znwm>
    8000410c:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80004110:	ffffe097          	auipc	ra,0xffffe
    80004114:	584080e7          	jalr	1412(ra) # 80002694 <_ZN6ThreadC1Ev>
    80004118:	00007797          	auipc	a5,0x7
    8000411c:	67078793          	addi	a5,a5,1648 # 8000b788 <_ZTV7WorkerD+0x10>
    80004120:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80004124:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80004128:	00005517          	auipc	a0,0x5
    8000412c:	1d850513          	addi	a0,a0,472 # 80009300 <_ZZ18kernelPrintIntegermE6digits+0x2e0>
    80004130:	00002097          	auipc	ra,0x2
    80004134:	9b8080e7          	jalr	-1608(ra) # 80005ae8 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80004138:	00000493          	li	s1,0
    8000413c:	00300793          	li	a5,3
    80004140:	0297c663          	blt	a5,s1,8000416c <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80004144:	00349793          	slli	a5,s1,0x3
    80004148:	fe040713          	addi	a4,s0,-32
    8000414c:	00f707b3          	add	a5,a4,a5
    80004150:	fe07b503          	ld	a0,-32(a5)
    80004154:	ffffe097          	auipc	ra,0xffffe
    80004158:	578080e7          	jalr	1400(ra) # 800026cc <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    8000415c:	0014849b          	addiw	s1,s1,1
    80004160:	fddff06f          	j	8000413c <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80004164:	ffffe097          	auipc	ra,0xffffe
    80004168:	5c8080e7          	jalr	1480(ra) # 8000272c <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000416c:	00008797          	auipc	a5,0x8
    80004170:	83c7c783          	lbu	a5,-1988(a5) # 8000b9a8 <_ZL9finishedA>
    80004174:	fe0788e3          	beqz	a5,80004164 <_Z20Threads_CPP_API_testv+0x124>
    80004178:	00008797          	auipc	a5,0x8
    8000417c:	8317c783          	lbu	a5,-1999(a5) # 8000b9a9 <_ZL9finishedB>
    80004180:	fe0782e3          	beqz	a5,80004164 <_Z20Threads_CPP_API_testv+0x124>
    80004184:	00008797          	auipc	a5,0x8
    80004188:	8267c783          	lbu	a5,-2010(a5) # 8000b9aa <_ZL9finishedC>
    8000418c:	fc078ce3          	beqz	a5,80004164 <_Z20Threads_CPP_API_testv+0x124>
    80004190:	00008797          	auipc	a5,0x8
    80004194:	81b7c783          	lbu	a5,-2021(a5) # 8000b9ab <_ZL9finishedD>
    80004198:	fc0786e3          	beqz	a5,80004164 <_Z20Threads_CPP_API_testv+0x124>
    8000419c:	fc040493          	addi	s1,s0,-64
    800041a0:	0080006f          	j	800041a8 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    800041a4:	00848493          	addi	s1,s1,8
    800041a8:	fe040793          	addi	a5,s0,-32
    800041ac:	08f48663          	beq	s1,a5,80004238 <_Z20Threads_CPP_API_testv+0x1f8>
    800041b0:	0004b503          	ld	a0,0(s1)
    800041b4:	fe0508e3          	beqz	a0,800041a4 <_Z20Threads_CPP_API_testv+0x164>
    800041b8:	00053783          	ld	a5,0(a0)
    800041bc:	0087b783          	ld	a5,8(a5)
    800041c0:	000780e7          	jalr	a5
    800041c4:	fe1ff06f          	j	800041a4 <_Z20Threads_CPP_API_testv+0x164>
    800041c8:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    800041cc:	00048513          	mv	a0,s1
    800041d0:	ffffe097          	auipc	ra,0xffffe
    800041d4:	288080e7          	jalr	648(ra) # 80002458 <_ZdlPv>
    800041d8:	00090513          	mv	a0,s2
    800041dc:	00009097          	auipc	ra,0x9
    800041e0:	8dc080e7          	jalr	-1828(ra) # 8000cab8 <_Unwind_Resume>
    800041e4:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    800041e8:	00048513          	mv	a0,s1
    800041ec:	ffffe097          	auipc	ra,0xffffe
    800041f0:	26c080e7          	jalr	620(ra) # 80002458 <_ZdlPv>
    800041f4:	00090513          	mv	a0,s2
    800041f8:	00009097          	auipc	ra,0x9
    800041fc:	8c0080e7          	jalr	-1856(ra) # 8000cab8 <_Unwind_Resume>
    80004200:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80004204:	00048513          	mv	a0,s1
    80004208:	ffffe097          	auipc	ra,0xffffe
    8000420c:	250080e7          	jalr	592(ra) # 80002458 <_ZdlPv>
    80004210:	00090513          	mv	a0,s2
    80004214:	00009097          	auipc	ra,0x9
    80004218:	8a4080e7          	jalr	-1884(ra) # 8000cab8 <_Unwind_Resume>
    8000421c:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80004220:	00048513          	mv	a0,s1
    80004224:	ffffe097          	auipc	ra,0xffffe
    80004228:	234080e7          	jalr	564(ra) # 80002458 <_ZdlPv>
    8000422c:	00090513          	mv	a0,s2
    80004230:	00009097          	auipc	ra,0x9
    80004234:	888080e7          	jalr	-1912(ra) # 8000cab8 <_Unwind_Resume>
}
    80004238:	03813083          	ld	ra,56(sp)
    8000423c:	03013403          	ld	s0,48(sp)
    80004240:	02813483          	ld	s1,40(sp)
    80004244:	02013903          	ld	s2,32(sp)
    80004248:	04010113          	addi	sp,sp,64
    8000424c:	00008067          	ret

0000000080004250 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80004250:	ff010113          	addi	sp,sp,-16
    80004254:	00113423          	sd	ra,8(sp)
    80004258:	00813023          	sd	s0,0(sp)
    8000425c:	01010413          	addi	s0,sp,16
    80004260:	00007797          	auipc	a5,0x7
    80004264:	4b078793          	addi	a5,a5,1200 # 8000b710 <_ZTV7WorkerA+0x10>
    80004268:	00f53023          	sd	a5,0(a0)
    8000426c:	ffffe097          	auipc	ra,0xffffe
    80004270:	2bc080e7          	jalr	700(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004274:	00813083          	ld	ra,8(sp)
    80004278:	00013403          	ld	s0,0(sp)
    8000427c:	01010113          	addi	sp,sp,16
    80004280:	00008067          	ret

0000000080004284 <_ZN7WorkerAD0Ev>:
    80004284:	fe010113          	addi	sp,sp,-32
    80004288:	00113c23          	sd	ra,24(sp)
    8000428c:	00813823          	sd	s0,16(sp)
    80004290:	00913423          	sd	s1,8(sp)
    80004294:	02010413          	addi	s0,sp,32
    80004298:	00050493          	mv	s1,a0
    8000429c:	00007797          	auipc	a5,0x7
    800042a0:	47478793          	addi	a5,a5,1140 # 8000b710 <_ZTV7WorkerA+0x10>
    800042a4:	00f53023          	sd	a5,0(a0)
    800042a8:	ffffe097          	auipc	ra,0xffffe
    800042ac:	280080e7          	jalr	640(ra) # 80002528 <_ZN6ThreadD1Ev>
    800042b0:	00048513          	mv	a0,s1
    800042b4:	ffffe097          	auipc	ra,0xffffe
    800042b8:	1a4080e7          	jalr	420(ra) # 80002458 <_ZdlPv>
    800042bc:	01813083          	ld	ra,24(sp)
    800042c0:	01013403          	ld	s0,16(sp)
    800042c4:	00813483          	ld	s1,8(sp)
    800042c8:	02010113          	addi	sp,sp,32
    800042cc:	00008067          	ret

00000000800042d0 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    800042d0:	ff010113          	addi	sp,sp,-16
    800042d4:	00113423          	sd	ra,8(sp)
    800042d8:	00813023          	sd	s0,0(sp)
    800042dc:	01010413          	addi	s0,sp,16
    800042e0:	00007797          	auipc	a5,0x7
    800042e4:	45878793          	addi	a5,a5,1112 # 8000b738 <_ZTV7WorkerB+0x10>
    800042e8:	00f53023          	sd	a5,0(a0)
    800042ec:	ffffe097          	auipc	ra,0xffffe
    800042f0:	23c080e7          	jalr	572(ra) # 80002528 <_ZN6ThreadD1Ev>
    800042f4:	00813083          	ld	ra,8(sp)
    800042f8:	00013403          	ld	s0,0(sp)
    800042fc:	01010113          	addi	sp,sp,16
    80004300:	00008067          	ret

0000000080004304 <_ZN7WorkerBD0Ev>:
    80004304:	fe010113          	addi	sp,sp,-32
    80004308:	00113c23          	sd	ra,24(sp)
    8000430c:	00813823          	sd	s0,16(sp)
    80004310:	00913423          	sd	s1,8(sp)
    80004314:	02010413          	addi	s0,sp,32
    80004318:	00050493          	mv	s1,a0
    8000431c:	00007797          	auipc	a5,0x7
    80004320:	41c78793          	addi	a5,a5,1052 # 8000b738 <_ZTV7WorkerB+0x10>
    80004324:	00f53023          	sd	a5,0(a0)
    80004328:	ffffe097          	auipc	ra,0xffffe
    8000432c:	200080e7          	jalr	512(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004330:	00048513          	mv	a0,s1
    80004334:	ffffe097          	auipc	ra,0xffffe
    80004338:	124080e7          	jalr	292(ra) # 80002458 <_ZdlPv>
    8000433c:	01813083          	ld	ra,24(sp)
    80004340:	01013403          	ld	s0,16(sp)
    80004344:	00813483          	ld	s1,8(sp)
    80004348:	02010113          	addi	sp,sp,32
    8000434c:	00008067          	ret

0000000080004350 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80004350:	ff010113          	addi	sp,sp,-16
    80004354:	00113423          	sd	ra,8(sp)
    80004358:	00813023          	sd	s0,0(sp)
    8000435c:	01010413          	addi	s0,sp,16
    80004360:	00007797          	auipc	a5,0x7
    80004364:	40078793          	addi	a5,a5,1024 # 8000b760 <_ZTV7WorkerC+0x10>
    80004368:	00f53023          	sd	a5,0(a0)
    8000436c:	ffffe097          	auipc	ra,0xffffe
    80004370:	1bc080e7          	jalr	444(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004374:	00813083          	ld	ra,8(sp)
    80004378:	00013403          	ld	s0,0(sp)
    8000437c:	01010113          	addi	sp,sp,16
    80004380:	00008067          	ret

0000000080004384 <_ZN7WorkerCD0Ev>:
    80004384:	fe010113          	addi	sp,sp,-32
    80004388:	00113c23          	sd	ra,24(sp)
    8000438c:	00813823          	sd	s0,16(sp)
    80004390:	00913423          	sd	s1,8(sp)
    80004394:	02010413          	addi	s0,sp,32
    80004398:	00050493          	mv	s1,a0
    8000439c:	00007797          	auipc	a5,0x7
    800043a0:	3c478793          	addi	a5,a5,964 # 8000b760 <_ZTV7WorkerC+0x10>
    800043a4:	00f53023          	sd	a5,0(a0)
    800043a8:	ffffe097          	auipc	ra,0xffffe
    800043ac:	180080e7          	jalr	384(ra) # 80002528 <_ZN6ThreadD1Ev>
    800043b0:	00048513          	mv	a0,s1
    800043b4:	ffffe097          	auipc	ra,0xffffe
    800043b8:	0a4080e7          	jalr	164(ra) # 80002458 <_ZdlPv>
    800043bc:	01813083          	ld	ra,24(sp)
    800043c0:	01013403          	ld	s0,16(sp)
    800043c4:	00813483          	ld	s1,8(sp)
    800043c8:	02010113          	addi	sp,sp,32
    800043cc:	00008067          	ret

00000000800043d0 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    800043d0:	ff010113          	addi	sp,sp,-16
    800043d4:	00113423          	sd	ra,8(sp)
    800043d8:	00813023          	sd	s0,0(sp)
    800043dc:	01010413          	addi	s0,sp,16
    800043e0:	00007797          	auipc	a5,0x7
    800043e4:	3a878793          	addi	a5,a5,936 # 8000b788 <_ZTV7WorkerD+0x10>
    800043e8:	00f53023          	sd	a5,0(a0)
    800043ec:	ffffe097          	auipc	ra,0xffffe
    800043f0:	13c080e7          	jalr	316(ra) # 80002528 <_ZN6ThreadD1Ev>
    800043f4:	00813083          	ld	ra,8(sp)
    800043f8:	00013403          	ld	s0,0(sp)
    800043fc:	01010113          	addi	sp,sp,16
    80004400:	00008067          	ret

0000000080004404 <_ZN7WorkerDD0Ev>:
    80004404:	fe010113          	addi	sp,sp,-32
    80004408:	00113c23          	sd	ra,24(sp)
    8000440c:	00813823          	sd	s0,16(sp)
    80004410:	00913423          	sd	s1,8(sp)
    80004414:	02010413          	addi	s0,sp,32
    80004418:	00050493          	mv	s1,a0
    8000441c:	00007797          	auipc	a5,0x7
    80004420:	36c78793          	addi	a5,a5,876 # 8000b788 <_ZTV7WorkerD+0x10>
    80004424:	00f53023          	sd	a5,0(a0)
    80004428:	ffffe097          	auipc	ra,0xffffe
    8000442c:	100080e7          	jalr	256(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004430:	00048513          	mv	a0,s1
    80004434:	ffffe097          	auipc	ra,0xffffe
    80004438:	024080e7          	jalr	36(ra) # 80002458 <_ZdlPv>
    8000443c:	01813083          	ld	ra,24(sp)
    80004440:	01013403          	ld	s0,16(sp)
    80004444:	00813483          	ld	s1,8(sp)
    80004448:	02010113          	addi	sp,sp,32
    8000444c:	00008067          	ret

0000000080004450 <_ZN7WorkerA3runEv>:
    void run() override {
    80004450:	ff010113          	addi	sp,sp,-16
    80004454:	00113423          	sd	ra,8(sp)
    80004458:	00813023          	sd	s0,0(sp)
    8000445c:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80004460:	00000593          	li	a1,0
    80004464:	fffff097          	auipc	ra,0xfffff
    80004468:	774080e7          	jalr	1908(ra) # 80003bd8 <_ZN7WorkerA11workerBodyAEPv>
    }
    8000446c:	00813083          	ld	ra,8(sp)
    80004470:	00013403          	ld	s0,0(sp)
    80004474:	01010113          	addi	sp,sp,16
    80004478:	00008067          	ret

000000008000447c <_ZN7WorkerB3runEv>:
    void run() override {
    8000447c:	ff010113          	addi	sp,sp,-16
    80004480:	00113423          	sd	ra,8(sp)
    80004484:	00813023          	sd	s0,0(sp)
    80004488:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    8000448c:	00000593          	li	a1,0
    80004490:	00000097          	auipc	ra,0x0
    80004494:	814080e7          	jalr	-2028(ra) # 80003ca4 <_ZN7WorkerB11workerBodyBEPv>
    }
    80004498:	00813083          	ld	ra,8(sp)
    8000449c:	00013403          	ld	s0,0(sp)
    800044a0:	01010113          	addi	sp,sp,16
    800044a4:	00008067          	ret

00000000800044a8 <_ZN7WorkerC3runEv>:
    void run() override {
    800044a8:	ff010113          	addi	sp,sp,-16
    800044ac:	00113423          	sd	ra,8(sp)
    800044b0:	00813023          	sd	s0,0(sp)
    800044b4:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    800044b8:	00000593          	li	a1,0
    800044bc:	00000097          	auipc	ra,0x0
    800044c0:	8bc080e7          	jalr	-1860(ra) # 80003d78 <_ZN7WorkerC11workerBodyCEPv>
    }
    800044c4:	00813083          	ld	ra,8(sp)
    800044c8:	00013403          	ld	s0,0(sp)
    800044cc:	01010113          	addi	sp,sp,16
    800044d0:	00008067          	ret

00000000800044d4 <_ZN7WorkerD3runEv>:
    void run() override {
    800044d4:	ff010113          	addi	sp,sp,-16
    800044d8:	00113423          	sd	ra,8(sp)
    800044dc:	00813023          	sd	s0,0(sp)
    800044e0:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    800044e4:	00000593          	li	a1,0
    800044e8:	00000097          	auipc	ra,0x0
    800044ec:	a10080e7          	jalr	-1520(ra) # 80003ef8 <_ZN7WorkerD11workerBodyDEPv>
    }
    800044f0:	00813083          	ld	ra,8(sp)
    800044f4:	00013403          	ld	s0,0(sp)
    800044f8:	01010113          	addi	sp,sp,16
    800044fc:	00008067          	ret

0000000080004500 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80004500:	f8010113          	addi	sp,sp,-128
    80004504:	06113c23          	sd	ra,120(sp)
    80004508:	06813823          	sd	s0,112(sp)
    8000450c:	06913423          	sd	s1,104(sp)
    80004510:	07213023          	sd	s2,96(sp)
    80004514:	05313c23          	sd	s3,88(sp)
    80004518:	05413823          	sd	s4,80(sp)
    8000451c:	05513423          	sd	s5,72(sp)
    80004520:	05613023          	sd	s6,64(sp)
    80004524:	03713c23          	sd	s7,56(sp)
    80004528:	03813823          	sd	s8,48(sp)
    8000452c:	03913423          	sd	s9,40(sp)
    80004530:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80004534:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80004538:	00005517          	auipc	a0,0x5
    8000453c:	c0050513          	addi	a0,a0,-1024 # 80009138 <_ZZ18kernelPrintIntegermE6digits+0x118>
    80004540:	00001097          	auipc	ra,0x1
    80004544:	5a8080e7          	jalr	1448(ra) # 80005ae8 <_Z11printStringPKc>
    getString(input, 30);
    80004548:	01e00593          	li	a1,30
    8000454c:	f8040493          	addi	s1,s0,-128
    80004550:	00048513          	mv	a0,s1
    80004554:	00001097          	auipc	ra,0x1
    80004558:	61c080e7          	jalr	1564(ra) # 80005b70 <_Z9getStringPci>
    threadNum = stringToInt(input);
    8000455c:	00048513          	mv	a0,s1
    80004560:	00001097          	auipc	ra,0x1
    80004564:	6e8080e7          	jalr	1768(ra) # 80005c48 <_Z11stringToIntPKc>
    80004568:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    8000456c:	00005517          	auipc	a0,0x5
    80004570:	bec50513          	addi	a0,a0,-1044 # 80009158 <_ZZ18kernelPrintIntegermE6digits+0x138>
    80004574:	00001097          	auipc	ra,0x1
    80004578:	574080e7          	jalr	1396(ra) # 80005ae8 <_Z11printStringPKc>
    getString(input, 30);
    8000457c:	01e00593          	li	a1,30
    80004580:	00048513          	mv	a0,s1
    80004584:	00001097          	auipc	ra,0x1
    80004588:	5ec080e7          	jalr	1516(ra) # 80005b70 <_Z9getStringPci>
    n = stringToInt(input);
    8000458c:	00048513          	mv	a0,s1
    80004590:	00001097          	auipc	ra,0x1
    80004594:	6b8080e7          	jalr	1720(ra) # 80005c48 <_Z11stringToIntPKc>
    80004598:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    8000459c:	00005517          	auipc	a0,0x5
    800045a0:	bdc50513          	addi	a0,a0,-1060 # 80009178 <_ZZ18kernelPrintIntegermE6digits+0x158>
    800045a4:	00001097          	auipc	ra,0x1
    800045a8:	544080e7          	jalr	1348(ra) # 80005ae8 <_Z11printStringPKc>
    printInt(threadNum);
    800045ac:	00000613          	li	a2,0
    800045b0:	00a00593          	li	a1,10
    800045b4:	00098513          	mv	a0,s3
    800045b8:	00001097          	auipc	ra,0x1
    800045bc:	6e0080e7          	jalr	1760(ra) # 80005c98 <_Z8printIntiii>
    printString(" i velicina bafera ");
    800045c0:	00005517          	auipc	a0,0x5
    800045c4:	bd050513          	addi	a0,a0,-1072 # 80009190 <_ZZ18kernelPrintIntegermE6digits+0x170>
    800045c8:	00001097          	auipc	ra,0x1
    800045cc:	520080e7          	jalr	1312(ra) # 80005ae8 <_Z11printStringPKc>
    printInt(n);
    800045d0:	00000613          	li	a2,0
    800045d4:	00a00593          	li	a1,10
    800045d8:	00048513          	mv	a0,s1
    800045dc:	00001097          	auipc	ra,0x1
    800045e0:	6bc080e7          	jalr	1724(ra) # 80005c98 <_Z8printIntiii>
    printString(".\n");
    800045e4:	00005517          	auipc	a0,0x5
    800045e8:	bc450513          	addi	a0,a0,-1084 # 800091a8 <_ZZ18kernelPrintIntegermE6digits+0x188>
    800045ec:	00001097          	auipc	ra,0x1
    800045f0:	4fc080e7          	jalr	1276(ra) # 80005ae8 <_Z11printStringPKc>
    if (threadNum > n) {
    800045f4:	0334c463          	blt	s1,s3,8000461c <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    800045f8:	03305c63          	blez	s3,80004630 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800045fc:	03800513          	li	a0,56
    80004600:	ffffe097          	auipc	ra,0xffffe
    80004604:	e08080e7          	jalr	-504(ra) # 80002408 <_Znwm>
    80004608:	00050a93          	mv	s5,a0
    8000460c:	00048593          	mv	a1,s1
    80004610:	00001097          	auipc	ra,0x1
    80004614:	7a8080e7          	jalr	1960(ra) # 80005db8 <_ZN9BufferCPPC1Ei>
    80004618:	0300006f          	j	80004648 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    8000461c:	00005517          	auipc	a0,0x5
    80004620:	b9450513          	addi	a0,a0,-1132 # 800091b0 <_ZZ18kernelPrintIntegermE6digits+0x190>
    80004624:	00001097          	auipc	ra,0x1
    80004628:	4c4080e7          	jalr	1220(ra) # 80005ae8 <_Z11printStringPKc>
        return;
    8000462c:	0140006f          	j	80004640 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004630:	00005517          	auipc	a0,0x5
    80004634:	bc050513          	addi	a0,a0,-1088 # 800091f0 <_ZZ18kernelPrintIntegermE6digits+0x1d0>
    80004638:	00001097          	auipc	ra,0x1
    8000463c:	4b0080e7          	jalr	1200(ra) # 80005ae8 <_Z11printStringPKc>
        return;
    80004640:	000c0113          	mv	sp,s8
    80004644:	2140006f          	j	80004858 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80004648:	01000513          	li	a0,16
    8000464c:	ffffe097          	auipc	ra,0xffffe
    80004650:	dbc080e7          	jalr	-580(ra) # 80002408 <_Znwm>
    80004654:	00050913          	mv	s2,a0
    80004658:	00000593          	li	a1,0
    8000465c:	ffffe097          	auipc	ra,0xffffe
    80004660:	1a0080e7          	jalr	416(ra) # 800027fc <_ZN9SemaphoreC1Ej>
    80004664:	00007797          	auipc	a5,0x7
    80004668:	3527ba23          	sd	s2,852(a5) # 8000b9b8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    8000466c:	00399793          	slli	a5,s3,0x3
    80004670:	00f78793          	addi	a5,a5,15
    80004674:	ff07f793          	andi	a5,a5,-16
    80004678:	40f10133          	sub	sp,sp,a5
    8000467c:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80004680:	0019871b          	addiw	a4,s3,1
    80004684:	00171793          	slli	a5,a4,0x1
    80004688:	00e787b3          	add	a5,a5,a4
    8000468c:	00379793          	slli	a5,a5,0x3
    80004690:	00f78793          	addi	a5,a5,15
    80004694:	ff07f793          	andi	a5,a5,-16
    80004698:	40f10133          	sub	sp,sp,a5
    8000469c:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    800046a0:	00199493          	slli	s1,s3,0x1
    800046a4:	013484b3          	add	s1,s1,s3
    800046a8:	00349493          	slli	s1,s1,0x3
    800046ac:	009b04b3          	add	s1,s6,s1
    800046b0:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    800046b4:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    800046b8:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800046bc:	02800513          	li	a0,40
    800046c0:	ffffe097          	auipc	ra,0xffffe
    800046c4:	d48080e7          	jalr	-696(ra) # 80002408 <_Znwm>
    800046c8:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    800046cc:	ffffe097          	auipc	ra,0xffffe
    800046d0:	fc8080e7          	jalr	-56(ra) # 80002694 <_ZN6ThreadC1Ev>
    800046d4:	00007797          	auipc	a5,0x7
    800046d8:	12c78793          	addi	a5,a5,300 # 8000b800 <_ZTV8Consumer+0x10>
    800046dc:	00fbb023          	sd	a5,0(s7)
    800046e0:	029bb023          	sd	s1,32(s7)
    consumer->start();
    800046e4:	000b8513          	mv	a0,s7
    800046e8:	ffffe097          	auipc	ra,0xffffe
    800046ec:	fe4080e7          	jalr	-28(ra) # 800026cc <_ZN6Thread5startEv>
    threadData[0].id = 0;
    800046f0:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    800046f4:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    800046f8:	00007797          	auipc	a5,0x7
    800046fc:	2c07b783          	ld	a5,704(a5) # 8000b9b8 <_ZL10waitForAll>
    80004700:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004704:	02800513          	li	a0,40
    80004708:	ffffe097          	auipc	ra,0xffffe
    8000470c:	d00080e7          	jalr	-768(ra) # 80002408 <_Znwm>
    80004710:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80004714:	ffffe097          	auipc	ra,0xffffe
    80004718:	f80080e7          	jalr	-128(ra) # 80002694 <_ZN6ThreadC1Ev>
    8000471c:	00007797          	auipc	a5,0x7
    80004720:	09478793          	addi	a5,a5,148 # 8000b7b0 <_ZTV16ProducerKeyborad+0x10>
    80004724:	00f4b023          	sd	a5,0(s1)
    80004728:	0364b023          	sd	s6,32(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000472c:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004730:	00048513          	mv	a0,s1
    80004734:	ffffe097          	auipc	ra,0xffffe
    80004738:	f98080e7          	jalr	-104(ra) # 800026cc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000473c:	00100913          	li	s2,1
    80004740:	0300006f          	j	80004770 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80004744:	00007797          	auipc	a5,0x7
    80004748:	09478793          	addi	a5,a5,148 # 8000b7d8 <_ZTV8Producer+0x10>
    8000474c:	00fcb023          	sd	a5,0(s9)
    80004750:	029cb023          	sd	s1,32(s9)
        producers[i] = new Producer(&threadData[i]);
    80004754:	00391793          	slli	a5,s2,0x3
    80004758:	00fa07b3          	add	a5,s4,a5
    8000475c:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004760:	000c8513          	mv	a0,s9
    80004764:	ffffe097          	auipc	ra,0xffffe
    80004768:	f68080e7          	jalr	-152(ra) # 800026cc <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    8000476c:	0019091b          	addiw	s2,s2,1
    80004770:	05395263          	bge	s2,s3,800047b4 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80004774:	00191493          	slli	s1,s2,0x1
    80004778:	012484b3          	add	s1,s1,s2
    8000477c:	00349493          	slli	s1,s1,0x3
    80004780:	009b04b3          	add	s1,s6,s1
    80004784:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80004788:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    8000478c:	00007797          	auipc	a5,0x7
    80004790:	22c7b783          	ld	a5,556(a5) # 8000b9b8 <_ZL10waitForAll>
    80004794:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80004798:	02800513          	li	a0,40
    8000479c:	ffffe097          	auipc	ra,0xffffe
    800047a0:	c6c080e7          	jalr	-916(ra) # 80002408 <_Znwm>
    800047a4:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800047a8:	ffffe097          	auipc	ra,0xffffe
    800047ac:	eec080e7          	jalr	-276(ra) # 80002694 <_ZN6ThreadC1Ev>
    800047b0:	f95ff06f          	j	80004744 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800047b4:	ffffe097          	auipc	ra,0xffffe
    800047b8:	f78080e7          	jalr	-136(ra) # 8000272c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800047bc:	00000493          	li	s1,0
    800047c0:	0099ce63          	blt	s3,s1,800047dc <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800047c4:	00007517          	auipc	a0,0x7
    800047c8:	1f453503          	ld	a0,500(a0) # 8000b9b8 <_ZL10waitForAll>
    800047cc:	ffffe097          	auipc	ra,0xffffe
    800047d0:	068080e7          	jalr	104(ra) # 80002834 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800047d4:	0014849b          	addiw	s1,s1,1
    800047d8:	fe9ff06f          	j	800047c0 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800047dc:	00007517          	auipc	a0,0x7
    800047e0:	1dc53503          	ld	a0,476(a0) # 8000b9b8 <_ZL10waitForAll>
    800047e4:	00050863          	beqz	a0,800047f4 <_Z20testConsumerProducerv+0x2f4>
    800047e8:	00053783          	ld	a5,0(a0)
    800047ec:	0087b783          	ld	a5,8(a5)
    800047f0:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    800047f4:	00000493          	li	s1,0
    800047f8:	0080006f          	j	80004800 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    800047fc:	0014849b          	addiw	s1,s1,1
    80004800:	0334d263          	bge	s1,s3,80004824 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80004804:	00349793          	slli	a5,s1,0x3
    80004808:	00fa07b3          	add	a5,s4,a5
    8000480c:	0007b503          	ld	a0,0(a5)
    80004810:	fe0506e3          	beqz	a0,800047fc <_Z20testConsumerProducerv+0x2fc>
    80004814:	00053783          	ld	a5,0(a0)
    80004818:	0087b783          	ld	a5,8(a5)
    8000481c:	000780e7          	jalr	a5
    80004820:	fddff06f          	j	800047fc <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80004824:	000b8a63          	beqz	s7,80004838 <_Z20testConsumerProducerv+0x338>
    80004828:	000bb783          	ld	a5,0(s7)
    8000482c:	0087b783          	ld	a5,8(a5)
    80004830:	000b8513          	mv	a0,s7
    80004834:	000780e7          	jalr	a5
    delete buffer;
    80004838:	000a8e63          	beqz	s5,80004854 <_Z20testConsumerProducerv+0x354>
    8000483c:	000a8513          	mv	a0,s5
    80004840:	00002097          	auipc	ra,0x2
    80004844:	870080e7          	jalr	-1936(ra) # 800060b0 <_ZN9BufferCPPD1Ev>
    80004848:	000a8513          	mv	a0,s5
    8000484c:	ffffe097          	auipc	ra,0xffffe
    80004850:	c0c080e7          	jalr	-1012(ra) # 80002458 <_ZdlPv>
    80004854:	000c0113          	mv	sp,s8
}
    80004858:	f8040113          	addi	sp,s0,-128
    8000485c:	07813083          	ld	ra,120(sp)
    80004860:	07013403          	ld	s0,112(sp)
    80004864:	06813483          	ld	s1,104(sp)
    80004868:	06013903          	ld	s2,96(sp)
    8000486c:	05813983          	ld	s3,88(sp)
    80004870:	05013a03          	ld	s4,80(sp)
    80004874:	04813a83          	ld	s5,72(sp)
    80004878:	04013b03          	ld	s6,64(sp)
    8000487c:	03813b83          	ld	s7,56(sp)
    80004880:	03013c03          	ld	s8,48(sp)
    80004884:	02813c83          	ld	s9,40(sp)
    80004888:	08010113          	addi	sp,sp,128
    8000488c:	00008067          	ret
    80004890:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004894:	000a8513          	mv	a0,s5
    80004898:	ffffe097          	auipc	ra,0xffffe
    8000489c:	bc0080e7          	jalr	-1088(ra) # 80002458 <_ZdlPv>
    800048a0:	00048513          	mv	a0,s1
    800048a4:	00008097          	auipc	ra,0x8
    800048a8:	214080e7          	jalr	532(ra) # 8000cab8 <_Unwind_Resume>
    800048ac:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800048b0:	00090513          	mv	a0,s2
    800048b4:	ffffe097          	auipc	ra,0xffffe
    800048b8:	ba4080e7          	jalr	-1116(ra) # 80002458 <_ZdlPv>
    800048bc:	00048513          	mv	a0,s1
    800048c0:	00008097          	auipc	ra,0x8
    800048c4:	1f8080e7          	jalr	504(ra) # 8000cab8 <_Unwind_Resume>
    800048c8:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800048cc:	000b8513          	mv	a0,s7
    800048d0:	ffffe097          	auipc	ra,0xffffe
    800048d4:	b88080e7          	jalr	-1144(ra) # 80002458 <_ZdlPv>
    800048d8:	00048513          	mv	a0,s1
    800048dc:	00008097          	auipc	ra,0x8
    800048e0:	1dc080e7          	jalr	476(ra) # 8000cab8 <_Unwind_Resume>
    800048e4:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    800048e8:	00048513          	mv	a0,s1
    800048ec:	ffffe097          	auipc	ra,0xffffe
    800048f0:	b6c080e7          	jalr	-1172(ra) # 80002458 <_ZdlPv>
    800048f4:	00090513          	mv	a0,s2
    800048f8:	00008097          	auipc	ra,0x8
    800048fc:	1c0080e7          	jalr	448(ra) # 8000cab8 <_Unwind_Resume>
    80004900:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80004904:	000c8513          	mv	a0,s9
    80004908:	ffffe097          	auipc	ra,0xffffe
    8000490c:	b50080e7          	jalr	-1200(ra) # 80002458 <_ZdlPv>
    80004910:	00048513          	mv	a0,s1
    80004914:	00008097          	auipc	ra,0x8
    80004918:	1a4080e7          	jalr	420(ra) # 8000cab8 <_Unwind_Resume>

000000008000491c <_ZN8Consumer3runEv>:
    void run() override {
    8000491c:	fd010113          	addi	sp,sp,-48
    80004920:	02113423          	sd	ra,40(sp)
    80004924:	02813023          	sd	s0,32(sp)
    80004928:	00913c23          	sd	s1,24(sp)
    8000492c:	01213823          	sd	s2,16(sp)
    80004930:	01313423          	sd	s3,8(sp)
    80004934:	03010413          	addi	s0,sp,48
    80004938:	00050913          	mv	s2,a0
        int i = 0;
    8000493c:	00000993          	li	s3,0
    80004940:	0100006f          	j	80004950 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80004944:	00a00513          	li	a0,10
    80004948:	ffffe097          	auipc	ra,0xffffe
    8000494c:	f6c080e7          	jalr	-148(ra) # 800028b4 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004950:	00007797          	auipc	a5,0x7
    80004954:	0607a783          	lw	a5,96(a5) # 8000b9b0 <_ZL9threadEnd>
    80004958:	04079a63          	bnez	a5,800049ac <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    8000495c:	02093783          	ld	a5,32(s2)
    80004960:	0087b503          	ld	a0,8(a5)
    80004964:	00001097          	auipc	ra,0x1
    80004968:	638080e7          	jalr	1592(ra) # 80005f9c <_ZN9BufferCPP3getEv>
            i++;
    8000496c:	0019849b          	addiw	s1,s3,1
    80004970:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80004974:	0ff57513          	andi	a0,a0,255
    80004978:	ffffe097          	auipc	ra,0xffffe
    8000497c:	f3c080e7          	jalr	-196(ra) # 800028b4 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004980:	05000793          	li	a5,80
    80004984:	02f4e4bb          	remw	s1,s1,a5
    80004988:	fc0494e3          	bnez	s1,80004950 <_ZN8Consumer3runEv+0x34>
    8000498c:	fb9ff06f          	j	80004944 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80004990:	02093783          	ld	a5,32(s2)
    80004994:	0087b503          	ld	a0,8(a5)
    80004998:	00001097          	auipc	ra,0x1
    8000499c:	604080e7          	jalr	1540(ra) # 80005f9c <_ZN9BufferCPP3getEv>
            Console::putc(key);
    800049a0:	0ff57513          	andi	a0,a0,255
    800049a4:	ffffe097          	auipc	ra,0xffffe
    800049a8:	f10080e7          	jalr	-240(ra) # 800028b4 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    800049ac:	02093783          	ld	a5,32(s2)
    800049b0:	0087b503          	ld	a0,8(a5)
    800049b4:	00001097          	auipc	ra,0x1
    800049b8:	674080e7          	jalr	1652(ra) # 80006028 <_ZN9BufferCPP6getCntEv>
    800049bc:	fca04ae3          	bgtz	a0,80004990 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800049c0:	02093783          	ld	a5,32(s2)
    800049c4:	0107b503          	ld	a0,16(a5)
    800049c8:	ffffe097          	auipc	ra,0xffffe
    800049cc:	e98080e7          	jalr	-360(ra) # 80002860 <_ZN9Semaphore6signalEv>
    }
    800049d0:	02813083          	ld	ra,40(sp)
    800049d4:	02013403          	ld	s0,32(sp)
    800049d8:	01813483          	ld	s1,24(sp)
    800049dc:	01013903          	ld	s2,16(sp)
    800049e0:	00813983          	ld	s3,8(sp)
    800049e4:	03010113          	addi	sp,sp,48
    800049e8:	00008067          	ret

00000000800049ec <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    800049ec:	ff010113          	addi	sp,sp,-16
    800049f0:	00113423          	sd	ra,8(sp)
    800049f4:	00813023          	sd	s0,0(sp)
    800049f8:	01010413          	addi	s0,sp,16
    800049fc:	00007797          	auipc	a5,0x7
    80004a00:	e0478793          	addi	a5,a5,-508 # 8000b800 <_ZTV8Consumer+0x10>
    80004a04:	00f53023          	sd	a5,0(a0)
    80004a08:	ffffe097          	auipc	ra,0xffffe
    80004a0c:	b20080e7          	jalr	-1248(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004a10:	00813083          	ld	ra,8(sp)
    80004a14:	00013403          	ld	s0,0(sp)
    80004a18:	01010113          	addi	sp,sp,16
    80004a1c:	00008067          	ret

0000000080004a20 <_ZN8ConsumerD0Ev>:
    80004a20:	fe010113          	addi	sp,sp,-32
    80004a24:	00113c23          	sd	ra,24(sp)
    80004a28:	00813823          	sd	s0,16(sp)
    80004a2c:	00913423          	sd	s1,8(sp)
    80004a30:	02010413          	addi	s0,sp,32
    80004a34:	00050493          	mv	s1,a0
    80004a38:	00007797          	auipc	a5,0x7
    80004a3c:	dc878793          	addi	a5,a5,-568 # 8000b800 <_ZTV8Consumer+0x10>
    80004a40:	00f53023          	sd	a5,0(a0)
    80004a44:	ffffe097          	auipc	ra,0xffffe
    80004a48:	ae4080e7          	jalr	-1308(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004a4c:	00048513          	mv	a0,s1
    80004a50:	ffffe097          	auipc	ra,0xffffe
    80004a54:	a08080e7          	jalr	-1528(ra) # 80002458 <_ZdlPv>
    80004a58:	01813083          	ld	ra,24(sp)
    80004a5c:	01013403          	ld	s0,16(sp)
    80004a60:	00813483          	ld	s1,8(sp)
    80004a64:	02010113          	addi	sp,sp,32
    80004a68:	00008067          	ret

0000000080004a6c <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004a6c:	ff010113          	addi	sp,sp,-16
    80004a70:	00113423          	sd	ra,8(sp)
    80004a74:	00813023          	sd	s0,0(sp)
    80004a78:	01010413          	addi	s0,sp,16
    80004a7c:	00007797          	auipc	a5,0x7
    80004a80:	d3478793          	addi	a5,a5,-716 # 8000b7b0 <_ZTV16ProducerKeyborad+0x10>
    80004a84:	00f53023          	sd	a5,0(a0)
    80004a88:	ffffe097          	auipc	ra,0xffffe
    80004a8c:	aa0080e7          	jalr	-1376(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004a90:	00813083          	ld	ra,8(sp)
    80004a94:	00013403          	ld	s0,0(sp)
    80004a98:	01010113          	addi	sp,sp,16
    80004a9c:	00008067          	ret

0000000080004aa0 <_ZN16ProducerKeyboradD0Ev>:
    80004aa0:	fe010113          	addi	sp,sp,-32
    80004aa4:	00113c23          	sd	ra,24(sp)
    80004aa8:	00813823          	sd	s0,16(sp)
    80004aac:	00913423          	sd	s1,8(sp)
    80004ab0:	02010413          	addi	s0,sp,32
    80004ab4:	00050493          	mv	s1,a0
    80004ab8:	00007797          	auipc	a5,0x7
    80004abc:	cf878793          	addi	a5,a5,-776 # 8000b7b0 <_ZTV16ProducerKeyborad+0x10>
    80004ac0:	00f53023          	sd	a5,0(a0)
    80004ac4:	ffffe097          	auipc	ra,0xffffe
    80004ac8:	a64080e7          	jalr	-1436(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004acc:	00048513          	mv	a0,s1
    80004ad0:	ffffe097          	auipc	ra,0xffffe
    80004ad4:	988080e7          	jalr	-1656(ra) # 80002458 <_ZdlPv>
    80004ad8:	01813083          	ld	ra,24(sp)
    80004adc:	01013403          	ld	s0,16(sp)
    80004ae0:	00813483          	ld	s1,8(sp)
    80004ae4:	02010113          	addi	sp,sp,32
    80004ae8:	00008067          	ret

0000000080004aec <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004aec:	ff010113          	addi	sp,sp,-16
    80004af0:	00113423          	sd	ra,8(sp)
    80004af4:	00813023          	sd	s0,0(sp)
    80004af8:	01010413          	addi	s0,sp,16
    80004afc:	00007797          	auipc	a5,0x7
    80004b00:	cdc78793          	addi	a5,a5,-804 # 8000b7d8 <_ZTV8Producer+0x10>
    80004b04:	00f53023          	sd	a5,0(a0)
    80004b08:	ffffe097          	auipc	ra,0xffffe
    80004b0c:	a20080e7          	jalr	-1504(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004b10:	00813083          	ld	ra,8(sp)
    80004b14:	00013403          	ld	s0,0(sp)
    80004b18:	01010113          	addi	sp,sp,16
    80004b1c:	00008067          	ret

0000000080004b20 <_ZN8ProducerD0Ev>:
    80004b20:	fe010113          	addi	sp,sp,-32
    80004b24:	00113c23          	sd	ra,24(sp)
    80004b28:	00813823          	sd	s0,16(sp)
    80004b2c:	00913423          	sd	s1,8(sp)
    80004b30:	02010413          	addi	s0,sp,32
    80004b34:	00050493          	mv	s1,a0
    80004b38:	00007797          	auipc	a5,0x7
    80004b3c:	ca078793          	addi	a5,a5,-864 # 8000b7d8 <_ZTV8Producer+0x10>
    80004b40:	00f53023          	sd	a5,0(a0)
    80004b44:	ffffe097          	auipc	ra,0xffffe
    80004b48:	9e4080e7          	jalr	-1564(ra) # 80002528 <_ZN6ThreadD1Ev>
    80004b4c:	00048513          	mv	a0,s1
    80004b50:	ffffe097          	auipc	ra,0xffffe
    80004b54:	908080e7          	jalr	-1784(ra) # 80002458 <_ZdlPv>
    80004b58:	01813083          	ld	ra,24(sp)
    80004b5c:	01013403          	ld	s0,16(sp)
    80004b60:	00813483          	ld	s1,8(sp)
    80004b64:	02010113          	addi	sp,sp,32
    80004b68:	00008067          	ret

0000000080004b6c <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004b6c:	fe010113          	addi	sp,sp,-32
    80004b70:	00113c23          	sd	ra,24(sp)
    80004b74:	00813823          	sd	s0,16(sp)
    80004b78:	00913423          	sd	s1,8(sp)
    80004b7c:	02010413          	addi	s0,sp,32
    80004b80:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004b84:	ffffd097          	auipc	ra,0xffffd
    80004b88:	ab0080e7          	jalr	-1360(ra) # 80001634 <_Z4getcv>
    80004b8c:	0005059b          	sext.w	a1,a0
    80004b90:	01b00793          	li	a5,27
    80004b94:	00f58c63          	beq	a1,a5,80004bac <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    80004b98:	0204b783          	ld	a5,32(s1)
    80004b9c:	0087b503          	ld	a0,8(a5)
    80004ba0:	00001097          	auipc	ra,0x1
    80004ba4:	36c080e7          	jalr	876(ra) # 80005f0c <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    80004ba8:	fddff06f          	j	80004b84 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004bac:	00100793          	li	a5,1
    80004bb0:	00007717          	auipc	a4,0x7
    80004bb4:	e0f72023          	sw	a5,-512(a4) # 8000b9b0 <_ZL9threadEnd>
        td->buffer->put('!');
    80004bb8:	0204b783          	ld	a5,32(s1)
    80004bbc:	02100593          	li	a1,33
    80004bc0:	0087b503          	ld	a0,8(a5)
    80004bc4:	00001097          	auipc	ra,0x1
    80004bc8:	348080e7          	jalr	840(ra) # 80005f0c <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004bcc:	0204b783          	ld	a5,32(s1)
    80004bd0:	0107b503          	ld	a0,16(a5)
    80004bd4:	ffffe097          	auipc	ra,0xffffe
    80004bd8:	c8c080e7          	jalr	-884(ra) # 80002860 <_ZN9Semaphore6signalEv>
    }
    80004bdc:	01813083          	ld	ra,24(sp)
    80004be0:	01013403          	ld	s0,16(sp)
    80004be4:	00813483          	ld	s1,8(sp)
    80004be8:	02010113          	addi	sp,sp,32
    80004bec:	00008067          	ret

0000000080004bf0 <_ZN8Producer3runEv>:
    void run() override {
    80004bf0:	fe010113          	addi	sp,sp,-32
    80004bf4:	00113c23          	sd	ra,24(sp)
    80004bf8:	00813823          	sd	s0,16(sp)
    80004bfc:	00913423          	sd	s1,8(sp)
    80004c00:	01213023          	sd	s2,0(sp)
    80004c04:	02010413          	addi	s0,sp,32
    80004c08:	00050493          	mv	s1,a0
        int i = 0;
    80004c0c:	00000913          	li	s2,0
        while (!threadEnd) {
    80004c10:	00007797          	auipc	a5,0x7
    80004c14:	da07a783          	lw	a5,-608(a5) # 8000b9b0 <_ZL9threadEnd>
    80004c18:	04079263          	bnez	a5,80004c5c <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004c1c:	0204b783          	ld	a5,32(s1)
    80004c20:	0007a583          	lw	a1,0(a5)
    80004c24:	0305859b          	addiw	a1,a1,48
    80004c28:	0087b503          	ld	a0,8(a5)
    80004c2c:	00001097          	auipc	ra,0x1
    80004c30:	2e0080e7          	jalr	736(ra) # 80005f0c <_ZN9BufferCPP3putEi>
            i++;
    80004c34:	0019071b          	addiw	a4,s2,1
    80004c38:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004c3c:	0204b783          	ld	a5,32(s1)
    80004c40:	0007a783          	lw	a5,0(a5)
    80004c44:	00e787bb          	addw	a5,a5,a4
    80004c48:	00500513          	li	a0,5
    80004c4c:	02a7e53b          	remw	a0,a5,a0
    80004c50:	ffffe097          	auipc	ra,0xffffe
    80004c54:	b04080e7          	jalr	-1276(ra) # 80002754 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004c58:	fb9ff06f          	j	80004c10 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004c5c:	0204b783          	ld	a5,32(s1)
    80004c60:	0107b503          	ld	a0,16(a5)
    80004c64:	ffffe097          	auipc	ra,0xffffe
    80004c68:	bfc080e7          	jalr	-1028(ra) # 80002860 <_ZN9Semaphore6signalEv>
    }
    80004c6c:	01813083          	ld	ra,24(sp)
    80004c70:	01013403          	ld	s0,16(sp)
    80004c74:	00813483          	ld	s1,8(sp)
    80004c78:	00013903          	ld	s2,0(sp)
    80004c7c:	02010113          	addi	sp,sp,32
    80004c80:	00008067          	ret

0000000080004c84 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004c84:	fe010113          	addi	sp,sp,-32
    80004c88:	00113c23          	sd	ra,24(sp)
    80004c8c:	00813823          	sd	s0,16(sp)
    80004c90:	00913423          	sd	s1,8(sp)
    80004c94:	01213023          	sd	s2,0(sp)
    80004c98:	02010413          	addi	s0,sp,32
    80004c9c:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004ca0:	00100793          	li	a5,1
    80004ca4:	02a7f863          	bgeu	a5,a0,80004cd4 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80004ca8:	00a00793          	li	a5,10
    80004cac:	02f577b3          	remu	a5,a0,a5
    80004cb0:	02078e63          	beqz	a5,80004cec <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004cb4:	fff48513          	addi	a0,s1,-1
    80004cb8:	00000097          	auipc	ra,0x0
    80004cbc:	fcc080e7          	jalr	-52(ra) # 80004c84 <_ZL9fibonaccim>
    80004cc0:	00050913          	mv	s2,a0
    80004cc4:	ffe48513          	addi	a0,s1,-2
    80004cc8:	00000097          	auipc	ra,0x0
    80004ccc:	fbc080e7          	jalr	-68(ra) # 80004c84 <_ZL9fibonaccim>
    80004cd0:	00a90533          	add	a0,s2,a0
}
    80004cd4:	01813083          	ld	ra,24(sp)
    80004cd8:	01013403          	ld	s0,16(sp)
    80004cdc:	00813483          	ld	s1,8(sp)
    80004ce0:	00013903          	ld	s2,0(sp)
    80004ce4:	02010113          	addi	sp,sp,32
    80004ce8:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004cec:	ffffc097          	auipc	ra,0xffffc
    80004cf0:	7d8080e7          	jalr	2008(ra) # 800014c4 <_Z15thread_dispatchv>
    80004cf4:	fc1ff06f          	j	80004cb4 <_ZL9fibonaccim+0x30>

0000000080004cf8 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004cf8:	fe010113          	addi	sp,sp,-32
    80004cfc:	00113c23          	sd	ra,24(sp)
    80004d00:	00813823          	sd	s0,16(sp)
    80004d04:	00913423          	sd	s1,8(sp)
    80004d08:	01213023          	sd	s2,0(sp)
    80004d0c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004d10:	00a00493          	li	s1,10
    80004d14:	0400006f          	j	80004d54 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004d18:	00004517          	auipc	a0,0x4
    80004d1c:	56850513          	addi	a0,a0,1384 # 80009280 <_ZZ18kernelPrintIntegermE6digits+0x260>
    80004d20:	00001097          	auipc	ra,0x1
    80004d24:	dc8080e7          	jalr	-568(ra) # 80005ae8 <_Z11printStringPKc>
    80004d28:	00000613          	li	a2,0
    80004d2c:	00a00593          	li	a1,10
    80004d30:	00048513          	mv	a0,s1
    80004d34:	00001097          	auipc	ra,0x1
    80004d38:	f64080e7          	jalr	-156(ra) # 80005c98 <_Z8printIntiii>
    80004d3c:	00004517          	auipc	a0,0x4
    80004d40:	73450513          	addi	a0,a0,1844 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80004d44:	00001097          	auipc	ra,0x1
    80004d48:	da4080e7          	jalr	-604(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004d4c:	0014849b          	addiw	s1,s1,1
    80004d50:	0ff4f493          	andi	s1,s1,255
    80004d54:	00c00793          	li	a5,12
    80004d58:	fc97f0e3          	bgeu	a5,s1,80004d18 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004d5c:	00004517          	auipc	a0,0x4
    80004d60:	52c50513          	addi	a0,a0,1324 # 80009288 <_ZZ18kernelPrintIntegermE6digits+0x268>
    80004d64:	00001097          	auipc	ra,0x1
    80004d68:	d84080e7          	jalr	-636(ra) # 80005ae8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004d6c:	00500313          	li	t1,5
    thread_dispatch();
    80004d70:	ffffc097          	auipc	ra,0xffffc
    80004d74:	754080e7          	jalr	1876(ra) # 800014c4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004d78:	01000513          	li	a0,16
    80004d7c:	00000097          	auipc	ra,0x0
    80004d80:	f08080e7          	jalr	-248(ra) # 80004c84 <_ZL9fibonaccim>
    80004d84:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80004d88:	00004517          	auipc	a0,0x4
    80004d8c:	51050513          	addi	a0,a0,1296 # 80009298 <_ZZ18kernelPrintIntegermE6digits+0x278>
    80004d90:	00001097          	auipc	ra,0x1
    80004d94:	d58080e7          	jalr	-680(ra) # 80005ae8 <_Z11printStringPKc>
    80004d98:	00000613          	li	a2,0
    80004d9c:	00a00593          	li	a1,10
    80004da0:	0009051b          	sext.w	a0,s2
    80004da4:	00001097          	auipc	ra,0x1
    80004da8:	ef4080e7          	jalr	-268(ra) # 80005c98 <_Z8printIntiii>
    80004dac:	00004517          	auipc	a0,0x4
    80004db0:	6c450513          	addi	a0,a0,1732 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80004db4:	00001097          	auipc	ra,0x1
    80004db8:	d34080e7          	jalr	-716(ra) # 80005ae8 <_Z11printStringPKc>
    80004dbc:	0400006f          	j	80004dfc <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004dc0:	00004517          	auipc	a0,0x4
    80004dc4:	4c050513          	addi	a0,a0,1216 # 80009280 <_ZZ18kernelPrintIntegermE6digits+0x260>
    80004dc8:	00001097          	auipc	ra,0x1
    80004dcc:	d20080e7          	jalr	-736(ra) # 80005ae8 <_Z11printStringPKc>
    80004dd0:	00000613          	li	a2,0
    80004dd4:	00a00593          	li	a1,10
    80004dd8:	00048513          	mv	a0,s1
    80004ddc:	00001097          	auipc	ra,0x1
    80004de0:	ebc080e7          	jalr	-324(ra) # 80005c98 <_Z8printIntiii>
    80004de4:	00004517          	auipc	a0,0x4
    80004de8:	68c50513          	addi	a0,a0,1676 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80004dec:	00001097          	auipc	ra,0x1
    80004df0:	cfc080e7          	jalr	-772(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80004df4:	0014849b          	addiw	s1,s1,1
    80004df8:	0ff4f493          	andi	s1,s1,255
    80004dfc:	00f00793          	li	a5,15
    80004e00:	fc97f0e3          	bgeu	a5,s1,80004dc0 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80004e04:	00004517          	auipc	a0,0x4
    80004e08:	4a450513          	addi	a0,a0,1188 # 800092a8 <_ZZ18kernelPrintIntegermE6digits+0x288>
    80004e0c:	00001097          	auipc	ra,0x1
    80004e10:	cdc080e7          	jalr	-804(ra) # 80005ae8 <_Z11printStringPKc>
    finishedD = true;
    80004e14:	00100793          	li	a5,1
    80004e18:	00007717          	auipc	a4,0x7
    80004e1c:	baf70423          	sb	a5,-1112(a4) # 8000b9c0 <_ZL9finishedD>
    thread_dispatch();
    80004e20:	ffffc097          	auipc	ra,0xffffc
    80004e24:	6a4080e7          	jalr	1700(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80004e28:	01813083          	ld	ra,24(sp)
    80004e2c:	01013403          	ld	s0,16(sp)
    80004e30:	00813483          	ld	s1,8(sp)
    80004e34:	00013903          	ld	s2,0(sp)
    80004e38:	02010113          	addi	sp,sp,32
    80004e3c:	00008067          	ret

0000000080004e40 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004e40:	fe010113          	addi	sp,sp,-32
    80004e44:	00113c23          	sd	ra,24(sp)
    80004e48:	00813823          	sd	s0,16(sp)
    80004e4c:	00913423          	sd	s1,8(sp)
    80004e50:	01213023          	sd	s2,0(sp)
    80004e54:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004e58:	00000493          	li	s1,0
    80004e5c:	0400006f          	j	80004e9c <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004e60:	00004517          	auipc	a0,0x4
    80004e64:	3f050513          	addi	a0,a0,1008 # 80009250 <_ZZ18kernelPrintIntegermE6digits+0x230>
    80004e68:	00001097          	auipc	ra,0x1
    80004e6c:	c80080e7          	jalr	-896(ra) # 80005ae8 <_Z11printStringPKc>
    80004e70:	00000613          	li	a2,0
    80004e74:	00a00593          	li	a1,10
    80004e78:	00048513          	mv	a0,s1
    80004e7c:	00001097          	auipc	ra,0x1
    80004e80:	e1c080e7          	jalr	-484(ra) # 80005c98 <_Z8printIntiii>
    80004e84:	00004517          	auipc	a0,0x4
    80004e88:	5ec50513          	addi	a0,a0,1516 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80004e8c:	00001097          	auipc	ra,0x1
    80004e90:	c5c080e7          	jalr	-932(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004e94:	0014849b          	addiw	s1,s1,1
    80004e98:	0ff4f493          	andi	s1,s1,255
    80004e9c:	00200793          	li	a5,2
    80004ea0:	fc97f0e3          	bgeu	a5,s1,80004e60 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004ea4:	00004517          	auipc	a0,0x4
    80004ea8:	3b450513          	addi	a0,a0,948 # 80009258 <_ZZ18kernelPrintIntegermE6digits+0x238>
    80004eac:	00001097          	auipc	ra,0x1
    80004eb0:	c3c080e7          	jalr	-964(ra) # 80005ae8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004eb4:	00700313          	li	t1,7
    thread_dispatch();
    80004eb8:	ffffc097          	auipc	ra,0xffffc
    80004ebc:	60c080e7          	jalr	1548(ra) # 800014c4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004ec0:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004ec4:	00004517          	auipc	a0,0x4
    80004ec8:	3a450513          	addi	a0,a0,932 # 80009268 <_ZZ18kernelPrintIntegermE6digits+0x248>
    80004ecc:	00001097          	auipc	ra,0x1
    80004ed0:	c1c080e7          	jalr	-996(ra) # 80005ae8 <_Z11printStringPKc>
    80004ed4:	00000613          	li	a2,0
    80004ed8:	00a00593          	li	a1,10
    80004edc:	0009051b          	sext.w	a0,s2
    80004ee0:	00001097          	auipc	ra,0x1
    80004ee4:	db8080e7          	jalr	-584(ra) # 80005c98 <_Z8printIntiii>
    80004ee8:	00004517          	auipc	a0,0x4
    80004eec:	58850513          	addi	a0,a0,1416 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80004ef0:	00001097          	auipc	ra,0x1
    80004ef4:	bf8080e7          	jalr	-1032(ra) # 80005ae8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004ef8:	00c00513          	li	a0,12
    80004efc:	00000097          	auipc	ra,0x0
    80004f00:	d88080e7          	jalr	-632(ra) # 80004c84 <_ZL9fibonaccim>
    80004f04:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004f08:	00004517          	auipc	a0,0x4
    80004f0c:	36850513          	addi	a0,a0,872 # 80009270 <_ZZ18kernelPrintIntegermE6digits+0x250>
    80004f10:	00001097          	auipc	ra,0x1
    80004f14:	bd8080e7          	jalr	-1064(ra) # 80005ae8 <_Z11printStringPKc>
    80004f18:	00000613          	li	a2,0
    80004f1c:	00a00593          	li	a1,10
    80004f20:	0009051b          	sext.w	a0,s2
    80004f24:	00001097          	auipc	ra,0x1
    80004f28:	d74080e7          	jalr	-652(ra) # 80005c98 <_Z8printIntiii>
    80004f2c:	00004517          	auipc	a0,0x4
    80004f30:	54450513          	addi	a0,a0,1348 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80004f34:	00001097          	auipc	ra,0x1
    80004f38:	bb4080e7          	jalr	-1100(ra) # 80005ae8 <_Z11printStringPKc>
    80004f3c:	0400006f          	j	80004f7c <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004f40:	00004517          	auipc	a0,0x4
    80004f44:	31050513          	addi	a0,a0,784 # 80009250 <_ZZ18kernelPrintIntegermE6digits+0x230>
    80004f48:	00001097          	auipc	ra,0x1
    80004f4c:	ba0080e7          	jalr	-1120(ra) # 80005ae8 <_Z11printStringPKc>
    80004f50:	00000613          	li	a2,0
    80004f54:	00a00593          	li	a1,10
    80004f58:	00048513          	mv	a0,s1
    80004f5c:	00001097          	auipc	ra,0x1
    80004f60:	d3c080e7          	jalr	-708(ra) # 80005c98 <_Z8printIntiii>
    80004f64:	00004517          	auipc	a0,0x4
    80004f68:	50c50513          	addi	a0,a0,1292 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80004f6c:	00001097          	auipc	ra,0x1
    80004f70:	b7c080e7          	jalr	-1156(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004f74:	0014849b          	addiw	s1,s1,1
    80004f78:	0ff4f493          	andi	s1,s1,255
    80004f7c:	00500793          	li	a5,5
    80004f80:	fc97f0e3          	bgeu	a5,s1,80004f40 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004f84:	00004517          	auipc	a0,0x4
    80004f88:	2a450513          	addi	a0,a0,676 # 80009228 <_ZZ18kernelPrintIntegermE6digits+0x208>
    80004f8c:	00001097          	auipc	ra,0x1
    80004f90:	b5c080e7          	jalr	-1188(ra) # 80005ae8 <_Z11printStringPKc>
    finishedC = true;
    80004f94:	00100793          	li	a5,1
    80004f98:	00007717          	auipc	a4,0x7
    80004f9c:	a2f704a3          	sb	a5,-1495(a4) # 8000b9c1 <_ZL9finishedC>
    thread_dispatch();
    80004fa0:	ffffc097          	auipc	ra,0xffffc
    80004fa4:	524080e7          	jalr	1316(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80004fa8:	01813083          	ld	ra,24(sp)
    80004fac:	01013403          	ld	s0,16(sp)
    80004fb0:	00813483          	ld	s1,8(sp)
    80004fb4:	00013903          	ld	s2,0(sp)
    80004fb8:	02010113          	addi	sp,sp,32
    80004fbc:	00008067          	ret

0000000080004fc0 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004fc0:	fe010113          	addi	sp,sp,-32
    80004fc4:	00113c23          	sd	ra,24(sp)
    80004fc8:	00813823          	sd	s0,16(sp)
    80004fcc:	00913423          	sd	s1,8(sp)
    80004fd0:	01213023          	sd	s2,0(sp)
    80004fd4:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80004fd8:	00000913          	li	s2,0
    80004fdc:	0380006f          	j	80005014 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004fe0:	ffffc097          	auipc	ra,0xffffc
    80004fe4:	4e4080e7          	jalr	1252(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004fe8:	00148493          	addi	s1,s1,1
    80004fec:	000027b7          	lui	a5,0x2
    80004ff0:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80004ff4:	0097ee63          	bltu	a5,s1,80005010 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004ff8:	00000713          	li	a4,0
    80004ffc:	000077b7          	lui	a5,0x7
    80005000:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005004:	fce7eee3          	bltu	a5,a4,80004fe0 <_ZL11workerBodyBPv+0x20>
    80005008:	00170713          	addi	a4,a4,1
    8000500c:	ff1ff06f          	j	80004ffc <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80005010:	00190913          	addi	s2,s2,1
    80005014:	00f00793          	li	a5,15
    80005018:	0527e063          	bltu	a5,s2,80005058 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    8000501c:	00004517          	auipc	a0,0x4
    80005020:	21c50513          	addi	a0,a0,540 # 80009238 <_ZZ18kernelPrintIntegermE6digits+0x218>
    80005024:	00001097          	auipc	ra,0x1
    80005028:	ac4080e7          	jalr	-1340(ra) # 80005ae8 <_Z11printStringPKc>
    8000502c:	00000613          	li	a2,0
    80005030:	00a00593          	li	a1,10
    80005034:	0009051b          	sext.w	a0,s2
    80005038:	00001097          	auipc	ra,0x1
    8000503c:	c60080e7          	jalr	-928(ra) # 80005c98 <_Z8printIntiii>
    80005040:	00004517          	auipc	a0,0x4
    80005044:	43050513          	addi	a0,a0,1072 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80005048:	00001097          	auipc	ra,0x1
    8000504c:	aa0080e7          	jalr	-1376(ra) # 80005ae8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005050:	00000493          	li	s1,0
    80005054:	f99ff06f          	j	80004fec <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80005058:	00004517          	auipc	a0,0x4
    8000505c:	1e850513          	addi	a0,a0,488 # 80009240 <_ZZ18kernelPrintIntegermE6digits+0x220>
    80005060:	00001097          	auipc	ra,0x1
    80005064:	a88080e7          	jalr	-1400(ra) # 80005ae8 <_Z11printStringPKc>
    finishedB = true;
    80005068:	00100793          	li	a5,1
    8000506c:	00007717          	auipc	a4,0x7
    80005070:	94f70b23          	sb	a5,-1706(a4) # 8000b9c2 <_ZL9finishedB>
    thread_dispatch();
    80005074:	ffffc097          	auipc	ra,0xffffc
    80005078:	450080e7          	jalr	1104(ra) # 800014c4 <_Z15thread_dispatchv>
}
    8000507c:	01813083          	ld	ra,24(sp)
    80005080:	01013403          	ld	s0,16(sp)
    80005084:	00813483          	ld	s1,8(sp)
    80005088:	00013903          	ld	s2,0(sp)
    8000508c:	02010113          	addi	sp,sp,32
    80005090:	00008067          	ret

0000000080005094 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005094:	fe010113          	addi	sp,sp,-32
    80005098:	00113c23          	sd	ra,24(sp)
    8000509c:	00813823          	sd	s0,16(sp)
    800050a0:	00913423          	sd	s1,8(sp)
    800050a4:	01213023          	sd	s2,0(sp)
    800050a8:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800050ac:	00000913          	li	s2,0
    800050b0:	0380006f          	j	800050e8 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800050b4:	ffffc097          	auipc	ra,0xffffc
    800050b8:	410080e7          	jalr	1040(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800050bc:	00148493          	addi	s1,s1,1
    800050c0:	000027b7          	lui	a5,0x2
    800050c4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800050c8:	0097ee63          	bltu	a5,s1,800050e4 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800050cc:	00000713          	li	a4,0
    800050d0:	000077b7          	lui	a5,0x7
    800050d4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800050d8:	fce7eee3          	bltu	a5,a4,800050b4 <_ZL11workerBodyAPv+0x20>
    800050dc:	00170713          	addi	a4,a4,1
    800050e0:	ff1ff06f          	j	800050d0 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800050e4:	00190913          	addi	s2,s2,1
    800050e8:	00900793          	li	a5,9
    800050ec:	0527e063          	bltu	a5,s2,8000512c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800050f0:	00004517          	auipc	a0,0x4
    800050f4:	13050513          	addi	a0,a0,304 # 80009220 <_ZZ18kernelPrintIntegermE6digits+0x200>
    800050f8:	00001097          	auipc	ra,0x1
    800050fc:	9f0080e7          	jalr	-1552(ra) # 80005ae8 <_Z11printStringPKc>
    80005100:	00000613          	li	a2,0
    80005104:	00a00593          	li	a1,10
    80005108:	0009051b          	sext.w	a0,s2
    8000510c:	00001097          	auipc	ra,0x1
    80005110:	b8c080e7          	jalr	-1140(ra) # 80005c98 <_Z8printIntiii>
    80005114:	00004517          	auipc	a0,0x4
    80005118:	35c50513          	addi	a0,a0,860 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    8000511c:	00001097          	auipc	ra,0x1
    80005120:	9cc080e7          	jalr	-1588(ra) # 80005ae8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005124:	00000493          	li	s1,0
    80005128:	f99ff06f          	j	800050c0 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    8000512c:	00004517          	auipc	a0,0x4
    80005130:	0fc50513          	addi	a0,a0,252 # 80009228 <_ZZ18kernelPrintIntegermE6digits+0x208>
    80005134:	00001097          	auipc	ra,0x1
    80005138:	9b4080e7          	jalr	-1612(ra) # 80005ae8 <_Z11printStringPKc>
    finishedA = true;
    8000513c:	00100793          	li	a5,1
    80005140:	00007717          	auipc	a4,0x7
    80005144:	88f701a3          	sb	a5,-1917(a4) # 8000b9c3 <_ZL9finishedA>
}
    80005148:	01813083          	ld	ra,24(sp)
    8000514c:	01013403          	ld	s0,16(sp)
    80005150:	00813483          	ld	s1,8(sp)
    80005154:	00013903          	ld	s2,0(sp)
    80005158:	02010113          	addi	sp,sp,32
    8000515c:	00008067          	ret

0000000080005160 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80005160:	fd010113          	addi	sp,sp,-48
    80005164:	02113423          	sd	ra,40(sp)
    80005168:	02813023          	sd	s0,32(sp)
    8000516c:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005170:	00000613          	li	a2,0
    80005174:	00000597          	auipc	a1,0x0
    80005178:	f2058593          	addi	a1,a1,-224 # 80005094 <_ZL11workerBodyAPv>
    8000517c:	fd040513          	addi	a0,s0,-48
    80005180:	ffffc097          	auipc	ra,0xffffc
    80005184:	288080e7          	jalr	648(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005188:	00004517          	auipc	a0,0x4
    8000518c:	13050513          	addi	a0,a0,304 # 800092b8 <_ZZ18kernelPrintIntegermE6digits+0x298>
    80005190:	00001097          	auipc	ra,0x1
    80005194:	958080e7          	jalr	-1704(ra) # 80005ae8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005198:	00000613          	li	a2,0
    8000519c:	00000597          	auipc	a1,0x0
    800051a0:	e2458593          	addi	a1,a1,-476 # 80004fc0 <_ZL11workerBodyBPv>
    800051a4:	fd840513          	addi	a0,s0,-40
    800051a8:	ffffc097          	auipc	ra,0xffffc
    800051ac:	260080e7          	jalr	608(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    800051b0:	00004517          	auipc	a0,0x4
    800051b4:	12050513          	addi	a0,a0,288 # 800092d0 <_ZZ18kernelPrintIntegermE6digits+0x2b0>
    800051b8:	00001097          	auipc	ra,0x1
    800051bc:	930080e7          	jalr	-1744(ra) # 80005ae8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    800051c0:	00000613          	li	a2,0
    800051c4:	00000597          	auipc	a1,0x0
    800051c8:	c7c58593          	addi	a1,a1,-900 # 80004e40 <_ZL11workerBodyCPv>
    800051cc:	fe040513          	addi	a0,s0,-32
    800051d0:	ffffc097          	auipc	ra,0xffffc
    800051d4:	238080e7          	jalr	568(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800051d8:	00004517          	auipc	a0,0x4
    800051dc:	11050513          	addi	a0,a0,272 # 800092e8 <_ZZ18kernelPrintIntegermE6digits+0x2c8>
    800051e0:	00001097          	auipc	ra,0x1
    800051e4:	908080e7          	jalr	-1784(ra) # 80005ae8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800051e8:	00000613          	li	a2,0
    800051ec:	00000597          	auipc	a1,0x0
    800051f0:	b0c58593          	addi	a1,a1,-1268 # 80004cf8 <_ZL11workerBodyDPv>
    800051f4:	fe840513          	addi	a0,s0,-24
    800051f8:	ffffc097          	auipc	ra,0xffffc
    800051fc:	210080e7          	jalr	528(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005200:	00004517          	auipc	a0,0x4
    80005204:	10050513          	addi	a0,a0,256 # 80009300 <_ZZ18kernelPrintIntegermE6digits+0x2e0>
    80005208:	00001097          	auipc	ra,0x1
    8000520c:	8e0080e7          	jalr	-1824(ra) # 80005ae8 <_Z11printStringPKc>
    80005210:	00c0006f          	j	8000521c <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005214:	ffffc097          	auipc	ra,0xffffc
    80005218:	2b0080e7          	jalr	688(ra) # 800014c4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    8000521c:	00006797          	auipc	a5,0x6
    80005220:	7a77c783          	lbu	a5,1959(a5) # 8000b9c3 <_ZL9finishedA>
    80005224:	fe0788e3          	beqz	a5,80005214 <_Z18Threads_C_API_testv+0xb4>
    80005228:	00006797          	auipc	a5,0x6
    8000522c:	79a7c783          	lbu	a5,1946(a5) # 8000b9c2 <_ZL9finishedB>
    80005230:	fe0782e3          	beqz	a5,80005214 <_Z18Threads_C_API_testv+0xb4>
    80005234:	00006797          	auipc	a5,0x6
    80005238:	78d7c783          	lbu	a5,1933(a5) # 8000b9c1 <_ZL9finishedC>
    8000523c:	fc078ce3          	beqz	a5,80005214 <_Z18Threads_C_API_testv+0xb4>
    80005240:	00006797          	auipc	a5,0x6
    80005244:	7807c783          	lbu	a5,1920(a5) # 8000b9c0 <_ZL9finishedD>
    80005248:	fc0786e3          	beqz	a5,80005214 <_Z18Threads_C_API_testv+0xb4>
    }

}
    8000524c:	02813083          	ld	ra,40(sp)
    80005250:	02013403          	ld	s0,32(sp)
    80005254:	03010113          	addi	sp,sp,48
    80005258:	00008067          	ret

000000008000525c <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    8000525c:	fd010113          	addi	sp,sp,-48
    80005260:	02113423          	sd	ra,40(sp)
    80005264:	02813023          	sd	s0,32(sp)
    80005268:	00913c23          	sd	s1,24(sp)
    8000526c:	01213823          	sd	s2,16(sp)
    80005270:	01313423          	sd	s3,8(sp)
    80005274:	03010413          	addi	s0,sp,48
    80005278:	00050993          	mv	s3,a0
    8000527c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80005280:	00000913          	li	s2,0
    80005284:	00c0006f          	j	80005290 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005288:	ffffd097          	auipc	ra,0xffffd
    8000528c:	4a4080e7          	jalr	1188(ra) # 8000272c <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80005290:	ffffc097          	auipc	ra,0xffffc
    80005294:	3a4080e7          	jalr	932(ra) # 80001634 <_Z4getcv>
    80005298:	0005059b          	sext.w	a1,a0
    8000529c:	01b00793          	li	a5,27
    800052a0:	02f58a63          	beq	a1,a5,800052d4 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    800052a4:	0084b503          	ld	a0,8(s1)
    800052a8:	00001097          	auipc	ra,0x1
    800052ac:	c64080e7          	jalr	-924(ra) # 80005f0c <_ZN9BufferCPP3putEi>
        i++;
    800052b0:	0019071b          	addiw	a4,s2,1
    800052b4:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    800052b8:	0004a683          	lw	a3,0(s1)
    800052bc:	0026979b          	slliw	a5,a3,0x2
    800052c0:	00d787bb          	addw	a5,a5,a3
    800052c4:	0017979b          	slliw	a5,a5,0x1
    800052c8:	02f767bb          	remw	a5,a4,a5
    800052cc:	fc0792e3          	bnez	a5,80005290 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    800052d0:	fb9ff06f          	j	80005288 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    800052d4:	00100793          	li	a5,1
    800052d8:	00006717          	auipc	a4,0x6
    800052dc:	6ef72823          	sw	a5,1776(a4) # 8000b9c8 <_ZL9threadEnd>
    td->buffer->put('!');
    800052e0:	0209b783          	ld	a5,32(s3)
    800052e4:	02100593          	li	a1,33
    800052e8:	0087b503          	ld	a0,8(a5)
    800052ec:	00001097          	auipc	ra,0x1
    800052f0:	c20080e7          	jalr	-992(ra) # 80005f0c <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800052f4:	0104b503          	ld	a0,16(s1)
    800052f8:	ffffd097          	auipc	ra,0xffffd
    800052fc:	568080e7          	jalr	1384(ra) # 80002860 <_ZN9Semaphore6signalEv>
}
    80005300:	02813083          	ld	ra,40(sp)
    80005304:	02013403          	ld	s0,32(sp)
    80005308:	01813483          	ld	s1,24(sp)
    8000530c:	01013903          	ld	s2,16(sp)
    80005310:	00813983          	ld	s3,8(sp)
    80005314:	03010113          	addi	sp,sp,48
    80005318:	00008067          	ret

000000008000531c <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    8000531c:	fe010113          	addi	sp,sp,-32
    80005320:	00113c23          	sd	ra,24(sp)
    80005324:	00813823          	sd	s0,16(sp)
    80005328:	00913423          	sd	s1,8(sp)
    8000532c:	01213023          	sd	s2,0(sp)
    80005330:	02010413          	addi	s0,sp,32
    80005334:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80005338:	00000913          	li	s2,0
    8000533c:	00c0006f          	j	80005348 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80005340:	ffffd097          	auipc	ra,0xffffd
    80005344:	3ec080e7          	jalr	1004(ra) # 8000272c <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80005348:	00006797          	auipc	a5,0x6
    8000534c:	6807a783          	lw	a5,1664(a5) # 8000b9c8 <_ZL9threadEnd>
    80005350:	02079e63          	bnez	a5,8000538c <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80005354:	0004a583          	lw	a1,0(s1)
    80005358:	0305859b          	addiw	a1,a1,48
    8000535c:	0084b503          	ld	a0,8(s1)
    80005360:	00001097          	auipc	ra,0x1
    80005364:	bac080e7          	jalr	-1108(ra) # 80005f0c <_ZN9BufferCPP3putEi>
        i++;
    80005368:	0019071b          	addiw	a4,s2,1
    8000536c:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80005370:	0004a683          	lw	a3,0(s1)
    80005374:	0026979b          	slliw	a5,a3,0x2
    80005378:	00d787bb          	addw	a5,a5,a3
    8000537c:	0017979b          	slliw	a5,a5,0x1
    80005380:	02f767bb          	remw	a5,a4,a5
    80005384:	fc0792e3          	bnez	a5,80005348 <_ZN12ProducerSync8producerEPv+0x2c>
    80005388:	fb9ff06f          	j	80005340 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    8000538c:	0104b503          	ld	a0,16(s1)
    80005390:	ffffd097          	auipc	ra,0xffffd
    80005394:	4d0080e7          	jalr	1232(ra) # 80002860 <_ZN9Semaphore6signalEv>
}
    80005398:	01813083          	ld	ra,24(sp)
    8000539c:	01013403          	ld	s0,16(sp)
    800053a0:	00813483          	ld	s1,8(sp)
    800053a4:	00013903          	ld	s2,0(sp)
    800053a8:	02010113          	addi	sp,sp,32
    800053ac:	00008067          	ret

00000000800053b0 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    800053b0:	fd010113          	addi	sp,sp,-48
    800053b4:	02113423          	sd	ra,40(sp)
    800053b8:	02813023          	sd	s0,32(sp)
    800053bc:	00913c23          	sd	s1,24(sp)
    800053c0:	01213823          	sd	s2,16(sp)
    800053c4:	01313423          	sd	s3,8(sp)
    800053c8:	01413023          	sd	s4,0(sp)
    800053cc:	03010413          	addi	s0,sp,48
    800053d0:	00050993          	mv	s3,a0
    800053d4:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800053d8:	00000a13          	li	s4,0
    800053dc:	01c0006f          	j	800053f8 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    800053e0:	ffffd097          	auipc	ra,0xffffd
    800053e4:	34c080e7          	jalr	844(ra) # 8000272c <_ZN6Thread8dispatchEv>
    800053e8:	0500006f          	j	80005438 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800053ec:	00a00513          	li	a0,10
    800053f0:	ffffc097          	auipc	ra,0xffffc
    800053f4:	278080e7          	jalr	632(ra) # 80001668 <_Z4putcc>
    while (!threadEnd) {
    800053f8:	00006797          	auipc	a5,0x6
    800053fc:	5d07a783          	lw	a5,1488(a5) # 8000b9c8 <_ZL9threadEnd>
    80005400:	06079263          	bnez	a5,80005464 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80005404:	00893503          	ld	a0,8(s2)
    80005408:	00001097          	auipc	ra,0x1
    8000540c:	b94080e7          	jalr	-1132(ra) # 80005f9c <_ZN9BufferCPP3getEv>
        i++;
    80005410:	001a049b          	addiw	s1,s4,1
    80005414:	00048a1b          	sext.w	s4,s1
        putc(key);
    80005418:	0ff57513          	andi	a0,a0,255
    8000541c:	ffffc097          	auipc	ra,0xffffc
    80005420:	24c080e7          	jalr	588(ra) # 80001668 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80005424:	00092703          	lw	a4,0(s2)
    80005428:	0027179b          	slliw	a5,a4,0x2
    8000542c:	00e787bb          	addw	a5,a5,a4
    80005430:	02f4e7bb          	remw	a5,s1,a5
    80005434:	fa0786e3          	beqz	a5,800053e0 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80005438:	05000793          	li	a5,80
    8000543c:	02f4e4bb          	remw	s1,s1,a5
    80005440:	fa049ce3          	bnez	s1,800053f8 <_ZN12ConsumerSync8consumerEPv+0x48>
    80005444:	fa9ff06f          	j	800053ec <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80005448:	0209b783          	ld	a5,32(s3)
    8000544c:	0087b503          	ld	a0,8(a5)
    80005450:	00001097          	auipc	ra,0x1
    80005454:	b4c080e7          	jalr	-1204(ra) # 80005f9c <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80005458:	0ff57513          	andi	a0,a0,255
    8000545c:	ffffd097          	auipc	ra,0xffffd
    80005460:	458080e7          	jalr	1112(ra) # 800028b4 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80005464:	0209b783          	ld	a5,32(s3)
    80005468:	0087b503          	ld	a0,8(a5)
    8000546c:	00001097          	auipc	ra,0x1
    80005470:	bbc080e7          	jalr	-1092(ra) # 80006028 <_ZN9BufferCPP6getCntEv>
    80005474:	fca04ae3          	bgtz	a0,80005448 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80005478:	01093503          	ld	a0,16(s2)
    8000547c:	ffffd097          	auipc	ra,0xffffd
    80005480:	3e4080e7          	jalr	996(ra) # 80002860 <_ZN9Semaphore6signalEv>
}
    80005484:	02813083          	ld	ra,40(sp)
    80005488:	02013403          	ld	s0,32(sp)
    8000548c:	01813483          	ld	s1,24(sp)
    80005490:	01013903          	ld	s2,16(sp)
    80005494:	00813983          	ld	s3,8(sp)
    80005498:	00013a03          	ld	s4,0(sp)
    8000549c:	03010113          	addi	sp,sp,48
    800054a0:	00008067          	ret

00000000800054a4 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    800054a4:	f8010113          	addi	sp,sp,-128
    800054a8:	06113c23          	sd	ra,120(sp)
    800054ac:	06813823          	sd	s0,112(sp)
    800054b0:	06913423          	sd	s1,104(sp)
    800054b4:	07213023          	sd	s2,96(sp)
    800054b8:	05313c23          	sd	s3,88(sp)
    800054bc:	05413823          	sd	s4,80(sp)
    800054c0:	05513423          	sd	s5,72(sp)
    800054c4:	05613023          	sd	s6,64(sp)
    800054c8:	03713c23          	sd	s7,56(sp)
    800054cc:	03813823          	sd	s8,48(sp)
    800054d0:	03913423          	sd	s9,40(sp)
    800054d4:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    800054d8:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    800054dc:	00004517          	auipc	a0,0x4
    800054e0:	c5c50513          	addi	a0,a0,-932 # 80009138 <_ZZ18kernelPrintIntegermE6digits+0x118>
    800054e4:	00000097          	auipc	ra,0x0
    800054e8:	604080e7          	jalr	1540(ra) # 80005ae8 <_Z11printStringPKc>
    getString(input, 30);
    800054ec:	01e00593          	li	a1,30
    800054f0:	f8040493          	addi	s1,s0,-128
    800054f4:	00048513          	mv	a0,s1
    800054f8:	00000097          	auipc	ra,0x0
    800054fc:	678080e7          	jalr	1656(ra) # 80005b70 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80005500:	00048513          	mv	a0,s1
    80005504:	00000097          	auipc	ra,0x0
    80005508:	744080e7          	jalr	1860(ra) # 80005c48 <_Z11stringToIntPKc>
    8000550c:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80005510:	00004517          	auipc	a0,0x4
    80005514:	c4850513          	addi	a0,a0,-952 # 80009158 <_ZZ18kernelPrintIntegermE6digits+0x138>
    80005518:	00000097          	auipc	ra,0x0
    8000551c:	5d0080e7          	jalr	1488(ra) # 80005ae8 <_Z11printStringPKc>
    getString(input, 30);
    80005520:	01e00593          	li	a1,30
    80005524:	00048513          	mv	a0,s1
    80005528:	00000097          	auipc	ra,0x0
    8000552c:	648080e7          	jalr	1608(ra) # 80005b70 <_Z9getStringPci>
    n = stringToInt(input);
    80005530:	00048513          	mv	a0,s1
    80005534:	00000097          	auipc	ra,0x0
    80005538:	714080e7          	jalr	1812(ra) # 80005c48 <_Z11stringToIntPKc>
    8000553c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80005540:	00004517          	auipc	a0,0x4
    80005544:	c3850513          	addi	a0,a0,-968 # 80009178 <_ZZ18kernelPrintIntegermE6digits+0x158>
    80005548:	00000097          	auipc	ra,0x0
    8000554c:	5a0080e7          	jalr	1440(ra) # 80005ae8 <_Z11printStringPKc>
    80005550:	00000613          	li	a2,0
    80005554:	00a00593          	li	a1,10
    80005558:	00090513          	mv	a0,s2
    8000555c:	00000097          	auipc	ra,0x0
    80005560:	73c080e7          	jalr	1852(ra) # 80005c98 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80005564:	00004517          	auipc	a0,0x4
    80005568:	c2c50513          	addi	a0,a0,-980 # 80009190 <_ZZ18kernelPrintIntegermE6digits+0x170>
    8000556c:	00000097          	auipc	ra,0x0
    80005570:	57c080e7          	jalr	1404(ra) # 80005ae8 <_Z11printStringPKc>
    80005574:	00000613          	li	a2,0
    80005578:	00a00593          	li	a1,10
    8000557c:	00048513          	mv	a0,s1
    80005580:	00000097          	auipc	ra,0x0
    80005584:	718080e7          	jalr	1816(ra) # 80005c98 <_Z8printIntiii>
    printString(".\n");
    80005588:	00004517          	auipc	a0,0x4
    8000558c:	c2050513          	addi	a0,a0,-992 # 800091a8 <_ZZ18kernelPrintIntegermE6digits+0x188>
    80005590:	00000097          	auipc	ra,0x0
    80005594:	558080e7          	jalr	1368(ra) # 80005ae8 <_Z11printStringPKc>
    if(threadNum > n) {
    80005598:	0324c463          	blt	s1,s2,800055c0 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    8000559c:	03205c63          	blez	s2,800055d4 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    800055a0:	03800513          	li	a0,56
    800055a4:	ffffd097          	auipc	ra,0xffffd
    800055a8:	e64080e7          	jalr	-412(ra) # 80002408 <_Znwm>
    800055ac:	00050a93          	mv	s5,a0
    800055b0:	00048593          	mv	a1,s1
    800055b4:	00001097          	auipc	ra,0x1
    800055b8:	804080e7          	jalr	-2044(ra) # 80005db8 <_ZN9BufferCPPC1Ei>
    800055bc:	0300006f          	j	800055ec <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800055c0:	00004517          	auipc	a0,0x4
    800055c4:	bf050513          	addi	a0,a0,-1040 # 800091b0 <_ZZ18kernelPrintIntegermE6digits+0x190>
    800055c8:	00000097          	auipc	ra,0x0
    800055cc:	520080e7          	jalr	1312(ra) # 80005ae8 <_Z11printStringPKc>
        return;
    800055d0:	0140006f          	j	800055e4 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800055d4:	00004517          	auipc	a0,0x4
    800055d8:	c1c50513          	addi	a0,a0,-996 # 800091f0 <_ZZ18kernelPrintIntegermE6digits+0x1d0>
    800055dc:	00000097          	auipc	ra,0x0
    800055e0:	50c080e7          	jalr	1292(ra) # 80005ae8 <_Z11printStringPKc>
        return;
    800055e4:	000b8113          	mv	sp,s7
    800055e8:	2380006f          	j	80005820 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    800055ec:	01000513          	li	a0,16
    800055f0:	ffffd097          	auipc	ra,0xffffd
    800055f4:	e18080e7          	jalr	-488(ra) # 80002408 <_Znwm>
    800055f8:	00050493          	mv	s1,a0
    800055fc:	00000593          	li	a1,0
    80005600:	ffffd097          	auipc	ra,0xffffd
    80005604:	1fc080e7          	jalr	508(ra) # 800027fc <_ZN9SemaphoreC1Ej>
    80005608:	00006797          	auipc	a5,0x6
    8000560c:	3c97b423          	sd	s1,968(a5) # 8000b9d0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80005610:	00391793          	slli	a5,s2,0x3
    80005614:	00f78793          	addi	a5,a5,15
    80005618:	ff07f793          	andi	a5,a5,-16
    8000561c:	40f10133          	sub	sp,sp,a5
    80005620:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80005624:	0019071b          	addiw	a4,s2,1
    80005628:	00171793          	slli	a5,a4,0x1
    8000562c:	00e787b3          	add	a5,a5,a4
    80005630:	00379793          	slli	a5,a5,0x3
    80005634:	00f78793          	addi	a5,a5,15
    80005638:	ff07f793          	andi	a5,a5,-16
    8000563c:	40f10133          	sub	sp,sp,a5
    80005640:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80005644:	00191c13          	slli	s8,s2,0x1
    80005648:	012c07b3          	add	a5,s8,s2
    8000564c:	00379793          	slli	a5,a5,0x3
    80005650:	00fa07b3          	add	a5,s4,a5
    80005654:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80005658:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    8000565c:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80005660:	02800513          	li	a0,40
    80005664:	ffffd097          	auipc	ra,0xffffd
    80005668:	da4080e7          	jalr	-604(ra) # 80002408 <_Znwm>
    8000566c:	00050b13          	mv	s6,a0
    80005670:	012c0c33          	add	s8,s8,s2
    80005674:	003c1c13          	slli	s8,s8,0x3
    80005678:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    8000567c:	ffffd097          	auipc	ra,0xffffd
    80005680:	018080e7          	jalr	24(ra) # 80002694 <_ZN6ThreadC1Ev>
    80005684:	00006797          	auipc	a5,0x6
    80005688:	1f478793          	addi	a5,a5,500 # 8000b878 <_ZTV12ConsumerSync+0x10>
    8000568c:	00fb3023          	sd	a5,0(s6)
    80005690:	038b3023          	sd	s8,32(s6)
    consumerThread->start();
    80005694:	000b0513          	mv	a0,s6
    80005698:	ffffd097          	auipc	ra,0xffffd
    8000569c:	034080e7          	jalr	52(ra) # 800026cc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800056a0:	00000493          	li	s1,0
    800056a4:	0380006f          	j	800056dc <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    800056a8:	00006797          	auipc	a5,0x6
    800056ac:	1a878793          	addi	a5,a5,424 # 8000b850 <_ZTV12ProducerSync+0x10>
    800056b0:	00fcb023          	sd	a5,0(s9)
    800056b4:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerSync(data+i);
    800056b8:	00349793          	slli	a5,s1,0x3
    800056bc:	00f987b3          	add	a5,s3,a5
    800056c0:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    800056c4:	00349793          	slli	a5,s1,0x3
    800056c8:	00f987b3          	add	a5,s3,a5
    800056cc:	0007b503          	ld	a0,0(a5)
    800056d0:	ffffd097          	auipc	ra,0xffffd
    800056d4:	ffc080e7          	jalr	-4(ra) # 800026cc <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    800056d8:	0014849b          	addiw	s1,s1,1
    800056dc:	0b24d063          	bge	s1,s2,8000577c <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    800056e0:	00149793          	slli	a5,s1,0x1
    800056e4:	009787b3          	add	a5,a5,s1
    800056e8:	00379793          	slli	a5,a5,0x3
    800056ec:	00fa07b3          	add	a5,s4,a5
    800056f0:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800056f4:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    800056f8:	00006717          	auipc	a4,0x6
    800056fc:	2d873703          	ld	a4,728(a4) # 8000b9d0 <_ZL10waitForAll>
    80005700:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80005704:	02905863          	blez	s1,80005734 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005708:	02800513          	li	a0,40
    8000570c:	ffffd097          	auipc	ra,0xffffd
    80005710:	cfc080e7          	jalr	-772(ra) # 80002408 <_Znwm>
    80005714:	00050c93          	mv	s9,a0
    80005718:	00149c13          	slli	s8,s1,0x1
    8000571c:	009c0c33          	add	s8,s8,s1
    80005720:	003c1c13          	slli	s8,s8,0x3
    80005724:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005728:	ffffd097          	auipc	ra,0xffffd
    8000572c:	f6c080e7          	jalr	-148(ra) # 80002694 <_ZN6ThreadC1Ev>
    80005730:	f79ff06f          	j	800056a8 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80005734:	02800513          	li	a0,40
    80005738:	ffffd097          	auipc	ra,0xffffd
    8000573c:	cd0080e7          	jalr	-816(ra) # 80002408 <_Znwm>
    80005740:	00050c93          	mv	s9,a0
    80005744:	00149c13          	slli	s8,s1,0x1
    80005748:	009c0c33          	add	s8,s8,s1
    8000574c:	003c1c13          	slli	s8,s8,0x3
    80005750:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80005754:	ffffd097          	auipc	ra,0xffffd
    80005758:	f40080e7          	jalr	-192(ra) # 80002694 <_ZN6ThreadC1Ev>
    8000575c:	00006797          	auipc	a5,0x6
    80005760:	0cc78793          	addi	a5,a5,204 # 8000b828 <_ZTV16ProducerKeyboard+0x10>
    80005764:	00fcb023          	sd	a5,0(s9)
    80005768:	038cb023          	sd	s8,32(s9)
            threads[i] = new ProducerKeyboard(data+i);
    8000576c:	00349793          	slli	a5,s1,0x3
    80005770:	00f987b3          	add	a5,s3,a5
    80005774:	0197b023          	sd	s9,0(a5)
    80005778:	f4dff06f          	j	800056c4 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    8000577c:	ffffd097          	auipc	ra,0xffffd
    80005780:	fb0080e7          	jalr	-80(ra) # 8000272c <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80005784:	00000493          	li	s1,0
    80005788:	00994e63          	blt	s2,s1,800057a4 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    8000578c:	00006517          	auipc	a0,0x6
    80005790:	24453503          	ld	a0,580(a0) # 8000b9d0 <_ZL10waitForAll>
    80005794:	ffffd097          	auipc	ra,0xffffd
    80005798:	0a0080e7          	jalr	160(ra) # 80002834 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    8000579c:	0014849b          	addiw	s1,s1,1
    800057a0:	fe9ff06f          	j	80005788 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800057a4:	00000493          	li	s1,0
    800057a8:	0080006f          	j	800057b0 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800057ac:	0014849b          	addiw	s1,s1,1
    800057b0:	0324d263          	bge	s1,s2,800057d4 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800057b4:	00349793          	slli	a5,s1,0x3
    800057b8:	00f987b3          	add	a5,s3,a5
    800057bc:	0007b503          	ld	a0,0(a5)
    800057c0:	fe0506e3          	beqz	a0,800057ac <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800057c4:	00053783          	ld	a5,0(a0)
    800057c8:	0087b783          	ld	a5,8(a5)
    800057cc:	000780e7          	jalr	a5
    800057d0:	fddff06f          	j	800057ac <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800057d4:	000b0a63          	beqz	s6,800057e8 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800057d8:	000b3783          	ld	a5,0(s6)
    800057dc:	0087b783          	ld	a5,8(a5)
    800057e0:	000b0513          	mv	a0,s6
    800057e4:	000780e7          	jalr	a5
    delete waitForAll;
    800057e8:	00006517          	auipc	a0,0x6
    800057ec:	1e853503          	ld	a0,488(a0) # 8000b9d0 <_ZL10waitForAll>
    800057f0:	00050863          	beqz	a0,80005800 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    800057f4:	00053783          	ld	a5,0(a0)
    800057f8:	0087b783          	ld	a5,8(a5)
    800057fc:	000780e7          	jalr	a5
    delete buffer;
    80005800:	000a8e63          	beqz	s5,8000581c <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80005804:	000a8513          	mv	a0,s5
    80005808:	00001097          	auipc	ra,0x1
    8000580c:	8a8080e7          	jalr	-1880(ra) # 800060b0 <_ZN9BufferCPPD1Ev>
    80005810:	000a8513          	mv	a0,s5
    80005814:	ffffd097          	auipc	ra,0xffffd
    80005818:	c44080e7          	jalr	-956(ra) # 80002458 <_ZdlPv>
    8000581c:	000b8113          	mv	sp,s7

}
    80005820:	f8040113          	addi	sp,s0,-128
    80005824:	07813083          	ld	ra,120(sp)
    80005828:	07013403          	ld	s0,112(sp)
    8000582c:	06813483          	ld	s1,104(sp)
    80005830:	06013903          	ld	s2,96(sp)
    80005834:	05813983          	ld	s3,88(sp)
    80005838:	05013a03          	ld	s4,80(sp)
    8000583c:	04813a83          	ld	s5,72(sp)
    80005840:	04013b03          	ld	s6,64(sp)
    80005844:	03813b83          	ld	s7,56(sp)
    80005848:	03013c03          	ld	s8,48(sp)
    8000584c:	02813c83          	ld	s9,40(sp)
    80005850:	08010113          	addi	sp,sp,128
    80005854:	00008067          	ret
    80005858:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    8000585c:	000a8513          	mv	a0,s5
    80005860:	ffffd097          	auipc	ra,0xffffd
    80005864:	bf8080e7          	jalr	-1032(ra) # 80002458 <_ZdlPv>
    80005868:	00048513          	mv	a0,s1
    8000586c:	00007097          	auipc	ra,0x7
    80005870:	24c080e7          	jalr	588(ra) # 8000cab8 <_Unwind_Resume>
    80005874:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005878:	00048513          	mv	a0,s1
    8000587c:	ffffd097          	auipc	ra,0xffffd
    80005880:	bdc080e7          	jalr	-1060(ra) # 80002458 <_ZdlPv>
    80005884:	00090513          	mv	a0,s2
    80005888:	00007097          	auipc	ra,0x7
    8000588c:	230080e7          	jalr	560(ra) # 8000cab8 <_Unwind_Resume>
    80005890:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80005894:	000b0513          	mv	a0,s6
    80005898:	ffffd097          	auipc	ra,0xffffd
    8000589c:	bc0080e7          	jalr	-1088(ra) # 80002458 <_ZdlPv>
    800058a0:	00048513          	mv	a0,s1
    800058a4:	00007097          	auipc	ra,0x7
    800058a8:	214080e7          	jalr	532(ra) # 8000cab8 <_Unwind_Resume>
    800058ac:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800058b0:	000c8513          	mv	a0,s9
    800058b4:	ffffd097          	auipc	ra,0xffffd
    800058b8:	ba4080e7          	jalr	-1116(ra) # 80002458 <_ZdlPv>
    800058bc:	00048513          	mv	a0,s1
    800058c0:	00007097          	auipc	ra,0x7
    800058c4:	1f8080e7          	jalr	504(ra) # 8000cab8 <_Unwind_Resume>
    800058c8:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800058cc:	000c8513          	mv	a0,s9
    800058d0:	ffffd097          	auipc	ra,0xffffd
    800058d4:	b88080e7          	jalr	-1144(ra) # 80002458 <_ZdlPv>
    800058d8:	00048513          	mv	a0,s1
    800058dc:	00007097          	auipc	ra,0x7
    800058e0:	1dc080e7          	jalr	476(ra) # 8000cab8 <_Unwind_Resume>

00000000800058e4 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800058e4:	ff010113          	addi	sp,sp,-16
    800058e8:	00113423          	sd	ra,8(sp)
    800058ec:	00813023          	sd	s0,0(sp)
    800058f0:	01010413          	addi	s0,sp,16
    800058f4:	00006797          	auipc	a5,0x6
    800058f8:	f8478793          	addi	a5,a5,-124 # 8000b878 <_ZTV12ConsumerSync+0x10>
    800058fc:	00f53023          	sd	a5,0(a0)
    80005900:	ffffd097          	auipc	ra,0xffffd
    80005904:	c28080e7          	jalr	-984(ra) # 80002528 <_ZN6ThreadD1Ev>
    80005908:	00813083          	ld	ra,8(sp)
    8000590c:	00013403          	ld	s0,0(sp)
    80005910:	01010113          	addi	sp,sp,16
    80005914:	00008067          	ret

0000000080005918 <_ZN12ConsumerSyncD0Ev>:
    80005918:	fe010113          	addi	sp,sp,-32
    8000591c:	00113c23          	sd	ra,24(sp)
    80005920:	00813823          	sd	s0,16(sp)
    80005924:	00913423          	sd	s1,8(sp)
    80005928:	02010413          	addi	s0,sp,32
    8000592c:	00050493          	mv	s1,a0
    80005930:	00006797          	auipc	a5,0x6
    80005934:	f4878793          	addi	a5,a5,-184 # 8000b878 <_ZTV12ConsumerSync+0x10>
    80005938:	00f53023          	sd	a5,0(a0)
    8000593c:	ffffd097          	auipc	ra,0xffffd
    80005940:	bec080e7          	jalr	-1044(ra) # 80002528 <_ZN6ThreadD1Ev>
    80005944:	00048513          	mv	a0,s1
    80005948:	ffffd097          	auipc	ra,0xffffd
    8000594c:	b10080e7          	jalr	-1264(ra) # 80002458 <_ZdlPv>
    80005950:	01813083          	ld	ra,24(sp)
    80005954:	01013403          	ld	s0,16(sp)
    80005958:	00813483          	ld	s1,8(sp)
    8000595c:	02010113          	addi	sp,sp,32
    80005960:	00008067          	ret

0000000080005964 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80005964:	ff010113          	addi	sp,sp,-16
    80005968:	00113423          	sd	ra,8(sp)
    8000596c:	00813023          	sd	s0,0(sp)
    80005970:	01010413          	addi	s0,sp,16
    80005974:	00006797          	auipc	a5,0x6
    80005978:	edc78793          	addi	a5,a5,-292 # 8000b850 <_ZTV12ProducerSync+0x10>
    8000597c:	00f53023          	sd	a5,0(a0)
    80005980:	ffffd097          	auipc	ra,0xffffd
    80005984:	ba8080e7          	jalr	-1112(ra) # 80002528 <_ZN6ThreadD1Ev>
    80005988:	00813083          	ld	ra,8(sp)
    8000598c:	00013403          	ld	s0,0(sp)
    80005990:	01010113          	addi	sp,sp,16
    80005994:	00008067          	ret

0000000080005998 <_ZN12ProducerSyncD0Ev>:
    80005998:	fe010113          	addi	sp,sp,-32
    8000599c:	00113c23          	sd	ra,24(sp)
    800059a0:	00813823          	sd	s0,16(sp)
    800059a4:	00913423          	sd	s1,8(sp)
    800059a8:	02010413          	addi	s0,sp,32
    800059ac:	00050493          	mv	s1,a0
    800059b0:	00006797          	auipc	a5,0x6
    800059b4:	ea078793          	addi	a5,a5,-352 # 8000b850 <_ZTV12ProducerSync+0x10>
    800059b8:	00f53023          	sd	a5,0(a0)
    800059bc:	ffffd097          	auipc	ra,0xffffd
    800059c0:	b6c080e7          	jalr	-1172(ra) # 80002528 <_ZN6ThreadD1Ev>
    800059c4:	00048513          	mv	a0,s1
    800059c8:	ffffd097          	auipc	ra,0xffffd
    800059cc:	a90080e7          	jalr	-1392(ra) # 80002458 <_ZdlPv>
    800059d0:	01813083          	ld	ra,24(sp)
    800059d4:	01013403          	ld	s0,16(sp)
    800059d8:	00813483          	ld	s1,8(sp)
    800059dc:	02010113          	addi	sp,sp,32
    800059e0:	00008067          	ret

00000000800059e4 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800059e4:	ff010113          	addi	sp,sp,-16
    800059e8:	00113423          	sd	ra,8(sp)
    800059ec:	00813023          	sd	s0,0(sp)
    800059f0:	01010413          	addi	s0,sp,16
    800059f4:	00006797          	auipc	a5,0x6
    800059f8:	e3478793          	addi	a5,a5,-460 # 8000b828 <_ZTV16ProducerKeyboard+0x10>
    800059fc:	00f53023          	sd	a5,0(a0)
    80005a00:	ffffd097          	auipc	ra,0xffffd
    80005a04:	b28080e7          	jalr	-1240(ra) # 80002528 <_ZN6ThreadD1Ev>
    80005a08:	00813083          	ld	ra,8(sp)
    80005a0c:	00013403          	ld	s0,0(sp)
    80005a10:	01010113          	addi	sp,sp,16
    80005a14:	00008067          	ret

0000000080005a18 <_ZN16ProducerKeyboardD0Ev>:
    80005a18:	fe010113          	addi	sp,sp,-32
    80005a1c:	00113c23          	sd	ra,24(sp)
    80005a20:	00813823          	sd	s0,16(sp)
    80005a24:	00913423          	sd	s1,8(sp)
    80005a28:	02010413          	addi	s0,sp,32
    80005a2c:	00050493          	mv	s1,a0
    80005a30:	00006797          	auipc	a5,0x6
    80005a34:	df878793          	addi	a5,a5,-520 # 8000b828 <_ZTV16ProducerKeyboard+0x10>
    80005a38:	00f53023          	sd	a5,0(a0)
    80005a3c:	ffffd097          	auipc	ra,0xffffd
    80005a40:	aec080e7          	jalr	-1300(ra) # 80002528 <_ZN6ThreadD1Ev>
    80005a44:	00048513          	mv	a0,s1
    80005a48:	ffffd097          	auipc	ra,0xffffd
    80005a4c:	a10080e7          	jalr	-1520(ra) # 80002458 <_ZdlPv>
    80005a50:	01813083          	ld	ra,24(sp)
    80005a54:	01013403          	ld	s0,16(sp)
    80005a58:	00813483          	ld	s1,8(sp)
    80005a5c:	02010113          	addi	sp,sp,32
    80005a60:	00008067          	ret

0000000080005a64 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80005a64:	ff010113          	addi	sp,sp,-16
    80005a68:	00113423          	sd	ra,8(sp)
    80005a6c:	00813023          	sd	s0,0(sp)
    80005a70:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80005a74:	02053583          	ld	a1,32(a0)
    80005a78:	fffff097          	auipc	ra,0xfffff
    80005a7c:	7e4080e7          	jalr	2020(ra) # 8000525c <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005a80:	00813083          	ld	ra,8(sp)
    80005a84:	00013403          	ld	s0,0(sp)
    80005a88:	01010113          	addi	sp,sp,16
    80005a8c:	00008067          	ret

0000000080005a90 <_ZN12ProducerSync3runEv>:
    void run() override {
    80005a90:	ff010113          	addi	sp,sp,-16
    80005a94:	00113423          	sd	ra,8(sp)
    80005a98:	00813023          	sd	s0,0(sp)
    80005a9c:	01010413          	addi	s0,sp,16
        producer(td);
    80005aa0:	02053583          	ld	a1,32(a0)
    80005aa4:	00000097          	auipc	ra,0x0
    80005aa8:	878080e7          	jalr	-1928(ra) # 8000531c <_ZN12ProducerSync8producerEPv>
    }
    80005aac:	00813083          	ld	ra,8(sp)
    80005ab0:	00013403          	ld	s0,0(sp)
    80005ab4:	01010113          	addi	sp,sp,16
    80005ab8:	00008067          	ret

0000000080005abc <_ZN12ConsumerSync3runEv>:
    void run() override {
    80005abc:	ff010113          	addi	sp,sp,-16
    80005ac0:	00113423          	sd	ra,8(sp)
    80005ac4:	00813023          	sd	s0,0(sp)
    80005ac8:	01010413          	addi	s0,sp,16
        consumer(td);
    80005acc:	02053583          	ld	a1,32(a0)
    80005ad0:	00000097          	auipc	ra,0x0
    80005ad4:	8e0080e7          	jalr	-1824(ra) # 800053b0 <_ZN12ConsumerSync8consumerEPv>
    }
    80005ad8:	00813083          	ld	ra,8(sp)
    80005adc:	00013403          	ld	s0,0(sp)
    80005ae0:	01010113          	addi	sp,sp,16
    80005ae4:	00008067          	ret

0000000080005ae8 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005ae8:	fe010113          	addi	sp,sp,-32
    80005aec:	00113c23          	sd	ra,24(sp)
    80005af0:	00813823          	sd	s0,16(sp)
    80005af4:	00913423          	sd	s1,8(sp)
    80005af8:	02010413          	addi	s0,sp,32
    80005afc:	00050493          	mv	s1,a0
    LOCK();
    80005b00:	00100613          	li	a2,1
    80005b04:	00000593          	li	a1,0
    80005b08:	00006517          	auipc	a0,0x6
    80005b0c:	ed050513          	addi	a0,a0,-304 # 8000b9d8 <lockPrint>
    80005b10:	ffffc097          	auipc	ra,0xffffc
    80005b14:	85c080e7          	jalr	-1956(ra) # 8000136c <copy_and_swap>
    80005b18:	00050863          	beqz	a0,80005b28 <_Z11printStringPKc+0x40>
    80005b1c:	ffffc097          	auipc	ra,0xffffc
    80005b20:	9a8080e7          	jalr	-1624(ra) # 800014c4 <_Z15thread_dispatchv>
    80005b24:	fddff06f          	j	80005b00 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005b28:	0004c503          	lbu	a0,0(s1)
    80005b2c:	00050a63          	beqz	a0,80005b40 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005b30:	ffffc097          	auipc	ra,0xffffc
    80005b34:	b38080e7          	jalr	-1224(ra) # 80001668 <_Z4putcc>
        string++;
    80005b38:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005b3c:	fedff06f          	j	80005b28 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005b40:	00000613          	li	a2,0
    80005b44:	00100593          	li	a1,1
    80005b48:	00006517          	auipc	a0,0x6
    80005b4c:	e9050513          	addi	a0,a0,-368 # 8000b9d8 <lockPrint>
    80005b50:	ffffc097          	auipc	ra,0xffffc
    80005b54:	81c080e7          	jalr	-2020(ra) # 8000136c <copy_and_swap>
    80005b58:	fe0514e3          	bnez	a0,80005b40 <_Z11printStringPKc+0x58>
}
    80005b5c:	01813083          	ld	ra,24(sp)
    80005b60:	01013403          	ld	s0,16(sp)
    80005b64:	00813483          	ld	s1,8(sp)
    80005b68:	02010113          	addi	sp,sp,32
    80005b6c:	00008067          	ret

0000000080005b70 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005b70:	fd010113          	addi	sp,sp,-48
    80005b74:	02113423          	sd	ra,40(sp)
    80005b78:	02813023          	sd	s0,32(sp)
    80005b7c:	00913c23          	sd	s1,24(sp)
    80005b80:	01213823          	sd	s2,16(sp)
    80005b84:	01313423          	sd	s3,8(sp)
    80005b88:	01413023          	sd	s4,0(sp)
    80005b8c:	03010413          	addi	s0,sp,48
    80005b90:	00050993          	mv	s3,a0
    80005b94:	00058a13          	mv	s4,a1
    LOCK();
    80005b98:	00100613          	li	a2,1
    80005b9c:	00000593          	li	a1,0
    80005ba0:	00006517          	auipc	a0,0x6
    80005ba4:	e3850513          	addi	a0,a0,-456 # 8000b9d8 <lockPrint>
    80005ba8:	ffffb097          	auipc	ra,0xffffb
    80005bac:	7c4080e7          	jalr	1988(ra) # 8000136c <copy_and_swap>
    80005bb0:	00050863          	beqz	a0,80005bc0 <_Z9getStringPci+0x50>
    80005bb4:	ffffc097          	auipc	ra,0xffffc
    80005bb8:	910080e7          	jalr	-1776(ra) # 800014c4 <_Z15thread_dispatchv>
    80005bbc:	fddff06f          	j	80005b98 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005bc0:	00000913          	li	s2,0
    80005bc4:	00090493          	mv	s1,s2
    80005bc8:	0019091b          	addiw	s2,s2,1
    80005bcc:	03495a63          	bge	s2,s4,80005c00 <_Z9getStringPci+0x90>
        cc = getc();
    80005bd0:	ffffc097          	auipc	ra,0xffffc
    80005bd4:	a64080e7          	jalr	-1436(ra) # 80001634 <_Z4getcv>
        if(cc < 1)
    80005bd8:	02050463          	beqz	a0,80005c00 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005bdc:	009984b3          	add	s1,s3,s1
    80005be0:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005be4:	00a00793          	li	a5,10
    80005be8:	00f50a63          	beq	a0,a5,80005bfc <_Z9getStringPci+0x8c>
    80005bec:	00d00793          	li	a5,13
    80005bf0:	fcf51ae3          	bne	a0,a5,80005bc4 <_Z9getStringPci+0x54>
        buf[i++] = c;
    80005bf4:	00090493          	mv	s1,s2
    80005bf8:	0080006f          	j	80005c00 <_Z9getStringPci+0x90>
    80005bfc:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005c00:	009984b3          	add	s1,s3,s1
    80005c04:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005c08:	00000613          	li	a2,0
    80005c0c:	00100593          	li	a1,1
    80005c10:	00006517          	auipc	a0,0x6
    80005c14:	dc850513          	addi	a0,a0,-568 # 8000b9d8 <lockPrint>
    80005c18:	ffffb097          	auipc	ra,0xffffb
    80005c1c:	754080e7          	jalr	1876(ra) # 8000136c <copy_and_swap>
    80005c20:	fe0514e3          	bnez	a0,80005c08 <_Z9getStringPci+0x98>
    return buf;
}
    80005c24:	00098513          	mv	a0,s3
    80005c28:	02813083          	ld	ra,40(sp)
    80005c2c:	02013403          	ld	s0,32(sp)
    80005c30:	01813483          	ld	s1,24(sp)
    80005c34:	01013903          	ld	s2,16(sp)
    80005c38:	00813983          	ld	s3,8(sp)
    80005c3c:	00013a03          	ld	s4,0(sp)
    80005c40:	03010113          	addi	sp,sp,48
    80005c44:	00008067          	ret

0000000080005c48 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005c48:	ff010113          	addi	sp,sp,-16
    80005c4c:	00813423          	sd	s0,8(sp)
    80005c50:	01010413          	addi	s0,sp,16
    80005c54:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005c58:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005c5c:	0006c603          	lbu	a2,0(a3)
    80005c60:	fd06071b          	addiw	a4,a2,-48
    80005c64:	0ff77713          	andi	a4,a4,255
    80005c68:	00900793          	li	a5,9
    80005c6c:	02e7e063          	bltu	a5,a4,80005c8c <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005c70:	0025179b          	slliw	a5,a0,0x2
    80005c74:	00a787bb          	addw	a5,a5,a0
    80005c78:	0017979b          	slliw	a5,a5,0x1
    80005c7c:	00168693          	addi	a3,a3,1
    80005c80:	00c787bb          	addw	a5,a5,a2
    80005c84:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    80005c88:	fd5ff06f          	j	80005c5c <_Z11stringToIntPKc+0x14>
    return n;
}
    80005c8c:	00813403          	ld	s0,8(sp)
    80005c90:	01010113          	addi	sp,sp,16
    80005c94:	00008067          	ret

0000000080005c98 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    80005c98:	fc010113          	addi	sp,sp,-64
    80005c9c:	02113c23          	sd	ra,56(sp)
    80005ca0:	02813823          	sd	s0,48(sp)
    80005ca4:	02913423          	sd	s1,40(sp)
    80005ca8:	03213023          	sd	s2,32(sp)
    80005cac:	01313c23          	sd	s3,24(sp)
    80005cb0:	04010413          	addi	s0,sp,64
    80005cb4:	00050493          	mv	s1,a0
    80005cb8:	00058913          	mv	s2,a1
    80005cbc:	00060993          	mv	s3,a2
    LOCK();
    80005cc0:	00100613          	li	a2,1
    80005cc4:	00000593          	li	a1,0
    80005cc8:	00006517          	auipc	a0,0x6
    80005ccc:	d1050513          	addi	a0,a0,-752 # 8000b9d8 <lockPrint>
    80005cd0:	ffffb097          	auipc	ra,0xffffb
    80005cd4:	69c080e7          	jalr	1692(ra) # 8000136c <copy_and_swap>
    80005cd8:	00050863          	beqz	a0,80005ce8 <_Z8printIntiii+0x50>
    80005cdc:	ffffb097          	auipc	ra,0xffffb
    80005ce0:	7e8080e7          	jalr	2024(ra) # 800014c4 <_Z15thread_dispatchv>
    80005ce4:	fddff06f          	j	80005cc0 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005ce8:	00098463          	beqz	s3,80005cf0 <_Z8printIntiii+0x58>
    80005cec:	0804c463          	bltz	s1,80005d74 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005cf0:	0004851b          	sext.w	a0,s1
    neg = 0;
    80005cf4:	00000593          	li	a1,0
    }

    i = 0;
    80005cf8:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005cfc:	0009079b          	sext.w	a5,s2
    80005d00:	0325773b          	remuw	a4,a0,s2
    80005d04:	00048613          	mv	a2,s1
    80005d08:	0014849b          	addiw	s1,s1,1
    80005d0c:	02071693          	slli	a3,a4,0x20
    80005d10:	0206d693          	srli	a3,a3,0x20
    80005d14:	00006717          	auipc	a4,0x6
    80005d18:	b7c70713          	addi	a4,a4,-1156 # 8000b890 <digits>
    80005d1c:	00d70733          	add	a4,a4,a3
    80005d20:	00074683          	lbu	a3,0(a4)
    80005d24:	fd040713          	addi	a4,s0,-48
    80005d28:	00c70733          	add	a4,a4,a2
    80005d2c:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005d30:	0005071b          	sext.w	a4,a0
    80005d34:	0325553b          	divuw	a0,a0,s2
    80005d38:	fcf772e3          	bgeu	a4,a5,80005cfc <_Z8printIntiii+0x64>
    if(neg)
    80005d3c:	00058c63          	beqz	a1,80005d54 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005d40:	fd040793          	addi	a5,s0,-48
    80005d44:	009784b3          	add	s1,a5,s1
    80005d48:	02d00793          	li	a5,45
    80005d4c:	fef48823          	sb	a5,-16(s1)
    80005d50:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005d54:	fff4849b          	addiw	s1,s1,-1
    80005d58:	0204c463          	bltz	s1,80005d80 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005d5c:	fd040793          	addi	a5,s0,-48
    80005d60:	009787b3          	add	a5,a5,s1
    80005d64:	ff07c503          	lbu	a0,-16(a5)
    80005d68:	ffffc097          	auipc	ra,0xffffc
    80005d6c:	900080e7          	jalr	-1792(ra) # 80001668 <_Z4putcc>
    80005d70:	fe5ff06f          	j	80005d54 <_Z8printIntiii+0xbc>
        x = -xx;
    80005d74:	4090053b          	negw	a0,s1
        neg = 1;
    80005d78:	00100593          	li	a1,1
        x = -xx;
    80005d7c:	f7dff06f          	j	80005cf8 <_Z8printIntiii+0x60>

    UNLOCK();
    80005d80:	00000613          	li	a2,0
    80005d84:	00100593          	li	a1,1
    80005d88:	00006517          	auipc	a0,0x6
    80005d8c:	c5050513          	addi	a0,a0,-944 # 8000b9d8 <lockPrint>
    80005d90:	ffffb097          	auipc	ra,0xffffb
    80005d94:	5dc080e7          	jalr	1500(ra) # 8000136c <copy_and_swap>
    80005d98:	fe0514e3          	bnez	a0,80005d80 <_Z8printIntiii+0xe8>
    80005d9c:	03813083          	ld	ra,56(sp)
    80005da0:	03013403          	ld	s0,48(sp)
    80005da4:	02813483          	ld	s1,40(sp)
    80005da8:	02013903          	ld	s2,32(sp)
    80005dac:	01813983          	ld	s3,24(sp)
    80005db0:	04010113          	addi	sp,sp,64
    80005db4:	00008067          	ret

0000000080005db8 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005db8:	fd010113          	addi	sp,sp,-48
    80005dbc:	02113423          	sd	ra,40(sp)
    80005dc0:	02813023          	sd	s0,32(sp)
    80005dc4:	00913c23          	sd	s1,24(sp)
    80005dc8:	01213823          	sd	s2,16(sp)
    80005dcc:	01313423          	sd	s3,8(sp)
    80005dd0:	03010413          	addi	s0,sp,48
    80005dd4:	00050493          	mv	s1,a0
    80005dd8:	00058913          	mv	s2,a1
    80005ddc:	0015879b          	addiw	a5,a1,1
    80005de0:	0007851b          	sext.w	a0,a5
    80005de4:	00f4a023          	sw	a5,0(s1)
    80005de8:	0004a823          	sw	zero,16(s1)
    80005dec:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005df0:	00251513          	slli	a0,a0,0x2
    80005df4:	ffffb097          	auipc	ra,0xffffb
    80005df8:	598080e7          	jalr	1432(ra) # 8000138c <_Z9mem_allocm>
    80005dfc:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005e00:	01000513          	li	a0,16
    80005e04:	ffffc097          	auipc	ra,0xffffc
    80005e08:	604080e7          	jalr	1540(ra) # 80002408 <_Znwm>
    80005e0c:	00050993          	mv	s3,a0
    80005e10:	00000593          	li	a1,0
    80005e14:	ffffd097          	auipc	ra,0xffffd
    80005e18:	9e8080e7          	jalr	-1560(ra) # 800027fc <_ZN9SemaphoreC1Ej>
    80005e1c:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005e20:	01000513          	li	a0,16
    80005e24:	ffffc097          	auipc	ra,0xffffc
    80005e28:	5e4080e7          	jalr	1508(ra) # 80002408 <_Znwm>
    80005e2c:	00050993          	mv	s3,a0
    80005e30:	00090593          	mv	a1,s2
    80005e34:	ffffd097          	auipc	ra,0xffffd
    80005e38:	9c8080e7          	jalr	-1592(ra) # 800027fc <_ZN9SemaphoreC1Ej>
    80005e3c:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005e40:	01000513          	li	a0,16
    80005e44:	ffffc097          	auipc	ra,0xffffc
    80005e48:	5c4080e7          	jalr	1476(ra) # 80002408 <_Znwm>
    80005e4c:	00050913          	mv	s2,a0
    80005e50:	00100593          	li	a1,1
    80005e54:	ffffd097          	auipc	ra,0xffffd
    80005e58:	9a8080e7          	jalr	-1624(ra) # 800027fc <_ZN9SemaphoreC1Ej>
    80005e5c:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005e60:	01000513          	li	a0,16
    80005e64:	ffffc097          	auipc	ra,0xffffc
    80005e68:	5a4080e7          	jalr	1444(ra) # 80002408 <_Znwm>
    80005e6c:	00050913          	mv	s2,a0
    80005e70:	00100593          	li	a1,1
    80005e74:	ffffd097          	auipc	ra,0xffffd
    80005e78:	988080e7          	jalr	-1656(ra) # 800027fc <_ZN9SemaphoreC1Ej>
    80005e7c:	0324b823          	sd	s2,48(s1)
}
    80005e80:	02813083          	ld	ra,40(sp)
    80005e84:	02013403          	ld	s0,32(sp)
    80005e88:	01813483          	ld	s1,24(sp)
    80005e8c:	01013903          	ld	s2,16(sp)
    80005e90:	00813983          	ld	s3,8(sp)
    80005e94:	03010113          	addi	sp,sp,48
    80005e98:	00008067          	ret
    80005e9c:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005ea0:	00098513          	mv	a0,s3
    80005ea4:	ffffc097          	auipc	ra,0xffffc
    80005ea8:	5b4080e7          	jalr	1460(ra) # 80002458 <_ZdlPv>
    80005eac:	00048513          	mv	a0,s1
    80005eb0:	00007097          	auipc	ra,0x7
    80005eb4:	c08080e7          	jalr	-1016(ra) # 8000cab8 <_Unwind_Resume>
    80005eb8:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005ebc:	00098513          	mv	a0,s3
    80005ec0:	ffffc097          	auipc	ra,0xffffc
    80005ec4:	598080e7          	jalr	1432(ra) # 80002458 <_ZdlPv>
    80005ec8:	00048513          	mv	a0,s1
    80005ecc:	00007097          	auipc	ra,0x7
    80005ed0:	bec080e7          	jalr	-1044(ra) # 8000cab8 <_Unwind_Resume>
    80005ed4:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    80005ed8:	00090513          	mv	a0,s2
    80005edc:	ffffc097          	auipc	ra,0xffffc
    80005ee0:	57c080e7          	jalr	1404(ra) # 80002458 <_ZdlPv>
    80005ee4:	00048513          	mv	a0,s1
    80005ee8:	00007097          	auipc	ra,0x7
    80005eec:	bd0080e7          	jalr	-1072(ra) # 8000cab8 <_Unwind_Resume>
    80005ef0:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    80005ef4:	00090513          	mv	a0,s2
    80005ef8:	ffffc097          	auipc	ra,0xffffc
    80005efc:	560080e7          	jalr	1376(ra) # 80002458 <_ZdlPv>
    80005f00:	00048513          	mv	a0,s1
    80005f04:	00007097          	auipc	ra,0x7
    80005f08:	bb4080e7          	jalr	-1100(ra) # 8000cab8 <_Unwind_Resume>

0000000080005f0c <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005f0c:	fe010113          	addi	sp,sp,-32
    80005f10:	00113c23          	sd	ra,24(sp)
    80005f14:	00813823          	sd	s0,16(sp)
    80005f18:	00913423          	sd	s1,8(sp)
    80005f1c:	01213023          	sd	s2,0(sp)
    80005f20:	02010413          	addi	s0,sp,32
    80005f24:	00050493          	mv	s1,a0
    80005f28:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005f2c:	01853503          	ld	a0,24(a0)
    80005f30:	ffffd097          	auipc	ra,0xffffd
    80005f34:	904080e7          	jalr	-1788(ra) # 80002834 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005f38:	0304b503          	ld	a0,48(s1)
    80005f3c:	ffffd097          	auipc	ra,0xffffd
    80005f40:	8f8080e7          	jalr	-1800(ra) # 80002834 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    80005f44:	0084b783          	ld	a5,8(s1)
    80005f48:	0144a703          	lw	a4,20(s1)
    80005f4c:	00271713          	slli	a4,a4,0x2
    80005f50:	00e787b3          	add	a5,a5,a4
    80005f54:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005f58:	0144a783          	lw	a5,20(s1)
    80005f5c:	0017879b          	addiw	a5,a5,1
    80005f60:	0004a703          	lw	a4,0(s1)
    80005f64:	02e7e7bb          	remw	a5,a5,a4
    80005f68:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005f6c:	0304b503          	ld	a0,48(s1)
    80005f70:	ffffd097          	auipc	ra,0xffffd
    80005f74:	8f0080e7          	jalr	-1808(ra) # 80002860 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005f78:	0204b503          	ld	a0,32(s1)
    80005f7c:	ffffd097          	auipc	ra,0xffffd
    80005f80:	8e4080e7          	jalr	-1820(ra) # 80002860 <_ZN9Semaphore6signalEv>

}
    80005f84:	01813083          	ld	ra,24(sp)
    80005f88:	01013403          	ld	s0,16(sp)
    80005f8c:	00813483          	ld	s1,8(sp)
    80005f90:	00013903          	ld	s2,0(sp)
    80005f94:	02010113          	addi	sp,sp,32
    80005f98:	00008067          	ret

0000000080005f9c <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005f9c:	fe010113          	addi	sp,sp,-32
    80005fa0:	00113c23          	sd	ra,24(sp)
    80005fa4:	00813823          	sd	s0,16(sp)
    80005fa8:	00913423          	sd	s1,8(sp)
    80005fac:	01213023          	sd	s2,0(sp)
    80005fb0:	02010413          	addi	s0,sp,32
    80005fb4:	00050493          	mv	s1,a0
    itemAvailable->wait();
    80005fb8:	02053503          	ld	a0,32(a0)
    80005fbc:	ffffd097          	auipc	ra,0xffffd
    80005fc0:	878080e7          	jalr	-1928(ra) # 80002834 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005fc4:	0284b503          	ld	a0,40(s1)
    80005fc8:	ffffd097          	auipc	ra,0xffffd
    80005fcc:	86c080e7          	jalr	-1940(ra) # 80002834 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005fd0:	0084b703          	ld	a4,8(s1)
    80005fd4:	0104a783          	lw	a5,16(s1)
    80005fd8:	00279693          	slli	a3,a5,0x2
    80005fdc:	00d70733          	add	a4,a4,a3
    80005fe0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005fe4:	0017879b          	addiw	a5,a5,1
    80005fe8:	0004a703          	lw	a4,0(s1)
    80005fec:	02e7e7bb          	remw	a5,a5,a4
    80005ff0:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    80005ff4:	0284b503          	ld	a0,40(s1)
    80005ff8:	ffffd097          	auipc	ra,0xffffd
    80005ffc:	868080e7          	jalr	-1944(ra) # 80002860 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80006000:	0184b503          	ld	a0,24(s1)
    80006004:	ffffd097          	auipc	ra,0xffffd
    80006008:	85c080e7          	jalr	-1956(ra) # 80002860 <_ZN9Semaphore6signalEv>

    return ret;
}
    8000600c:	00090513          	mv	a0,s2
    80006010:	01813083          	ld	ra,24(sp)
    80006014:	01013403          	ld	s0,16(sp)
    80006018:	00813483          	ld	s1,8(sp)
    8000601c:	00013903          	ld	s2,0(sp)
    80006020:	02010113          	addi	sp,sp,32
    80006024:	00008067          	ret

0000000080006028 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80006028:	fe010113          	addi	sp,sp,-32
    8000602c:	00113c23          	sd	ra,24(sp)
    80006030:	00813823          	sd	s0,16(sp)
    80006034:	00913423          	sd	s1,8(sp)
    80006038:	01213023          	sd	s2,0(sp)
    8000603c:	02010413          	addi	s0,sp,32
    80006040:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    80006044:	02853503          	ld	a0,40(a0)
    80006048:	ffffc097          	auipc	ra,0xffffc
    8000604c:	7ec080e7          	jalr	2028(ra) # 80002834 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80006050:	0304b503          	ld	a0,48(s1)
    80006054:	ffffc097          	auipc	ra,0xffffc
    80006058:	7e0080e7          	jalr	2016(ra) # 80002834 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    8000605c:	0144a783          	lw	a5,20(s1)
    80006060:	0104a903          	lw	s2,16(s1)
    80006064:	0327ce63          	blt	a5,s2,800060a0 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80006068:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    8000606c:	0304b503          	ld	a0,48(s1)
    80006070:	ffffc097          	auipc	ra,0xffffc
    80006074:	7f0080e7          	jalr	2032(ra) # 80002860 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80006078:	0284b503          	ld	a0,40(s1)
    8000607c:	ffffc097          	auipc	ra,0xffffc
    80006080:	7e4080e7          	jalr	2020(ra) # 80002860 <_ZN9Semaphore6signalEv>

    return ret;
}
    80006084:	00090513          	mv	a0,s2
    80006088:	01813083          	ld	ra,24(sp)
    8000608c:	01013403          	ld	s0,16(sp)
    80006090:	00813483          	ld	s1,8(sp)
    80006094:	00013903          	ld	s2,0(sp)
    80006098:	02010113          	addi	sp,sp,32
    8000609c:	00008067          	ret
        ret = cap - head + tail;
    800060a0:	0004a703          	lw	a4,0(s1)
    800060a4:	4127093b          	subw	s2,a4,s2
    800060a8:	00f9093b          	addw	s2,s2,a5
    800060ac:	fc1ff06f          	j	8000606c <_ZN9BufferCPP6getCntEv+0x44>

00000000800060b0 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800060b0:	fe010113          	addi	sp,sp,-32
    800060b4:	00113c23          	sd	ra,24(sp)
    800060b8:	00813823          	sd	s0,16(sp)
    800060bc:	00913423          	sd	s1,8(sp)
    800060c0:	02010413          	addi	s0,sp,32
    800060c4:	00050493          	mv	s1,a0
    Console::putc('\n');
    800060c8:	00a00513          	li	a0,10
    800060cc:	ffffc097          	auipc	ra,0xffffc
    800060d0:	7e8080e7          	jalr	2024(ra) # 800028b4 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800060d4:	00003517          	auipc	a0,0x3
    800060d8:	24450513          	addi	a0,a0,580 # 80009318 <_ZZ18kernelPrintIntegermE6digits+0x2f8>
    800060dc:	00000097          	auipc	ra,0x0
    800060e0:	a0c080e7          	jalr	-1524(ra) # 80005ae8 <_Z11printStringPKc>
    while (getCnt()) {
    800060e4:	00048513          	mv	a0,s1
    800060e8:	00000097          	auipc	ra,0x0
    800060ec:	f40080e7          	jalr	-192(ra) # 80006028 <_ZN9BufferCPP6getCntEv>
    800060f0:	02050c63          	beqz	a0,80006128 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800060f4:	0084b783          	ld	a5,8(s1)
    800060f8:	0104a703          	lw	a4,16(s1)
    800060fc:	00271713          	slli	a4,a4,0x2
    80006100:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80006104:	0007c503          	lbu	a0,0(a5)
    80006108:	ffffc097          	auipc	ra,0xffffc
    8000610c:	7ac080e7          	jalr	1964(ra) # 800028b4 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80006110:	0104a783          	lw	a5,16(s1)
    80006114:	0017879b          	addiw	a5,a5,1
    80006118:	0004a703          	lw	a4,0(s1)
    8000611c:	02e7e7bb          	remw	a5,a5,a4
    80006120:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80006124:	fc1ff06f          	j	800060e4 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80006128:	02100513          	li	a0,33
    8000612c:	ffffc097          	auipc	ra,0xffffc
    80006130:	788080e7          	jalr	1928(ra) # 800028b4 <_ZN7Console4putcEc>
    Console::putc('\n');
    80006134:	00a00513          	li	a0,10
    80006138:	ffffc097          	auipc	ra,0xffffc
    8000613c:	77c080e7          	jalr	1916(ra) # 800028b4 <_ZN7Console4putcEc>
    mem_free(buffer);
    80006140:	0084b503          	ld	a0,8(s1)
    80006144:	ffffb097          	auipc	ra,0xffffb
    80006148:	28c080e7          	jalr	652(ra) # 800013d0 <_Z8mem_freePv>
    delete itemAvailable;
    8000614c:	0204b503          	ld	a0,32(s1)
    80006150:	00050863          	beqz	a0,80006160 <_ZN9BufferCPPD1Ev+0xb0>
    80006154:	00053783          	ld	a5,0(a0)
    80006158:	0087b783          	ld	a5,8(a5)
    8000615c:	000780e7          	jalr	a5
    delete spaceAvailable;
    80006160:	0184b503          	ld	a0,24(s1)
    80006164:	00050863          	beqz	a0,80006174 <_ZN9BufferCPPD1Ev+0xc4>
    80006168:	00053783          	ld	a5,0(a0)
    8000616c:	0087b783          	ld	a5,8(a5)
    80006170:	000780e7          	jalr	a5
    delete mutexTail;
    80006174:	0304b503          	ld	a0,48(s1)
    80006178:	00050863          	beqz	a0,80006188 <_ZN9BufferCPPD1Ev+0xd8>
    8000617c:	00053783          	ld	a5,0(a0)
    80006180:	0087b783          	ld	a5,8(a5)
    80006184:	000780e7          	jalr	a5
    delete mutexHead;
    80006188:	0284b503          	ld	a0,40(s1)
    8000618c:	00050863          	beqz	a0,8000619c <_ZN9BufferCPPD1Ev+0xec>
    80006190:	00053783          	ld	a5,0(a0)
    80006194:	0087b783          	ld	a5,8(a5)
    80006198:	000780e7          	jalr	a5
}
    8000619c:	01813083          	ld	ra,24(sp)
    800061a0:	01013403          	ld	s0,16(sp)
    800061a4:	00813483          	ld	s1,8(sp)
    800061a8:	02010113          	addi	sp,sp,32
    800061ac:	00008067          	ret

00000000800061b0 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    800061b0:	fe010113          	addi	sp,sp,-32
    800061b4:	00113c23          	sd	ra,24(sp)
    800061b8:	00813823          	sd	s0,16(sp)
    800061bc:	00913423          	sd	s1,8(sp)
    800061c0:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    800061c4:	00003517          	auipc	a0,0x3
    800061c8:	16c50513          	addi	a0,a0,364 # 80009330 <_ZZ18kernelPrintIntegermE6digits+0x310>
    800061cc:	00000097          	auipc	ra,0x0
    800061d0:	91c080e7          	jalr	-1764(ra) # 80005ae8 <_Z11printStringPKc>
    int test = getc() - '0';
    800061d4:	ffffb097          	auipc	ra,0xffffb
    800061d8:	460080e7          	jalr	1120(ra) # 80001634 <_Z4getcv>
    800061dc:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    800061e0:	ffffb097          	auipc	ra,0xffffb
    800061e4:	454080e7          	jalr	1108(ra) # 80001634 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    800061e8:	00700793          	li	a5,7
    800061ec:	1097e263          	bltu	a5,s1,800062f0 <_Z8userMainv+0x140>
    800061f0:	00249493          	slli	s1,s1,0x2
    800061f4:	00003717          	auipc	a4,0x3
    800061f8:	39470713          	addi	a4,a4,916 # 80009588 <_ZZ18kernelPrintIntegermE6digits+0x568>
    800061fc:	00e484b3          	add	s1,s1,a4
    80006200:	0004a783          	lw	a5,0(s1)
    80006204:	00e787b3          	add	a5,a5,a4
    80006208:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    8000620c:	fffff097          	auipc	ra,0xfffff
    80006210:	f54080e7          	jalr	-172(ra) # 80005160 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80006214:	00003517          	auipc	a0,0x3
    80006218:	13c50513          	addi	a0,a0,316 # 80009350 <_ZZ18kernelPrintIntegermE6digits+0x330>
    8000621c:	00000097          	auipc	ra,0x0
    80006220:	8cc080e7          	jalr	-1844(ra) # 80005ae8 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80006224:	01813083          	ld	ra,24(sp)
    80006228:	01013403          	ld	s0,16(sp)
    8000622c:	00813483          	ld	s1,8(sp)
    80006230:	02010113          	addi	sp,sp,32
    80006234:	00008067          	ret
            Threads_CPP_API_test();
    80006238:	ffffe097          	auipc	ra,0xffffe
    8000623c:	e08080e7          	jalr	-504(ra) # 80004040 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80006240:	00003517          	auipc	a0,0x3
    80006244:	15050513          	addi	a0,a0,336 # 80009390 <_ZZ18kernelPrintIntegermE6digits+0x370>
    80006248:	00000097          	auipc	ra,0x0
    8000624c:	8a0080e7          	jalr	-1888(ra) # 80005ae8 <_Z11printStringPKc>
            break;
    80006250:	fd5ff06f          	j	80006224 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80006254:	ffffd097          	auipc	ra,0xffffd
    80006258:	640080e7          	jalr	1600(ra) # 80003894 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    8000625c:	00003517          	auipc	a0,0x3
    80006260:	17450513          	addi	a0,a0,372 # 800093d0 <_ZZ18kernelPrintIntegermE6digits+0x3b0>
    80006264:	00000097          	auipc	ra,0x0
    80006268:	884080e7          	jalr	-1916(ra) # 80005ae8 <_Z11printStringPKc>
            break;
    8000626c:	fb9ff06f          	j	80006224 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80006270:	fffff097          	auipc	ra,0xfffff
    80006274:	234080e7          	jalr	564(ra) # 800054a4 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80006278:	00003517          	auipc	a0,0x3
    8000627c:	1a850513          	addi	a0,a0,424 # 80009420 <_ZZ18kernelPrintIntegermE6digits+0x400>
    80006280:	00000097          	auipc	ra,0x0
    80006284:	868080e7          	jalr	-1944(ra) # 80005ae8 <_Z11printStringPKc>
            break;
    80006288:	f9dff06f          	j	80006224 <_Z8userMainv+0x74>
            testSleeping();
    8000628c:	00000097          	auipc	ra,0x0
    80006290:	11c080e7          	jalr	284(ra) # 800063a8 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80006294:	00003517          	auipc	a0,0x3
    80006298:	1e450513          	addi	a0,a0,484 # 80009478 <_ZZ18kernelPrintIntegermE6digits+0x458>
    8000629c:	00000097          	auipc	ra,0x0
    800062a0:	84c080e7          	jalr	-1972(ra) # 80005ae8 <_Z11printStringPKc>
            break;
    800062a4:	f81ff06f          	j	80006224 <_Z8userMainv+0x74>
            testConsumerProducer();
    800062a8:	ffffe097          	auipc	ra,0xffffe
    800062ac:	258080e7          	jalr	600(ra) # 80004500 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    800062b0:	00003517          	auipc	a0,0x3
    800062b4:	1f850513          	addi	a0,a0,504 # 800094a8 <_ZZ18kernelPrintIntegermE6digits+0x488>
    800062b8:	00000097          	auipc	ra,0x0
    800062bc:	830080e7          	jalr	-2000(ra) # 80005ae8 <_Z11printStringPKc>
            break;
    800062c0:	f65ff06f          	j	80006224 <_Z8userMainv+0x74>
            System_Mode_test();
    800062c4:	00000097          	auipc	ra,0x0
    800062c8:	658080e7          	jalr	1624(ra) # 8000691c <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    800062cc:	00003517          	auipc	a0,0x3
    800062d0:	21c50513          	addi	a0,a0,540 # 800094e8 <_ZZ18kernelPrintIntegermE6digits+0x4c8>
    800062d4:	00000097          	auipc	ra,0x0
    800062d8:	814080e7          	jalr	-2028(ra) # 80005ae8 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    800062dc:	00003517          	auipc	a0,0x3
    800062e0:	22c50513          	addi	a0,a0,556 # 80009508 <_ZZ18kernelPrintIntegermE6digits+0x4e8>
    800062e4:	00000097          	auipc	ra,0x0
    800062e8:	804080e7          	jalr	-2044(ra) # 80005ae8 <_Z11printStringPKc>
            break;
    800062ec:	f39ff06f          	j	80006224 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800062f0:	00003517          	auipc	a0,0x3
    800062f4:	27050513          	addi	a0,a0,624 # 80009560 <_ZZ18kernelPrintIntegermE6digits+0x540>
    800062f8:	fffff097          	auipc	ra,0xfffff
    800062fc:	7f0080e7          	jalr	2032(ra) # 80005ae8 <_Z11printStringPKc>
    80006300:	f25ff06f          	j	80006224 <_Z8userMainv+0x74>

0000000080006304 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80006304:	fe010113          	addi	sp,sp,-32
    80006308:	00113c23          	sd	ra,24(sp)
    8000630c:	00813823          	sd	s0,16(sp)
    80006310:	00913423          	sd	s1,8(sp)
    80006314:	01213023          	sd	s2,0(sp)
    80006318:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    8000631c:	00053903          	ld	s2,0(a0)
    int i = 6;
    80006320:	00600493          	li	s1,6
    while (--i > 0) {
    80006324:	fff4849b          	addiw	s1,s1,-1
    80006328:	04905463          	blez	s1,80006370 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    8000632c:	00003517          	auipc	a0,0x3
    80006330:	27c50513          	addi	a0,a0,636 # 800095a8 <_ZZ18kernelPrintIntegermE6digits+0x588>
    80006334:	fffff097          	auipc	ra,0xfffff
    80006338:	7b4080e7          	jalr	1972(ra) # 80005ae8 <_Z11printStringPKc>
        printInt(sleep_time);
    8000633c:	00000613          	li	a2,0
    80006340:	00a00593          	li	a1,10
    80006344:	0009051b          	sext.w	a0,s2
    80006348:	00000097          	auipc	ra,0x0
    8000634c:	950080e7          	jalr	-1712(ra) # 80005c98 <_Z8printIntiii>
        printString(" !\n");
    80006350:	00003517          	auipc	a0,0x3
    80006354:	26050513          	addi	a0,a0,608 # 800095b0 <_ZZ18kernelPrintIntegermE6digits+0x590>
    80006358:	fffff097          	auipc	ra,0xfffff
    8000635c:	790080e7          	jalr	1936(ra) # 80005ae8 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80006360:	00090513          	mv	a0,s2
    80006364:	ffffb097          	auipc	ra,0xffffb
    80006368:	298080e7          	jalr	664(ra) # 800015fc <_Z10time_sleepm>
    while (--i > 0) {
    8000636c:	fb9ff06f          	j	80006324 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80006370:	00a00793          	li	a5,10
    80006374:	02f95933          	divu	s2,s2,a5
    80006378:	fff90913          	addi	s2,s2,-1
    8000637c:	00005797          	auipc	a5,0x5
    80006380:	66478793          	addi	a5,a5,1636 # 8000b9e0 <_ZL8finished>
    80006384:	01278933          	add	s2,a5,s2
    80006388:	00100793          	li	a5,1
    8000638c:	00f90023          	sb	a5,0(s2)
}
    80006390:	01813083          	ld	ra,24(sp)
    80006394:	01013403          	ld	s0,16(sp)
    80006398:	00813483          	ld	s1,8(sp)
    8000639c:	00013903          	ld	s2,0(sp)
    800063a0:	02010113          	addi	sp,sp,32
    800063a4:	00008067          	ret

00000000800063a8 <_Z12testSleepingv>:

void testSleeping() {
    800063a8:	fc010113          	addi	sp,sp,-64
    800063ac:	02113c23          	sd	ra,56(sp)
    800063b0:	02813823          	sd	s0,48(sp)
    800063b4:	02913423          	sd	s1,40(sp)
    800063b8:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    800063bc:	00a00793          	li	a5,10
    800063c0:	fcf43823          	sd	a5,-48(s0)
    800063c4:	01400793          	li	a5,20
    800063c8:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    800063cc:	00000493          	li	s1,0
    800063d0:	02c0006f          	j	800063fc <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    800063d4:	00349793          	slli	a5,s1,0x3
    800063d8:	fd040613          	addi	a2,s0,-48
    800063dc:	00f60633          	add	a2,a2,a5
    800063e0:	00000597          	auipc	a1,0x0
    800063e4:	f2458593          	addi	a1,a1,-220 # 80006304 <_ZL9sleepyRunPv>
    800063e8:	fc040513          	addi	a0,s0,-64
    800063ec:	00f50533          	add	a0,a0,a5
    800063f0:	ffffb097          	auipc	ra,0xffffb
    800063f4:	018080e7          	jalr	24(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800063f8:	0014849b          	addiw	s1,s1,1
    800063fc:	00100793          	li	a5,1
    80006400:	fc97dae3          	bge	a5,s1,800063d4 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80006404:	00005797          	auipc	a5,0x5
    80006408:	5dc7c783          	lbu	a5,1500(a5) # 8000b9e0 <_ZL8finished>
    8000640c:	fe078ce3          	beqz	a5,80006404 <_Z12testSleepingv+0x5c>
    80006410:	00005797          	auipc	a5,0x5
    80006414:	5d17c783          	lbu	a5,1489(a5) # 8000b9e1 <_ZL8finished+0x1>
    80006418:	fe0786e3          	beqz	a5,80006404 <_Z12testSleepingv+0x5c>
}
    8000641c:	03813083          	ld	ra,56(sp)
    80006420:	03013403          	ld	s0,48(sp)
    80006424:	02813483          	ld	s1,40(sp)
    80006428:	04010113          	addi	sp,sp,64
    8000642c:	00008067          	ret

0000000080006430 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80006430:	fe010113          	addi	sp,sp,-32
    80006434:	00113c23          	sd	ra,24(sp)
    80006438:	00813823          	sd	s0,16(sp)
    8000643c:	00913423          	sd	s1,8(sp)
    80006440:	01213023          	sd	s2,0(sp)
    80006444:	02010413          	addi	s0,sp,32
    80006448:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    8000644c:	00100793          	li	a5,1
    80006450:	02a7f863          	bgeu	a5,a0,80006480 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80006454:	00a00793          	li	a5,10
    80006458:	02f577b3          	remu	a5,a0,a5
    8000645c:	02078e63          	beqz	a5,80006498 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80006460:	fff48513          	addi	a0,s1,-1
    80006464:	00000097          	auipc	ra,0x0
    80006468:	fcc080e7          	jalr	-52(ra) # 80006430 <_ZL9fibonaccim>
    8000646c:	00050913          	mv	s2,a0
    80006470:	ffe48513          	addi	a0,s1,-2
    80006474:	00000097          	auipc	ra,0x0
    80006478:	fbc080e7          	jalr	-68(ra) # 80006430 <_ZL9fibonaccim>
    8000647c:	00a90533          	add	a0,s2,a0
}
    80006480:	01813083          	ld	ra,24(sp)
    80006484:	01013403          	ld	s0,16(sp)
    80006488:	00813483          	ld	s1,8(sp)
    8000648c:	00013903          	ld	s2,0(sp)
    80006490:	02010113          	addi	sp,sp,32
    80006494:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80006498:	ffffb097          	auipc	ra,0xffffb
    8000649c:	02c080e7          	jalr	44(ra) # 800014c4 <_Z15thread_dispatchv>
    800064a0:	fc1ff06f          	j	80006460 <_ZL9fibonaccim+0x30>

00000000800064a4 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800064a4:	fe010113          	addi	sp,sp,-32
    800064a8:	00113c23          	sd	ra,24(sp)
    800064ac:	00813823          	sd	s0,16(sp)
    800064b0:	00913423          	sd	s1,8(sp)
    800064b4:	01213023          	sd	s2,0(sp)
    800064b8:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800064bc:	00a00493          	li	s1,10
    800064c0:	0400006f          	j	80006500 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800064c4:	00003517          	auipc	a0,0x3
    800064c8:	dbc50513          	addi	a0,a0,-580 # 80009280 <_ZZ18kernelPrintIntegermE6digits+0x260>
    800064cc:	fffff097          	auipc	ra,0xfffff
    800064d0:	61c080e7          	jalr	1564(ra) # 80005ae8 <_Z11printStringPKc>
    800064d4:	00000613          	li	a2,0
    800064d8:	00a00593          	li	a1,10
    800064dc:	00048513          	mv	a0,s1
    800064e0:	fffff097          	auipc	ra,0xfffff
    800064e4:	7b8080e7          	jalr	1976(ra) # 80005c98 <_Z8printIntiii>
    800064e8:	00003517          	auipc	a0,0x3
    800064ec:	f8850513          	addi	a0,a0,-120 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    800064f0:	fffff097          	auipc	ra,0xfffff
    800064f4:	5f8080e7          	jalr	1528(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 13; i++) {
    800064f8:	0014849b          	addiw	s1,s1,1
    800064fc:	0ff4f493          	andi	s1,s1,255
    80006500:	00c00793          	li	a5,12
    80006504:	fc97f0e3          	bgeu	a5,s1,800064c4 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80006508:	00003517          	auipc	a0,0x3
    8000650c:	d8050513          	addi	a0,a0,-640 # 80009288 <_ZZ18kernelPrintIntegermE6digits+0x268>
    80006510:	fffff097          	auipc	ra,0xfffff
    80006514:	5d8080e7          	jalr	1496(ra) # 80005ae8 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80006518:	00500313          	li	t1,5
    thread_dispatch();
    8000651c:	ffffb097          	auipc	ra,0xffffb
    80006520:	fa8080e7          	jalr	-88(ra) # 800014c4 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80006524:	01000513          	li	a0,16
    80006528:	00000097          	auipc	ra,0x0
    8000652c:	f08080e7          	jalr	-248(ra) # 80006430 <_ZL9fibonaccim>
    80006530:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80006534:	00003517          	auipc	a0,0x3
    80006538:	d6450513          	addi	a0,a0,-668 # 80009298 <_ZZ18kernelPrintIntegermE6digits+0x278>
    8000653c:	fffff097          	auipc	ra,0xfffff
    80006540:	5ac080e7          	jalr	1452(ra) # 80005ae8 <_Z11printStringPKc>
    80006544:	00000613          	li	a2,0
    80006548:	00a00593          	li	a1,10
    8000654c:	0009051b          	sext.w	a0,s2
    80006550:	fffff097          	auipc	ra,0xfffff
    80006554:	748080e7          	jalr	1864(ra) # 80005c98 <_Z8printIntiii>
    80006558:	00003517          	auipc	a0,0x3
    8000655c:	f1850513          	addi	a0,a0,-232 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80006560:	fffff097          	auipc	ra,0xfffff
    80006564:	588080e7          	jalr	1416(ra) # 80005ae8 <_Z11printStringPKc>
    80006568:	0400006f          	j	800065a8 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    8000656c:	00003517          	auipc	a0,0x3
    80006570:	d1450513          	addi	a0,a0,-748 # 80009280 <_ZZ18kernelPrintIntegermE6digits+0x260>
    80006574:	fffff097          	auipc	ra,0xfffff
    80006578:	574080e7          	jalr	1396(ra) # 80005ae8 <_Z11printStringPKc>
    8000657c:	00000613          	li	a2,0
    80006580:	00a00593          	li	a1,10
    80006584:	00048513          	mv	a0,s1
    80006588:	fffff097          	auipc	ra,0xfffff
    8000658c:	710080e7          	jalr	1808(ra) # 80005c98 <_Z8printIntiii>
    80006590:	00003517          	auipc	a0,0x3
    80006594:	ee050513          	addi	a0,a0,-288 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80006598:	fffff097          	auipc	ra,0xfffff
    8000659c:	550080e7          	jalr	1360(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 16; i++) {
    800065a0:	0014849b          	addiw	s1,s1,1
    800065a4:	0ff4f493          	andi	s1,s1,255
    800065a8:	00f00793          	li	a5,15
    800065ac:	fc97f0e3          	bgeu	a5,s1,8000656c <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800065b0:	00003517          	auipc	a0,0x3
    800065b4:	cf850513          	addi	a0,a0,-776 # 800092a8 <_ZZ18kernelPrintIntegermE6digits+0x288>
    800065b8:	fffff097          	auipc	ra,0xfffff
    800065bc:	530080e7          	jalr	1328(ra) # 80005ae8 <_Z11printStringPKc>
    finishedD = true;
    800065c0:	00100793          	li	a5,1
    800065c4:	00005717          	auipc	a4,0x5
    800065c8:	40f70f23          	sb	a5,1054(a4) # 8000b9e2 <_ZL9finishedD>
    thread_dispatch();
    800065cc:	ffffb097          	auipc	ra,0xffffb
    800065d0:	ef8080e7          	jalr	-264(ra) # 800014c4 <_Z15thread_dispatchv>
}
    800065d4:	01813083          	ld	ra,24(sp)
    800065d8:	01013403          	ld	s0,16(sp)
    800065dc:	00813483          	ld	s1,8(sp)
    800065e0:	00013903          	ld	s2,0(sp)
    800065e4:	02010113          	addi	sp,sp,32
    800065e8:	00008067          	ret

00000000800065ec <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800065ec:	fe010113          	addi	sp,sp,-32
    800065f0:	00113c23          	sd	ra,24(sp)
    800065f4:	00813823          	sd	s0,16(sp)
    800065f8:	00913423          	sd	s1,8(sp)
    800065fc:	01213023          	sd	s2,0(sp)
    80006600:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80006604:	00000493          	li	s1,0
    80006608:	0400006f          	j	80006648 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    8000660c:	00003517          	auipc	a0,0x3
    80006610:	c4450513          	addi	a0,a0,-956 # 80009250 <_ZZ18kernelPrintIntegermE6digits+0x230>
    80006614:	fffff097          	auipc	ra,0xfffff
    80006618:	4d4080e7          	jalr	1236(ra) # 80005ae8 <_Z11printStringPKc>
    8000661c:	00000613          	li	a2,0
    80006620:	00a00593          	li	a1,10
    80006624:	00048513          	mv	a0,s1
    80006628:	fffff097          	auipc	ra,0xfffff
    8000662c:	670080e7          	jalr	1648(ra) # 80005c98 <_Z8printIntiii>
    80006630:	00003517          	auipc	a0,0x3
    80006634:	e4050513          	addi	a0,a0,-448 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80006638:	fffff097          	auipc	ra,0xfffff
    8000663c:	4b0080e7          	jalr	1200(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80006640:	0014849b          	addiw	s1,s1,1
    80006644:	0ff4f493          	andi	s1,s1,255
    80006648:	00200793          	li	a5,2
    8000664c:	fc97f0e3          	bgeu	a5,s1,8000660c <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80006650:	00003517          	auipc	a0,0x3
    80006654:	c0850513          	addi	a0,a0,-1016 # 80009258 <_ZZ18kernelPrintIntegermE6digits+0x238>
    80006658:	fffff097          	auipc	ra,0xfffff
    8000665c:	490080e7          	jalr	1168(ra) # 80005ae8 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80006660:	00700313          	li	t1,7
    thread_dispatch();
    80006664:	ffffb097          	auipc	ra,0xffffb
    80006668:	e60080e7          	jalr	-416(ra) # 800014c4 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    8000666c:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80006670:	00003517          	auipc	a0,0x3
    80006674:	bf850513          	addi	a0,a0,-1032 # 80009268 <_ZZ18kernelPrintIntegermE6digits+0x248>
    80006678:	fffff097          	auipc	ra,0xfffff
    8000667c:	470080e7          	jalr	1136(ra) # 80005ae8 <_Z11printStringPKc>
    80006680:	00000613          	li	a2,0
    80006684:	00a00593          	li	a1,10
    80006688:	0009051b          	sext.w	a0,s2
    8000668c:	fffff097          	auipc	ra,0xfffff
    80006690:	60c080e7          	jalr	1548(ra) # 80005c98 <_Z8printIntiii>
    80006694:	00003517          	auipc	a0,0x3
    80006698:	ddc50513          	addi	a0,a0,-548 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    8000669c:	fffff097          	auipc	ra,0xfffff
    800066a0:	44c080e7          	jalr	1100(ra) # 80005ae8 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800066a4:	00c00513          	li	a0,12
    800066a8:	00000097          	auipc	ra,0x0
    800066ac:	d88080e7          	jalr	-632(ra) # 80006430 <_ZL9fibonaccim>
    800066b0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800066b4:	00003517          	auipc	a0,0x3
    800066b8:	bbc50513          	addi	a0,a0,-1092 # 80009270 <_ZZ18kernelPrintIntegermE6digits+0x250>
    800066bc:	fffff097          	auipc	ra,0xfffff
    800066c0:	42c080e7          	jalr	1068(ra) # 80005ae8 <_Z11printStringPKc>
    800066c4:	00000613          	li	a2,0
    800066c8:	00a00593          	li	a1,10
    800066cc:	0009051b          	sext.w	a0,s2
    800066d0:	fffff097          	auipc	ra,0xfffff
    800066d4:	5c8080e7          	jalr	1480(ra) # 80005c98 <_Z8printIntiii>
    800066d8:	00003517          	auipc	a0,0x3
    800066dc:	d9850513          	addi	a0,a0,-616 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    800066e0:	fffff097          	auipc	ra,0xfffff
    800066e4:	408080e7          	jalr	1032(ra) # 80005ae8 <_Z11printStringPKc>
    800066e8:	0400006f          	j	80006728 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800066ec:	00003517          	auipc	a0,0x3
    800066f0:	b6450513          	addi	a0,a0,-1180 # 80009250 <_ZZ18kernelPrintIntegermE6digits+0x230>
    800066f4:	fffff097          	auipc	ra,0xfffff
    800066f8:	3f4080e7          	jalr	1012(ra) # 80005ae8 <_Z11printStringPKc>
    800066fc:	00000613          	li	a2,0
    80006700:	00a00593          	li	a1,10
    80006704:	00048513          	mv	a0,s1
    80006708:	fffff097          	auipc	ra,0xfffff
    8000670c:	590080e7          	jalr	1424(ra) # 80005c98 <_Z8printIntiii>
    80006710:	00003517          	auipc	a0,0x3
    80006714:	d6050513          	addi	a0,a0,-672 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80006718:	fffff097          	auipc	ra,0xfffff
    8000671c:	3d0080e7          	jalr	976(ra) # 80005ae8 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006720:	0014849b          	addiw	s1,s1,1
    80006724:	0ff4f493          	andi	s1,s1,255
    80006728:	00500793          	li	a5,5
    8000672c:	fc97f0e3          	bgeu	a5,s1,800066ec <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006730:	00003517          	auipc	a0,0x3
    80006734:	af850513          	addi	a0,a0,-1288 # 80009228 <_ZZ18kernelPrintIntegermE6digits+0x208>
    80006738:	fffff097          	auipc	ra,0xfffff
    8000673c:	3b0080e7          	jalr	944(ra) # 80005ae8 <_Z11printStringPKc>
    finishedC = true;
    80006740:	00100793          	li	a5,1
    80006744:	00005717          	auipc	a4,0x5
    80006748:	28f70fa3          	sb	a5,671(a4) # 8000b9e3 <_ZL9finishedC>
    thread_dispatch();
    8000674c:	ffffb097          	auipc	ra,0xffffb
    80006750:	d78080e7          	jalr	-648(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80006754:	01813083          	ld	ra,24(sp)
    80006758:	01013403          	ld	s0,16(sp)
    8000675c:	00813483          	ld	s1,8(sp)
    80006760:	00013903          	ld	s2,0(sp)
    80006764:	02010113          	addi	sp,sp,32
    80006768:	00008067          	ret

000000008000676c <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    8000676c:	fe010113          	addi	sp,sp,-32
    80006770:	00113c23          	sd	ra,24(sp)
    80006774:	00813823          	sd	s0,16(sp)
    80006778:	00913423          	sd	s1,8(sp)
    8000677c:	01213023          	sd	s2,0(sp)
    80006780:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80006784:	00000913          	li	s2,0
    80006788:	0400006f          	j	800067c8 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    8000678c:	ffffb097          	auipc	ra,0xffffb
    80006790:	d38080e7          	jalr	-712(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006794:	00148493          	addi	s1,s1,1
    80006798:	000027b7          	lui	a5,0x2
    8000679c:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800067a0:	0097ee63          	bltu	a5,s1,800067bc <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800067a4:	00000713          	li	a4,0
    800067a8:	000077b7          	lui	a5,0x7
    800067ac:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800067b0:	fce7eee3          	bltu	a5,a4,8000678c <_ZL11workerBodyBPv+0x20>
    800067b4:	00170713          	addi	a4,a4,1
    800067b8:	ff1ff06f          	j	800067a8 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800067bc:	00a00793          	li	a5,10
    800067c0:	04f90663          	beq	s2,a5,8000680c <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800067c4:	00190913          	addi	s2,s2,1
    800067c8:	00f00793          	li	a5,15
    800067cc:	0527e463          	bltu	a5,s2,80006814 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800067d0:	00003517          	auipc	a0,0x3
    800067d4:	a6850513          	addi	a0,a0,-1432 # 80009238 <_ZZ18kernelPrintIntegermE6digits+0x218>
    800067d8:	fffff097          	auipc	ra,0xfffff
    800067dc:	310080e7          	jalr	784(ra) # 80005ae8 <_Z11printStringPKc>
    800067e0:	00000613          	li	a2,0
    800067e4:	00a00593          	li	a1,10
    800067e8:	0009051b          	sext.w	a0,s2
    800067ec:	fffff097          	auipc	ra,0xfffff
    800067f0:	4ac080e7          	jalr	1196(ra) # 80005c98 <_Z8printIntiii>
    800067f4:	00003517          	auipc	a0,0x3
    800067f8:	c7c50513          	addi	a0,a0,-900 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    800067fc:	fffff097          	auipc	ra,0xfffff
    80006800:	2ec080e7          	jalr	748(ra) # 80005ae8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80006804:	00000493          	li	s1,0
    80006808:	f91ff06f          	j	80006798 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    8000680c:	14102ff3          	csrr	t6,sepc
    80006810:	fb5ff06f          	j	800067c4 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80006814:	00003517          	auipc	a0,0x3
    80006818:	a2c50513          	addi	a0,a0,-1492 # 80009240 <_ZZ18kernelPrintIntegermE6digits+0x220>
    8000681c:	fffff097          	auipc	ra,0xfffff
    80006820:	2cc080e7          	jalr	716(ra) # 80005ae8 <_Z11printStringPKc>
    finishedB = true;
    80006824:	00100793          	li	a5,1
    80006828:	00005717          	auipc	a4,0x5
    8000682c:	1af70e23          	sb	a5,444(a4) # 8000b9e4 <_ZL9finishedB>
    thread_dispatch();
    80006830:	ffffb097          	auipc	ra,0xffffb
    80006834:	c94080e7          	jalr	-876(ra) # 800014c4 <_Z15thread_dispatchv>
}
    80006838:	01813083          	ld	ra,24(sp)
    8000683c:	01013403          	ld	s0,16(sp)
    80006840:	00813483          	ld	s1,8(sp)
    80006844:	00013903          	ld	s2,0(sp)
    80006848:	02010113          	addi	sp,sp,32
    8000684c:	00008067          	ret

0000000080006850 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006850:	fe010113          	addi	sp,sp,-32
    80006854:	00113c23          	sd	ra,24(sp)
    80006858:	00813823          	sd	s0,16(sp)
    8000685c:	00913423          	sd	s1,8(sp)
    80006860:	01213023          	sd	s2,0(sp)
    80006864:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006868:	00000913          	li	s2,0
    8000686c:	0380006f          	j	800068a4 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006870:	ffffb097          	auipc	ra,0xffffb
    80006874:	c54080e7          	jalr	-940(ra) # 800014c4 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006878:	00148493          	addi	s1,s1,1
    8000687c:	000027b7          	lui	a5,0x2
    80006880:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80006884:	0097ee63          	bltu	a5,s1,800068a0 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80006888:	00000713          	li	a4,0
    8000688c:	000077b7          	lui	a5,0x7
    80006890:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80006894:	fce7eee3          	bltu	a5,a4,80006870 <_ZL11workerBodyAPv+0x20>
    80006898:	00170713          	addi	a4,a4,1
    8000689c:	ff1ff06f          	j	8000688c <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800068a0:	00190913          	addi	s2,s2,1
    800068a4:	00900793          	li	a5,9
    800068a8:	0527e063          	bltu	a5,s2,800068e8 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800068ac:	00003517          	auipc	a0,0x3
    800068b0:	97450513          	addi	a0,a0,-1676 # 80009220 <_ZZ18kernelPrintIntegermE6digits+0x200>
    800068b4:	fffff097          	auipc	ra,0xfffff
    800068b8:	234080e7          	jalr	564(ra) # 80005ae8 <_Z11printStringPKc>
    800068bc:	00000613          	li	a2,0
    800068c0:	00a00593          	li	a1,10
    800068c4:	0009051b          	sext.w	a0,s2
    800068c8:	fffff097          	auipc	ra,0xfffff
    800068cc:	3d0080e7          	jalr	976(ra) # 80005c98 <_Z8printIntiii>
    800068d0:	00003517          	auipc	a0,0x3
    800068d4:	ba050513          	addi	a0,a0,-1120 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    800068d8:	fffff097          	auipc	ra,0xfffff
    800068dc:	210080e7          	jalr	528(ra) # 80005ae8 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800068e0:	00000493          	li	s1,0
    800068e4:	f99ff06f          	j	8000687c <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800068e8:	00003517          	auipc	a0,0x3
    800068ec:	94050513          	addi	a0,a0,-1728 # 80009228 <_ZZ18kernelPrintIntegermE6digits+0x208>
    800068f0:	fffff097          	auipc	ra,0xfffff
    800068f4:	1f8080e7          	jalr	504(ra) # 80005ae8 <_Z11printStringPKc>
    finishedA = true;
    800068f8:	00100793          	li	a5,1
    800068fc:	00005717          	auipc	a4,0x5
    80006900:	0ef704a3          	sb	a5,233(a4) # 8000b9e5 <_ZL9finishedA>
}
    80006904:	01813083          	ld	ra,24(sp)
    80006908:	01013403          	ld	s0,16(sp)
    8000690c:	00813483          	ld	s1,8(sp)
    80006910:	00013903          	ld	s2,0(sp)
    80006914:	02010113          	addi	sp,sp,32
    80006918:	00008067          	ret

000000008000691c <_Z16System_Mode_testv>:


void System_Mode_test() {
    8000691c:	fd010113          	addi	sp,sp,-48
    80006920:	02113423          	sd	ra,40(sp)
    80006924:	02813023          	sd	s0,32(sp)
    80006928:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    8000692c:	00000613          	li	a2,0
    80006930:	00000597          	auipc	a1,0x0
    80006934:	f2058593          	addi	a1,a1,-224 # 80006850 <_ZL11workerBodyAPv>
    80006938:	fd040513          	addi	a0,s0,-48
    8000693c:	ffffb097          	auipc	ra,0xffffb
    80006940:	acc080e7          	jalr	-1332(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80006944:	00003517          	auipc	a0,0x3
    80006948:	97450513          	addi	a0,a0,-1676 # 800092b8 <_ZZ18kernelPrintIntegermE6digits+0x298>
    8000694c:	fffff097          	auipc	ra,0xfffff
    80006950:	19c080e7          	jalr	412(ra) # 80005ae8 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80006954:	00000613          	li	a2,0
    80006958:	00000597          	auipc	a1,0x0
    8000695c:	e1458593          	addi	a1,a1,-492 # 8000676c <_ZL11workerBodyBPv>
    80006960:	fd840513          	addi	a0,s0,-40
    80006964:	ffffb097          	auipc	ra,0xffffb
    80006968:	aa4080e7          	jalr	-1372(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    8000696c:	00003517          	auipc	a0,0x3
    80006970:	96450513          	addi	a0,a0,-1692 # 800092d0 <_ZZ18kernelPrintIntegermE6digits+0x2b0>
    80006974:	fffff097          	auipc	ra,0xfffff
    80006978:	174080e7          	jalr	372(ra) # 80005ae8 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    8000697c:	00000613          	li	a2,0
    80006980:	00000597          	auipc	a1,0x0
    80006984:	c6c58593          	addi	a1,a1,-916 # 800065ec <_ZL11workerBodyCPv>
    80006988:	fe040513          	addi	a0,s0,-32
    8000698c:	ffffb097          	auipc	ra,0xffffb
    80006990:	a7c080e7          	jalr	-1412(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80006994:	00003517          	auipc	a0,0x3
    80006998:	95450513          	addi	a0,a0,-1708 # 800092e8 <_ZZ18kernelPrintIntegermE6digits+0x2c8>
    8000699c:	fffff097          	auipc	ra,0xfffff
    800069a0:	14c080e7          	jalr	332(ra) # 80005ae8 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800069a4:	00000613          	li	a2,0
    800069a8:	00000597          	auipc	a1,0x0
    800069ac:	afc58593          	addi	a1,a1,-1284 # 800064a4 <_ZL11workerBodyDPv>
    800069b0:	fe840513          	addi	a0,s0,-24
    800069b4:	ffffb097          	auipc	ra,0xffffb
    800069b8:	a54080e7          	jalr	-1452(ra) # 80001408 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800069bc:	00003517          	auipc	a0,0x3
    800069c0:	94450513          	addi	a0,a0,-1724 # 80009300 <_ZZ18kernelPrintIntegermE6digits+0x2e0>
    800069c4:	fffff097          	auipc	ra,0xfffff
    800069c8:	124080e7          	jalr	292(ra) # 80005ae8 <_Z11printStringPKc>
    800069cc:	00c0006f          	j	800069d8 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800069d0:	ffffb097          	auipc	ra,0xffffb
    800069d4:	af4080e7          	jalr	-1292(ra) # 800014c4 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800069d8:	00005797          	auipc	a5,0x5
    800069dc:	00d7c783          	lbu	a5,13(a5) # 8000b9e5 <_ZL9finishedA>
    800069e0:	fe0788e3          	beqz	a5,800069d0 <_Z16System_Mode_testv+0xb4>
    800069e4:	00005797          	auipc	a5,0x5
    800069e8:	0007c783          	lbu	a5,0(a5) # 8000b9e4 <_ZL9finishedB>
    800069ec:	fe0782e3          	beqz	a5,800069d0 <_Z16System_Mode_testv+0xb4>
    800069f0:	00005797          	auipc	a5,0x5
    800069f4:	ff37c783          	lbu	a5,-13(a5) # 8000b9e3 <_ZL9finishedC>
    800069f8:	fc078ce3          	beqz	a5,800069d0 <_Z16System_Mode_testv+0xb4>
    800069fc:	00005797          	auipc	a5,0x5
    80006a00:	fe67c783          	lbu	a5,-26(a5) # 8000b9e2 <_ZL9finishedD>
    80006a04:	fc0786e3          	beqz	a5,800069d0 <_Z16System_Mode_testv+0xb4>
    }

}
    80006a08:	02813083          	ld	ra,40(sp)
    80006a0c:	02013403          	ld	s0,32(sp)
    80006a10:	03010113          	addi	sp,sp,48
    80006a14:	00008067          	ret

0000000080006a18 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006a18:	fe010113          	addi	sp,sp,-32
    80006a1c:	00113c23          	sd	ra,24(sp)
    80006a20:	00813823          	sd	s0,16(sp)
    80006a24:	00913423          	sd	s1,8(sp)
    80006a28:	01213023          	sd	s2,0(sp)
    80006a2c:	02010413          	addi	s0,sp,32
    80006a30:	00050493          	mv	s1,a0
    80006a34:	00058913          	mv	s2,a1
    80006a38:	0015879b          	addiw	a5,a1,1
    80006a3c:	0007851b          	sext.w	a0,a5
    80006a40:	00f4a023          	sw	a5,0(s1)
    80006a44:	0004a823          	sw	zero,16(s1)
    80006a48:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006a4c:	00251513          	slli	a0,a0,0x2
    80006a50:	ffffb097          	auipc	ra,0xffffb
    80006a54:	93c080e7          	jalr	-1732(ra) # 8000138c <_Z9mem_allocm>
    80006a58:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006a5c:	00000593          	li	a1,0
    80006a60:	02048513          	addi	a0,s1,32
    80006a64:	ffffb097          	auipc	ra,0xffffb
    80006a68:	aac080e7          	jalr	-1364(ra) # 80001510 <_Z8sem_openPP4_semj>
    sem_open(&spaceAvailable, _cap);
    80006a6c:	00090593          	mv	a1,s2
    80006a70:	01848513          	addi	a0,s1,24
    80006a74:	ffffb097          	auipc	ra,0xffffb
    80006a78:	a9c080e7          	jalr	-1380(ra) # 80001510 <_Z8sem_openPP4_semj>
    sem_open(&mutexHead, 1);
    80006a7c:	00100593          	li	a1,1
    80006a80:	02848513          	addi	a0,s1,40
    80006a84:	ffffb097          	auipc	ra,0xffffb
    80006a88:	a8c080e7          	jalr	-1396(ra) # 80001510 <_Z8sem_openPP4_semj>
    sem_open(&mutexTail, 1);
    80006a8c:	00100593          	li	a1,1
    80006a90:	03048513          	addi	a0,s1,48
    80006a94:	ffffb097          	auipc	ra,0xffffb
    80006a98:	a7c080e7          	jalr	-1412(ra) # 80001510 <_Z8sem_openPP4_semj>
}
    80006a9c:	01813083          	ld	ra,24(sp)
    80006aa0:	01013403          	ld	s0,16(sp)
    80006aa4:	00813483          	ld	s1,8(sp)
    80006aa8:	00013903          	ld	s2,0(sp)
    80006aac:	02010113          	addi	sp,sp,32
    80006ab0:	00008067          	ret

0000000080006ab4 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80006ab4:	fe010113          	addi	sp,sp,-32
    80006ab8:	00113c23          	sd	ra,24(sp)
    80006abc:	00813823          	sd	s0,16(sp)
    80006ac0:	00913423          	sd	s1,8(sp)
    80006ac4:	01213023          	sd	s2,0(sp)
    80006ac8:	02010413          	addi	s0,sp,32
    80006acc:	00050493          	mv	s1,a0
    80006ad0:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80006ad4:	01853503          	ld	a0,24(a0)
    80006ad8:	ffffb097          	auipc	ra,0xffffb
    80006adc:	ab4080e7          	jalr	-1356(ra) # 8000158c <_Z8sem_waitP4_sem>

    sem_wait(mutexTail);
    80006ae0:	0304b503          	ld	a0,48(s1)
    80006ae4:	ffffb097          	auipc	ra,0xffffb
    80006ae8:	aa8080e7          	jalr	-1368(ra) # 8000158c <_Z8sem_waitP4_sem>
    buffer[tail] = val;
    80006aec:	0084b783          	ld	a5,8(s1)
    80006af0:	0144a703          	lw	a4,20(s1)
    80006af4:	00271713          	slli	a4,a4,0x2
    80006af8:	00e787b3          	add	a5,a5,a4
    80006afc:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006b00:	0144a783          	lw	a5,20(s1)
    80006b04:	0017879b          	addiw	a5,a5,1
    80006b08:	0004a703          	lw	a4,0(s1)
    80006b0c:	02e7e7bb          	remw	a5,a5,a4
    80006b10:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80006b14:	0304b503          	ld	a0,48(s1)
    80006b18:	ffffb097          	auipc	ra,0xffffb
    80006b1c:	aac080e7          	jalr	-1364(ra) # 800015c4 <_Z10sem_signalP4_sem>

    sem_signal(itemAvailable);
    80006b20:	0204b503          	ld	a0,32(s1)
    80006b24:	ffffb097          	auipc	ra,0xffffb
    80006b28:	aa0080e7          	jalr	-1376(ra) # 800015c4 <_Z10sem_signalP4_sem>

}
    80006b2c:	01813083          	ld	ra,24(sp)
    80006b30:	01013403          	ld	s0,16(sp)
    80006b34:	00813483          	ld	s1,8(sp)
    80006b38:	00013903          	ld	s2,0(sp)
    80006b3c:	02010113          	addi	sp,sp,32
    80006b40:	00008067          	ret

0000000080006b44 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80006b44:	fe010113          	addi	sp,sp,-32
    80006b48:	00113c23          	sd	ra,24(sp)
    80006b4c:	00813823          	sd	s0,16(sp)
    80006b50:	00913423          	sd	s1,8(sp)
    80006b54:	01213023          	sd	s2,0(sp)
    80006b58:	02010413          	addi	s0,sp,32
    80006b5c:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006b60:	02053503          	ld	a0,32(a0)
    80006b64:	ffffb097          	auipc	ra,0xffffb
    80006b68:	a28080e7          	jalr	-1496(ra) # 8000158c <_Z8sem_waitP4_sem>

    sem_wait(mutexHead);
    80006b6c:	0284b503          	ld	a0,40(s1)
    80006b70:	ffffb097          	auipc	ra,0xffffb
    80006b74:	a1c080e7          	jalr	-1508(ra) # 8000158c <_Z8sem_waitP4_sem>

    int ret = buffer[head];
    80006b78:	0084b703          	ld	a4,8(s1)
    80006b7c:	0104a783          	lw	a5,16(s1)
    80006b80:	00279693          	slli	a3,a5,0x2
    80006b84:	00d70733          	add	a4,a4,a3
    80006b88:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006b8c:	0017879b          	addiw	a5,a5,1
    80006b90:	0004a703          	lw	a4,0(s1)
    80006b94:	02e7e7bb          	remw	a5,a5,a4
    80006b98:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006b9c:	0284b503          	ld	a0,40(s1)
    80006ba0:	ffffb097          	auipc	ra,0xffffb
    80006ba4:	a24080e7          	jalr	-1500(ra) # 800015c4 <_Z10sem_signalP4_sem>

    sem_signal(spaceAvailable);
    80006ba8:	0184b503          	ld	a0,24(s1)
    80006bac:	ffffb097          	auipc	ra,0xffffb
    80006bb0:	a18080e7          	jalr	-1512(ra) # 800015c4 <_Z10sem_signalP4_sem>

    return ret;
}
    80006bb4:	00090513          	mv	a0,s2
    80006bb8:	01813083          	ld	ra,24(sp)
    80006bbc:	01013403          	ld	s0,16(sp)
    80006bc0:	00813483          	ld	s1,8(sp)
    80006bc4:	00013903          	ld	s2,0(sp)
    80006bc8:	02010113          	addi	sp,sp,32
    80006bcc:	00008067          	ret

0000000080006bd0 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006bd0:	fe010113          	addi	sp,sp,-32
    80006bd4:	00113c23          	sd	ra,24(sp)
    80006bd8:	00813823          	sd	s0,16(sp)
    80006bdc:	00913423          	sd	s1,8(sp)
    80006be0:	01213023          	sd	s2,0(sp)
    80006be4:	02010413          	addi	s0,sp,32
    80006be8:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006bec:	02853503          	ld	a0,40(a0)
    80006bf0:	ffffb097          	auipc	ra,0xffffb
    80006bf4:	99c080e7          	jalr	-1636(ra) # 8000158c <_Z8sem_waitP4_sem>
    sem_wait(mutexTail);
    80006bf8:	0304b503          	ld	a0,48(s1)
    80006bfc:	ffffb097          	auipc	ra,0xffffb
    80006c00:	990080e7          	jalr	-1648(ra) # 8000158c <_Z8sem_waitP4_sem>

    if (tail >= head) {
    80006c04:	0144a783          	lw	a5,20(s1)
    80006c08:	0104a903          	lw	s2,16(s1)
    80006c0c:	0327ce63          	blt	a5,s2,80006c48 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006c10:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    80006c14:	0304b503          	ld	a0,48(s1)
    80006c18:	ffffb097          	auipc	ra,0xffffb
    80006c1c:	9ac080e7          	jalr	-1620(ra) # 800015c4 <_Z10sem_signalP4_sem>
    sem_signal(mutexHead);
    80006c20:	0284b503          	ld	a0,40(s1)
    80006c24:	ffffb097          	auipc	ra,0xffffb
    80006c28:	9a0080e7          	jalr	-1632(ra) # 800015c4 <_Z10sem_signalP4_sem>

    return ret;
}
    80006c2c:	00090513          	mv	a0,s2
    80006c30:	01813083          	ld	ra,24(sp)
    80006c34:	01013403          	ld	s0,16(sp)
    80006c38:	00813483          	ld	s1,8(sp)
    80006c3c:	00013903          	ld	s2,0(sp)
    80006c40:	02010113          	addi	sp,sp,32
    80006c44:	00008067          	ret
        ret = cap - head + tail;
    80006c48:	0004a703          	lw	a4,0(s1)
    80006c4c:	4127093b          	subw	s2,a4,s2
    80006c50:	00f9093b          	addw	s2,s2,a5
    80006c54:	fc1ff06f          	j	80006c14 <_ZN6Buffer6getCntEv+0x44>

0000000080006c58 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006c58:	fe010113          	addi	sp,sp,-32
    80006c5c:	00113c23          	sd	ra,24(sp)
    80006c60:	00813823          	sd	s0,16(sp)
    80006c64:	00913423          	sd	s1,8(sp)
    80006c68:	02010413          	addi	s0,sp,32
    80006c6c:	00050493          	mv	s1,a0
    putc('\n');
    80006c70:	00a00513          	li	a0,10
    80006c74:	ffffb097          	auipc	ra,0xffffb
    80006c78:	9f4080e7          	jalr	-1548(ra) # 80001668 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006c7c:	00002517          	auipc	a0,0x2
    80006c80:	69c50513          	addi	a0,a0,1692 # 80009318 <_ZZ18kernelPrintIntegermE6digits+0x2f8>
    80006c84:	fffff097          	auipc	ra,0xfffff
    80006c88:	e64080e7          	jalr	-412(ra) # 80005ae8 <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006c8c:	00048513          	mv	a0,s1
    80006c90:	00000097          	auipc	ra,0x0
    80006c94:	f40080e7          	jalr	-192(ra) # 80006bd0 <_ZN6Buffer6getCntEv>
    80006c98:	02a05c63          	blez	a0,80006cd0 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006c9c:	0084b783          	ld	a5,8(s1)
    80006ca0:	0104a703          	lw	a4,16(s1)
    80006ca4:	00271713          	slli	a4,a4,0x2
    80006ca8:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006cac:	0007c503          	lbu	a0,0(a5)
    80006cb0:	ffffb097          	auipc	ra,0xffffb
    80006cb4:	9b8080e7          	jalr	-1608(ra) # 80001668 <_Z4putcc>
        head = (head + 1) % cap;
    80006cb8:	0104a783          	lw	a5,16(s1)
    80006cbc:	0017879b          	addiw	a5,a5,1
    80006cc0:	0004a703          	lw	a4,0(s1)
    80006cc4:	02e7e7bb          	remw	a5,a5,a4
    80006cc8:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006ccc:	fc1ff06f          	j	80006c8c <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006cd0:	02100513          	li	a0,33
    80006cd4:	ffffb097          	auipc	ra,0xffffb
    80006cd8:	994080e7          	jalr	-1644(ra) # 80001668 <_Z4putcc>
    putc('\n');
    80006cdc:	00a00513          	li	a0,10
    80006ce0:	ffffb097          	auipc	ra,0xffffb
    80006ce4:	988080e7          	jalr	-1656(ra) # 80001668 <_Z4putcc>
    mem_free(buffer);
    80006ce8:	0084b503          	ld	a0,8(s1)
    80006cec:	ffffa097          	auipc	ra,0xffffa
    80006cf0:	6e4080e7          	jalr	1764(ra) # 800013d0 <_Z8mem_freePv>
    sem_close(itemAvailable);
    80006cf4:	0204b503          	ld	a0,32(s1)
    80006cf8:	ffffb097          	auipc	ra,0xffffb
    80006cfc:	85c080e7          	jalr	-1956(ra) # 80001554 <_Z9sem_closeP4_sem>
    sem_close(spaceAvailable);
    80006d00:	0184b503          	ld	a0,24(s1)
    80006d04:	ffffb097          	auipc	ra,0xffffb
    80006d08:	850080e7          	jalr	-1968(ra) # 80001554 <_Z9sem_closeP4_sem>
    sem_close(mutexTail);
    80006d0c:	0304b503          	ld	a0,48(s1)
    80006d10:	ffffb097          	auipc	ra,0xffffb
    80006d14:	844080e7          	jalr	-1980(ra) # 80001554 <_Z9sem_closeP4_sem>
    sem_close(mutexHead);
    80006d18:	0284b503          	ld	a0,40(s1)
    80006d1c:	ffffb097          	auipc	ra,0xffffb
    80006d20:	838080e7          	jalr	-1992(ra) # 80001554 <_Z9sem_closeP4_sem>
}
    80006d24:	01813083          	ld	ra,24(sp)
    80006d28:	01013403          	ld	s0,16(sp)
    80006d2c:	00813483          	ld	s1,8(sp)
    80006d30:	02010113          	addi	sp,sp,32
    80006d34:	00008067          	ret

0000000080006d38 <start>:
    80006d38:	ff010113          	addi	sp,sp,-16
    80006d3c:	00813423          	sd	s0,8(sp)
    80006d40:	01010413          	addi	s0,sp,16
    80006d44:	300027f3          	csrr	a5,mstatus
    80006d48:	ffffe737          	lui	a4,0xffffe
    80006d4c:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1baf>
    80006d50:	00e7f7b3          	and	a5,a5,a4
    80006d54:	00001737          	lui	a4,0x1
    80006d58:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006d5c:	00e7e7b3          	or	a5,a5,a4
    80006d60:	30079073          	csrw	mstatus,a5
    80006d64:	00000797          	auipc	a5,0x0
    80006d68:	16078793          	addi	a5,a5,352 # 80006ec4 <system_main>
    80006d6c:	34179073          	csrw	mepc,a5
    80006d70:	00000793          	li	a5,0
    80006d74:	18079073          	csrw	satp,a5
    80006d78:	000107b7          	lui	a5,0x10
    80006d7c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006d80:	30279073          	csrw	medeleg,a5
    80006d84:	30379073          	csrw	mideleg,a5
    80006d88:	104027f3          	csrr	a5,sie
    80006d8c:	2227e793          	ori	a5,a5,546
    80006d90:	10479073          	csrw	sie,a5
    80006d94:	fff00793          	li	a5,-1
    80006d98:	00a7d793          	srli	a5,a5,0xa
    80006d9c:	3b079073          	csrw	pmpaddr0,a5
    80006da0:	00f00793          	li	a5,15
    80006da4:	3a079073          	csrw	pmpcfg0,a5
    80006da8:	f14027f3          	csrr	a5,mhartid
    80006dac:	0200c737          	lui	a4,0x200c
    80006db0:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006db4:	0007869b          	sext.w	a3,a5
    80006db8:	00269713          	slli	a4,a3,0x2
    80006dbc:	000f4637          	lui	a2,0xf4
    80006dc0:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006dc4:	00d70733          	add	a4,a4,a3
    80006dc8:	0037979b          	slliw	a5,a5,0x3
    80006dcc:	020046b7          	lui	a3,0x2004
    80006dd0:	00d787b3          	add	a5,a5,a3
    80006dd4:	00c585b3          	add	a1,a1,a2
    80006dd8:	00371693          	slli	a3,a4,0x3
    80006ddc:	00005717          	auipc	a4,0x5
    80006de0:	c1470713          	addi	a4,a4,-1004 # 8000b9f0 <timer_scratch>
    80006de4:	00b7b023          	sd	a1,0(a5)
    80006de8:	00d70733          	add	a4,a4,a3
    80006dec:	00f73c23          	sd	a5,24(a4)
    80006df0:	02c73023          	sd	a2,32(a4)
    80006df4:	34071073          	csrw	mscratch,a4
    80006df8:	00000797          	auipc	a5,0x0
    80006dfc:	6e878793          	addi	a5,a5,1768 # 800074e0 <timervec>
    80006e00:	30579073          	csrw	mtvec,a5
    80006e04:	300027f3          	csrr	a5,mstatus
    80006e08:	0087e793          	ori	a5,a5,8
    80006e0c:	30079073          	csrw	mstatus,a5
    80006e10:	304027f3          	csrr	a5,mie
    80006e14:	0807e793          	ori	a5,a5,128
    80006e18:	30479073          	csrw	mie,a5
    80006e1c:	f14027f3          	csrr	a5,mhartid
    80006e20:	0007879b          	sext.w	a5,a5
    80006e24:	00078213          	mv	tp,a5
    80006e28:	30200073          	mret
    80006e2c:	00813403          	ld	s0,8(sp)
    80006e30:	01010113          	addi	sp,sp,16
    80006e34:	00008067          	ret

0000000080006e38 <timerinit>:
    80006e38:	ff010113          	addi	sp,sp,-16
    80006e3c:	00813423          	sd	s0,8(sp)
    80006e40:	01010413          	addi	s0,sp,16
    80006e44:	f14027f3          	csrr	a5,mhartid
    80006e48:	0200c737          	lui	a4,0x200c
    80006e4c:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006e50:	0007869b          	sext.w	a3,a5
    80006e54:	00269713          	slli	a4,a3,0x2
    80006e58:	000f4637          	lui	a2,0xf4
    80006e5c:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006e60:	00d70733          	add	a4,a4,a3
    80006e64:	0037979b          	slliw	a5,a5,0x3
    80006e68:	020046b7          	lui	a3,0x2004
    80006e6c:	00d787b3          	add	a5,a5,a3
    80006e70:	00c585b3          	add	a1,a1,a2
    80006e74:	00371693          	slli	a3,a4,0x3
    80006e78:	00005717          	auipc	a4,0x5
    80006e7c:	b7870713          	addi	a4,a4,-1160 # 8000b9f0 <timer_scratch>
    80006e80:	00b7b023          	sd	a1,0(a5)
    80006e84:	00d70733          	add	a4,a4,a3
    80006e88:	00f73c23          	sd	a5,24(a4)
    80006e8c:	02c73023          	sd	a2,32(a4)
    80006e90:	34071073          	csrw	mscratch,a4
    80006e94:	00000797          	auipc	a5,0x0
    80006e98:	64c78793          	addi	a5,a5,1612 # 800074e0 <timervec>
    80006e9c:	30579073          	csrw	mtvec,a5
    80006ea0:	300027f3          	csrr	a5,mstatus
    80006ea4:	0087e793          	ori	a5,a5,8
    80006ea8:	30079073          	csrw	mstatus,a5
    80006eac:	304027f3          	csrr	a5,mie
    80006eb0:	0807e793          	ori	a5,a5,128
    80006eb4:	30479073          	csrw	mie,a5
    80006eb8:	00813403          	ld	s0,8(sp)
    80006ebc:	01010113          	addi	sp,sp,16
    80006ec0:	00008067          	ret

0000000080006ec4 <system_main>:
    80006ec4:	fe010113          	addi	sp,sp,-32
    80006ec8:	00813823          	sd	s0,16(sp)
    80006ecc:	00913423          	sd	s1,8(sp)
    80006ed0:	00113c23          	sd	ra,24(sp)
    80006ed4:	02010413          	addi	s0,sp,32
    80006ed8:	00000097          	auipc	ra,0x0
    80006edc:	0c4080e7          	jalr	196(ra) # 80006f9c <cpuid>
    80006ee0:	00005497          	auipc	s1,0x5
    80006ee4:	a5048493          	addi	s1,s1,-1456 # 8000b930 <started>
    80006ee8:	02050263          	beqz	a0,80006f0c <system_main+0x48>
    80006eec:	0004a783          	lw	a5,0(s1)
    80006ef0:	0007879b          	sext.w	a5,a5
    80006ef4:	fe078ce3          	beqz	a5,80006eec <system_main+0x28>
    80006ef8:	0ff0000f          	fence
    80006efc:	00002517          	auipc	a0,0x2
    80006f00:	6ec50513          	addi	a0,a0,1772 # 800095e8 <_ZZ18kernelPrintIntegermE6digits+0x5c8>
    80006f04:	00001097          	auipc	ra,0x1
    80006f08:	a78080e7          	jalr	-1416(ra) # 8000797c <panic>
    80006f0c:	00001097          	auipc	ra,0x1
    80006f10:	9cc080e7          	jalr	-1588(ra) # 800078d8 <consoleinit>
    80006f14:	00001097          	auipc	ra,0x1
    80006f18:	158080e7          	jalr	344(ra) # 8000806c <printfinit>
    80006f1c:	00002517          	auipc	a0,0x2
    80006f20:	55450513          	addi	a0,a0,1364 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80006f24:	00001097          	auipc	ra,0x1
    80006f28:	ab4080e7          	jalr	-1356(ra) # 800079d8 <__printf>
    80006f2c:	00002517          	auipc	a0,0x2
    80006f30:	68c50513          	addi	a0,a0,1676 # 800095b8 <_ZZ18kernelPrintIntegermE6digits+0x598>
    80006f34:	00001097          	auipc	ra,0x1
    80006f38:	aa4080e7          	jalr	-1372(ra) # 800079d8 <__printf>
    80006f3c:	00002517          	auipc	a0,0x2
    80006f40:	53450513          	addi	a0,a0,1332 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    80006f44:	00001097          	auipc	ra,0x1
    80006f48:	a94080e7          	jalr	-1388(ra) # 800079d8 <__printf>
    80006f4c:	00001097          	auipc	ra,0x1
    80006f50:	4ac080e7          	jalr	1196(ra) # 800083f8 <kinit>
    80006f54:	00000097          	auipc	ra,0x0
    80006f58:	148080e7          	jalr	328(ra) # 8000709c <trapinit>
    80006f5c:	00000097          	auipc	ra,0x0
    80006f60:	16c080e7          	jalr	364(ra) # 800070c8 <trapinithart>
    80006f64:	00000097          	auipc	ra,0x0
    80006f68:	5bc080e7          	jalr	1468(ra) # 80007520 <plicinit>
    80006f6c:	00000097          	auipc	ra,0x0
    80006f70:	5dc080e7          	jalr	1500(ra) # 80007548 <plicinithart>
    80006f74:	00000097          	auipc	ra,0x0
    80006f78:	078080e7          	jalr	120(ra) # 80006fec <userinit>
    80006f7c:	0ff0000f          	fence
    80006f80:	00100793          	li	a5,1
    80006f84:	00002517          	auipc	a0,0x2
    80006f88:	64c50513          	addi	a0,a0,1612 # 800095d0 <_ZZ18kernelPrintIntegermE6digits+0x5b0>
    80006f8c:	00f4a023          	sw	a5,0(s1)
    80006f90:	00001097          	auipc	ra,0x1
    80006f94:	a48080e7          	jalr	-1464(ra) # 800079d8 <__printf>
    80006f98:	0000006f          	j	80006f98 <system_main+0xd4>

0000000080006f9c <cpuid>:
    80006f9c:	ff010113          	addi	sp,sp,-16
    80006fa0:	00813423          	sd	s0,8(sp)
    80006fa4:	01010413          	addi	s0,sp,16
    80006fa8:	00020513          	mv	a0,tp
    80006fac:	00813403          	ld	s0,8(sp)
    80006fb0:	0005051b          	sext.w	a0,a0
    80006fb4:	01010113          	addi	sp,sp,16
    80006fb8:	00008067          	ret

0000000080006fbc <mycpu>:
    80006fbc:	ff010113          	addi	sp,sp,-16
    80006fc0:	00813423          	sd	s0,8(sp)
    80006fc4:	01010413          	addi	s0,sp,16
    80006fc8:	00020793          	mv	a5,tp
    80006fcc:	00813403          	ld	s0,8(sp)
    80006fd0:	0007879b          	sext.w	a5,a5
    80006fd4:	00779793          	slli	a5,a5,0x7
    80006fd8:	00006517          	auipc	a0,0x6
    80006fdc:	a4850513          	addi	a0,a0,-1464 # 8000ca20 <cpus>
    80006fe0:	00f50533          	add	a0,a0,a5
    80006fe4:	01010113          	addi	sp,sp,16
    80006fe8:	00008067          	ret

0000000080006fec <userinit>:
    80006fec:	ff010113          	addi	sp,sp,-16
    80006ff0:	00813423          	sd	s0,8(sp)
    80006ff4:	01010413          	addi	s0,sp,16
    80006ff8:	00813403          	ld	s0,8(sp)
    80006ffc:	01010113          	addi	sp,sp,16
    80007000:	ffffb317          	auipc	t1,0xffffb
    80007004:	27830067          	jr	632(t1) # 80002278 <main>

0000000080007008 <either_copyout>:
    80007008:	ff010113          	addi	sp,sp,-16
    8000700c:	00813023          	sd	s0,0(sp)
    80007010:	00113423          	sd	ra,8(sp)
    80007014:	01010413          	addi	s0,sp,16
    80007018:	02051663          	bnez	a0,80007044 <either_copyout+0x3c>
    8000701c:	00058513          	mv	a0,a1
    80007020:	00060593          	mv	a1,a2
    80007024:	0006861b          	sext.w	a2,a3
    80007028:	00002097          	auipc	ra,0x2
    8000702c:	c5c080e7          	jalr	-932(ra) # 80008c84 <__memmove>
    80007030:	00813083          	ld	ra,8(sp)
    80007034:	00013403          	ld	s0,0(sp)
    80007038:	00000513          	li	a0,0
    8000703c:	01010113          	addi	sp,sp,16
    80007040:	00008067          	ret
    80007044:	00002517          	auipc	a0,0x2
    80007048:	5cc50513          	addi	a0,a0,1484 # 80009610 <_ZZ18kernelPrintIntegermE6digits+0x5f0>
    8000704c:	00001097          	auipc	ra,0x1
    80007050:	930080e7          	jalr	-1744(ra) # 8000797c <panic>

0000000080007054 <either_copyin>:
    80007054:	ff010113          	addi	sp,sp,-16
    80007058:	00813023          	sd	s0,0(sp)
    8000705c:	00113423          	sd	ra,8(sp)
    80007060:	01010413          	addi	s0,sp,16
    80007064:	02059463          	bnez	a1,8000708c <either_copyin+0x38>
    80007068:	00060593          	mv	a1,a2
    8000706c:	0006861b          	sext.w	a2,a3
    80007070:	00002097          	auipc	ra,0x2
    80007074:	c14080e7          	jalr	-1004(ra) # 80008c84 <__memmove>
    80007078:	00813083          	ld	ra,8(sp)
    8000707c:	00013403          	ld	s0,0(sp)
    80007080:	00000513          	li	a0,0
    80007084:	01010113          	addi	sp,sp,16
    80007088:	00008067          	ret
    8000708c:	00002517          	auipc	a0,0x2
    80007090:	5ac50513          	addi	a0,a0,1452 # 80009638 <_ZZ18kernelPrintIntegermE6digits+0x618>
    80007094:	00001097          	auipc	ra,0x1
    80007098:	8e8080e7          	jalr	-1816(ra) # 8000797c <panic>

000000008000709c <trapinit>:
    8000709c:	ff010113          	addi	sp,sp,-16
    800070a0:	00813423          	sd	s0,8(sp)
    800070a4:	01010413          	addi	s0,sp,16
    800070a8:	00813403          	ld	s0,8(sp)
    800070ac:	00002597          	auipc	a1,0x2
    800070b0:	5b458593          	addi	a1,a1,1460 # 80009660 <_ZZ18kernelPrintIntegermE6digits+0x640>
    800070b4:	00006517          	auipc	a0,0x6
    800070b8:	9ec50513          	addi	a0,a0,-1556 # 8000caa0 <tickslock>
    800070bc:	01010113          	addi	sp,sp,16
    800070c0:	00001317          	auipc	t1,0x1
    800070c4:	5c830067          	jr	1480(t1) # 80008688 <initlock>

00000000800070c8 <trapinithart>:
    800070c8:	ff010113          	addi	sp,sp,-16
    800070cc:	00813423          	sd	s0,8(sp)
    800070d0:	01010413          	addi	s0,sp,16
    800070d4:	00000797          	auipc	a5,0x0
    800070d8:	2fc78793          	addi	a5,a5,764 # 800073d0 <kernelvec>
    800070dc:	10579073          	csrw	stvec,a5
    800070e0:	00813403          	ld	s0,8(sp)
    800070e4:	01010113          	addi	sp,sp,16
    800070e8:	00008067          	ret

00000000800070ec <usertrap>:
    800070ec:	ff010113          	addi	sp,sp,-16
    800070f0:	00813423          	sd	s0,8(sp)
    800070f4:	01010413          	addi	s0,sp,16
    800070f8:	00813403          	ld	s0,8(sp)
    800070fc:	01010113          	addi	sp,sp,16
    80007100:	00008067          	ret

0000000080007104 <usertrapret>:
    80007104:	ff010113          	addi	sp,sp,-16
    80007108:	00813423          	sd	s0,8(sp)
    8000710c:	01010413          	addi	s0,sp,16
    80007110:	00813403          	ld	s0,8(sp)
    80007114:	01010113          	addi	sp,sp,16
    80007118:	00008067          	ret

000000008000711c <kerneltrap>:
    8000711c:	fe010113          	addi	sp,sp,-32
    80007120:	00813823          	sd	s0,16(sp)
    80007124:	00113c23          	sd	ra,24(sp)
    80007128:	00913423          	sd	s1,8(sp)
    8000712c:	02010413          	addi	s0,sp,32
    80007130:	142025f3          	csrr	a1,scause
    80007134:	100027f3          	csrr	a5,sstatus
    80007138:	0027f793          	andi	a5,a5,2
    8000713c:	10079c63          	bnez	a5,80007254 <kerneltrap+0x138>
    80007140:	142027f3          	csrr	a5,scause
    80007144:	0207ce63          	bltz	a5,80007180 <kerneltrap+0x64>
    80007148:	00002517          	auipc	a0,0x2
    8000714c:	56050513          	addi	a0,a0,1376 # 800096a8 <_ZZ18kernelPrintIntegermE6digits+0x688>
    80007150:	00001097          	auipc	ra,0x1
    80007154:	888080e7          	jalr	-1912(ra) # 800079d8 <__printf>
    80007158:	141025f3          	csrr	a1,sepc
    8000715c:	14302673          	csrr	a2,stval
    80007160:	00002517          	auipc	a0,0x2
    80007164:	55850513          	addi	a0,a0,1368 # 800096b8 <_ZZ18kernelPrintIntegermE6digits+0x698>
    80007168:	00001097          	auipc	ra,0x1
    8000716c:	870080e7          	jalr	-1936(ra) # 800079d8 <__printf>
    80007170:	00002517          	auipc	a0,0x2
    80007174:	56050513          	addi	a0,a0,1376 # 800096d0 <_ZZ18kernelPrintIntegermE6digits+0x6b0>
    80007178:	00001097          	auipc	ra,0x1
    8000717c:	804080e7          	jalr	-2044(ra) # 8000797c <panic>
    80007180:	0ff7f713          	andi	a4,a5,255
    80007184:	00900693          	li	a3,9
    80007188:	04d70063          	beq	a4,a3,800071c8 <kerneltrap+0xac>
    8000718c:	fff00713          	li	a4,-1
    80007190:	03f71713          	slli	a4,a4,0x3f
    80007194:	00170713          	addi	a4,a4,1
    80007198:	fae798e3          	bne	a5,a4,80007148 <kerneltrap+0x2c>
    8000719c:	00000097          	auipc	ra,0x0
    800071a0:	e00080e7          	jalr	-512(ra) # 80006f9c <cpuid>
    800071a4:	06050663          	beqz	a0,80007210 <kerneltrap+0xf4>
    800071a8:	144027f3          	csrr	a5,sip
    800071ac:	ffd7f793          	andi	a5,a5,-3
    800071b0:	14479073          	csrw	sip,a5
    800071b4:	01813083          	ld	ra,24(sp)
    800071b8:	01013403          	ld	s0,16(sp)
    800071bc:	00813483          	ld	s1,8(sp)
    800071c0:	02010113          	addi	sp,sp,32
    800071c4:	00008067          	ret
    800071c8:	00000097          	auipc	ra,0x0
    800071cc:	3cc080e7          	jalr	972(ra) # 80007594 <plic_claim>
    800071d0:	00a00793          	li	a5,10
    800071d4:	00050493          	mv	s1,a0
    800071d8:	06f50863          	beq	a0,a5,80007248 <kerneltrap+0x12c>
    800071dc:	fc050ce3          	beqz	a0,800071b4 <kerneltrap+0x98>
    800071e0:	00050593          	mv	a1,a0
    800071e4:	00002517          	auipc	a0,0x2
    800071e8:	4a450513          	addi	a0,a0,1188 # 80009688 <_ZZ18kernelPrintIntegermE6digits+0x668>
    800071ec:	00000097          	auipc	ra,0x0
    800071f0:	7ec080e7          	jalr	2028(ra) # 800079d8 <__printf>
    800071f4:	01013403          	ld	s0,16(sp)
    800071f8:	01813083          	ld	ra,24(sp)
    800071fc:	00048513          	mv	a0,s1
    80007200:	00813483          	ld	s1,8(sp)
    80007204:	02010113          	addi	sp,sp,32
    80007208:	00000317          	auipc	t1,0x0
    8000720c:	3c430067          	jr	964(t1) # 800075cc <plic_complete>
    80007210:	00006517          	auipc	a0,0x6
    80007214:	89050513          	addi	a0,a0,-1904 # 8000caa0 <tickslock>
    80007218:	00001097          	auipc	ra,0x1
    8000721c:	494080e7          	jalr	1172(ra) # 800086ac <acquire>
    80007220:	00004717          	auipc	a4,0x4
    80007224:	71470713          	addi	a4,a4,1812 # 8000b934 <ticks>
    80007228:	00072783          	lw	a5,0(a4)
    8000722c:	00006517          	auipc	a0,0x6
    80007230:	87450513          	addi	a0,a0,-1932 # 8000caa0 <tickslock>
    80007234:	0017879b          	addiw	a5,a5,1
    80007238:	00f72023          	sw	a5,0(a4)
    8000723c:	00001097          	auipc	ra,0x1
    80007240:	53c080e7          	jalr	1340(ra) # 80008778 <release>
    80007244:	f65ff06f          	j	800071a8 <kerneltrap+0x8c>
    80007248:	00001097          	auipc	ra,0x1
    8000724c:	098080e7          	jalr	152(ra) # 800082e0 <uartintr>
    80007250:	fa5ff06f          	j	800071f4 <kerneltrap+0xd8>
    80007254:	00002517          	auipc	a0,0x2
    80007258:	41450513          	addi	a0,a0,1044 # 80009668 <_ZZ18kernelPrintIntegermE6digits+0x648>
    8000725c:	00000097          	auipc	ra,0x0
    80007260:	720080e7          	jalr	1824(ra) # 8000797c <panic>

0000000080007264 <clockintr>:
    80007264:	fe010113          	addi	sp,sp,-32
    80007268:	00813823          	sd	s0,16(sp)
    8000726c:	00913423          	sd	s1,8(sp)
    80007270:	00113c23          	sd	ra,24(sp)
    80007274:	02010413          	addi	s0,sp,32
    80007278:	00006497          	auipc	s1,0x6
    8000727c:	82848493          	addi	s1,s1,-2008 # 8000caa0 <tickslock>
    80007280:	00048513          	mv	a0,s1
    80007284:	00001097          	auipc	ra,0x1
    80007288:	428080e7          	jalr	1064(ra) # 800086ac <acquire>
    8000728c:	00004717          	auipc	a4,0x4
    80007290:	6a870713          	addi	a4,a4,1704 # 8000b934 <ticks>
    80007294:	00072783          	lw	a5,0(a4)
    80007298:	01013403          	ld	s0,16(sp)
    8000729c:	01813083          	ld	ra,24(sp)
    800072a0:	00048513          	mv	a0,s1
    800072a4:	0017879b          	addiw	a5,a5,1
    800072a8:	00813483          	ld	s1,8(sp)
    800072ac:	00f72023          	sw	a5,0(a4)
    800072b0:	02010113          	addi	sp,sp,32
    800072b4:	00001317          	auipc	t1,0x1
    800072b8:	4c430067          	jr	1220(t1) # 80008778 <release>

00000000800072bc <devintr>:
    800072bc:	142027f3          	csrr	a5,scause
    800072c0:	00000513          	li	a0,0
    800072c4:	0007c463          	bltz	a5,800072cc <devintr+0x10>
    800072c8:	00008067          	ret
    800072cc:	fe010113          	addi	sp,sp,-32
    800072d0:	00813823          	sd	s0,16(sp)
    800072d4:	00113c23          	sd	ra,24(sp)
    800072d8:	00913423          	sd	s1,8(sp)
    800072dc:	02010413          	addi	s0,sp,32
    800072e0:	0ff7f713          	andi	a4,a5,255
    800072e4:	00900693          	li	a3,9
    800072e8:	04d70c63          	beq	a4,a3,80007340 <devintr+0x84>
    800072ec:	fff00713          	li	a4,-1
    800072f0:	03f71713          	slli	a4,a4,0x3f
    800072f4:	00170713          	addi	a4,a4,1
    800072f8:	00e78c63          	beq	a5,a4,80007310 <devintr+0x54>
    800072fc:	01813083          	ld	ra,24(sp)
    80007300:	01013403          	ld	s0,16(sp)
    80007304:	00813483          	ld	s1,8(sp)
    80007308:	02010113          	addi	sp,sp,32
    8000730c:	00008067          	ret
    80007310:	00000097          	auipc	ra,0x0
    80007314:	c8c080e7          	jalr	-884(ra) # 80006f9c <cpuid>
    80007318:	06050663          	beqz	a0,80007384 <devintr+0xc8>
    8000731c:	144027f3          	csrr	a5,sip
    80007320:	ffd7f793          	andi	a5,a5,-3
    80007324:	14479073          	csrw	sip,a5
    80007328:	01813083          	ld	ra,24(sp)
    8000732c:	01013403          	ld	s0,16(sp)
    80007330:	00813483          	ld	s1,8(sp)
    80007334:	00200513          	li	a0,2
    80007338:	02010113          	addi	sp,sp,32
    8000733c:	00008067          	ret
    80007340:	00000097          	auipc	ra,0x0
    80007344:	254080e7          	jalr	596(ra) # 80007594 <plic_claim>
    80007348:	00a00793          	li	a5,10
    8000734c:	00050493          	mv	s1,a0
    80007350:	06f50663          	beq	a0,a5,800073bc <devintr+0x100>
    80007354:	00100513          	li	a0,1
    80007358:	fa0482e3          	beqz	s1,800072fc <devintr+0x40>
    8000735c:	00048593          	mv	a1,s1
    80007360:	00002517          	auipc	a0,0x2
    80007364:	32850513          	addi	a0,a0,808 # 80009688 <_ZZ18kernelPrintIntegermE6digits+0x668>
    80007368:	00000097          	auipc	ra,0x0
    8000736c:	670080e7          	jalr	1648(ra) # 800079d8 <__printf>
    80007370:	00048513          	mv	a0,s1
    80007374:	00000097          	auipc	ra,0x0
    80007378:	258080e7          	jalr	600(ra) # 800075cc <plic_complete>
    8000737c:	00100513          	li	a0,1
    80007380:	f7dff06f          	j	800072fc <devintr+0x40>
    80007384:	00005517          	auipc	a0,0x5
    80007388:	71c50513          	addi	a0,a0,1820 # 8000caa0 <tickslock>
    8000738c:	00001097          	auipc	ra,0x1
    80007390:	320080e7          	jalr	800(ra) # 800086ac <acquire>
    80007394:	00004717          	auipc	a4,0x4
    80007398:	5a070713          	addi	a4,a4,1440 # 8000b934 <ticks>
    8000739c:	00072783          	lw	a5,0(a4)
    800073a0:	00005517          	auipc	a0,0x5
    800073a4:	70050513          	addi	a0,a0,1792 # 8000caa0 <tickslock>
    800073a8:	0017879b          	addiw	a5,a5,1
    800073ac:	00f72023          	sw	a5,0(a4)
    800073b0:	00001097          	auipc	ra,0x1
    800073b4:	3c8080e7          	jalr	968(ra) # 80008778 <release>
    800073b8:	f65ff06f          	j	8000731c <devintr+0x60>
    800073bc:	00001097          	auipc	ra,0x1
    800073c0:	f24080e7          	jalr	-220(ra) # 800082e0 <uartintr>
    800073c4:	fadff06f          	j	80007370 <devintr+0xb4>
	...

00000000800073d0 <kernelvec>:
    800073d0:	f0010113          	addi	sp,sp,-256
    800073d4:	00113023          	sd	ra,0(sp)
    800073d8:	00213423          	sd	sp,8(sp)
    800073dc:	00313823          	sd	gp,16(sp)
    800073e0:	00413c23          	sd	tp,24(sp)
    800073e4:	02513023          	sd	t0,32(sp)
    800073e8:	02613423          	sd	t1,40(sp)
    800073ec:	02713823          	sd	t2,48(sp)
    800073f0:	02813c23          	sd	s0,56(sp)
    800073f4:	04913023          	sd	s1,64(sp)
    800073f8:	04a13423          	sd	a0,72(sp)
    800073fc:	04b13823          	sd	a1,80(sp)
    80007400:	04c13c23          	sd	a2,88(sp)
    80007404:	06d13023          	sd	a3,96(sp)
    80007408:	06e13423          	sd	a4,104(sp)
    8000740c:	06f13823          	sd	a5,112(sp)
    80007410:	07013c23          	sd	a6,120(sp)
    80007414:	09113023          	sd	a7,128(sp)
    80007418:	09213423          	sd	s2,136(sp)
    8000741c:	09313823          	sd	s3,144(sp)
    80007420:	09413c23          	sd	s4,152(sp)
    80007424:	0b513023          	sd	s5,160(sp)
    80007428:	0b613423          	sd	s6,168(sp)
    8000742c:	0b713823          	sd	s7,176(sp)
    80007430:	0b813c23          	sd	s8,184(sp)
    80007434:	0d913023          	sd	s9,192(sp)
    80007438:	0da13423          	sd	s10,200(sp)
    8000743c:	0db13823          	sd	s11,208(sp)
    80007440:	0dc13c23          	sd	t3,216(sp)
    80007444:	0fd13023          	sd	t4,224(sp)
    80007448:	0fe13423          	sd	t5,232(sp)
    8000744c:	0ff13823          	sd	t6,240(sp)
    80007450:	ccdff0ef          	jal	ra,8000711c <kerneltrap>
    80007454:	00013083          	ld	ra,0(sp)
    80007458:	00813103          	ld	sp,8(sp)
    8000745c:	01013183          	ld	gp,16(sp)
    80007460:	02013283          	ld	t0,32(sp)
    80007464:	02813303          	ld	t1,40(sp)
    80007468:	03013383          	ld	t2,48(sp)
    8000746c:	03813403          	ld	s0,56(sp)
    80007470:	04013483          	ld	s1,64(sp)
    80007474:	04813503          	ld	a0,72(sp)
    80007478:	05013583          	ld	a1,80(sp)
    8000747c:	05813603          	ld	a2,88(sp)
    80007480:	06013683          	ld	a3,96(sp)
    80007484:	06813703          	ld	a4,104(sp)
    80007488:	07013783          	ld	a5,112(sp)
    8000748c:	07813803          	ld	a6,120(sp)
    80007490:	08013883          	ld	a7,128(sp)
    80007494:	08813903          	ld	s2,136(sp)
    80007498:	09013983          	ld	s3,144(sp)
    8000749c:	09813a03          	ld	s4,152(sp)
    800074a0:	0a013a83          	ld	s5,160(sp)
    800074a4:	0a813b03          	ld	s6,168(sp)
    800074a8:	0b013b83          	ld	s7,176(sp)
    800074ac:	0b813c03          	ld	s8,184(sp)
    800074b0:	0c013c83          	ld	s9,192(sp)
    800074b4:	0c813d03          	ld	s10,200(sp)
    800074b8:	0d013d83          	ld	s11,208(sp)
    800074bc:	0d813e03          	ld	t3,216(sp)
    800074c0:	0e013e83          	ld	t4,224(sp)
    800074c4:	0e813f03          	ld	t5,232(sp)
    800074c8:	0f013f83          	ld	t6,240(sp)
    800074cc:	10010113          	addi	sp,sp,256
    800074d0:	10200073          	sret
    800074d4:	00000013          	nop
    800074d8:	00000013          	nop
    800074dc:	00000013          	nop

00000000800074e0 <timervec>:
    800074e0:	34051573          	csrrw	a0,mscratch,a0
    800074e4:	00b53023          	sd	a1,0(a0)
    800074e8:	00c53423          	sd	a2,8(a0)
    800074ec:	00d53823          	sd	a3,16(a0)
    800074f0:	01853583          	ld	a1,24(a0)
    800074f4:	02053603          	ld	a2,32(a0)
    800074f8:	0005b683          	ld	a3,0(a1)
    800074fc:	00c686b3          	add	a3,a3,a2
    80007500:	00d5b023          	sd	a3,0(a1)
    80007504:	00200593          	li	a1,2
    80007508:	14459073          	csrw	sip,a1
    8000750c:	01053683          	ld	a3,16(a0)
    80007510:	00853603          	ld	a2,8(a0)
    80007514:	00053583          	ld	a1,0(a0)
    80007518:	34051573          	csrrw	a0,mscratch,a0
    8000751c:	30200073          	mret

0000000080007520 <plicinit>:
    80007520:	ff010113          	addi	sp,sp,-16
    80007524:	00813423          	sd	s0,8(sp)
    80007528:	01010413          	addi	s0,sp,16
    8000752c:	00813403          	ld	s0,8(sp)
    80007530:	0c0007b7          	lui	a5,0xc000
    80007534:	00100713          	li	a4,1
    80007538:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    8000753c:	00e7a223          	sw	a4,4(a5)
    80007540:	01010113          	addi	sp,sp,16
    80007544:	00008067          	ret

0000000080007548 <plicinithart>:
    80007548:	ff010113          	addi	sp,sp,-16
    8000754c:	00813023          	sd	s0,0(sp)
    80007550:	00113423          	sd	ra,8(sp)
    80007554:	01010413          	addi	s0,sp,16
    80007558:	00000097          	auipc	ra,0x0
    8000755c:	a44080e7          	jalr	-1468(ra) # 80006f9c <cpuid>
    80007560:	0085171b          	slliw	a4,a0,0x8
    80007564:	0c0027b7          	lui	a5,0xc002
    80007568:	00e787b3          	add	a5,a5,a4
    8000756c:	40200713          	li	a4,1026
    80007570:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80007574:	00813083          	ld	ra,8(sp)
    80007578:	00013403          	ld	s0,0(sp)
    8000757c:	00d5151b          	slliw	a0,a0,0xd
    80007580:	0c2017b7          	lui	a5,0xc201
    80007584:	00a78533          	add	a0,a5,a0
    80007588:	00052023          	sw	zero,0(a0)
    8000758c:	01010113          	addi	sp,sp,16
    80007590:	00008067          	ret

0000000080007594 <plic_claim>:
    80007594:	ff010113          	addi	sp,sp,-16
    80007598:	00813023          	sd	s0,0(sp)
    8000759c:	00113423          	sd	ra,8(sp)
    800075a0:	01010413          	addi	s0,sp,16
    800075a4:	00000097          	auipc	ra,0x0
    800075a8:	9f8080e7          	jalr	-1544(ra) # 80006f9c <cpuid>
    800075ac:	00813083          	ld	ra,8(sp)
    800075b0:	00013403          	ld	s0,0(sp)
    800075b4:	00d5151b          	slliw	a0,a0,0xd
    800075b8:	0c2017b7          	lui	a5,0xc201
    800075bc:	00a78533          	add	a0,a5,a0
    800075c0:	00452503          	lw	a0,4(a0)
    800075c4:	01010113          	addi	sp,sp,16
    800075c8:	00008067          	ret

00000000800075cc <plic_complete>:
    800075cc:	fe010113          	addi	sp,sp,-32
    800075d0:	00813823          	sd	s0,16(sp)
    800075d4:	00913423          	sd	s1,8(sp)
    800075d8:	00113c23          	sd	ra,24(sp)
    800075dc:	02010413          	addi	s0,sp,32
    800075e0:	00050493          	mv	s1,a0
    800075e4:	00000097          	auipc	ra,0x0
    800075e8:	9b8080e7          	jalr	-1608(ra) # 80006f9c <cpuid>
    800075ec:	01813083          	ld	ra,24(sp)
    800075f0:	01013403          	ld	s0,16(sp)
    800075f4:	00d5179b          	slliw	a5,a0,0xd
    800075f8:	0c201737          	lui	a4,0xc201
    800075fc:	00f707b3          	add	a5,a4,a5
    80007600:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80007604:	00813483          	ld	s1,8(sp)
    80007608:	02010113          	addi	sp,sp,32
    8000760c:	00008067          	ret

0000000080007610 <consolewrite>:
    80007610:	fb010113          	addi	sp,sp,-80
    80007614:	04813023          	sd	s0,64(sp)
    80007618:	04113423          	sd	ra,72(sp)
    8000761c:	02913c23          	sd	s1,56(sp)
    80007620:	03213823          	sd	s2,48(sp)
    80007624:	03313423          	sd	s3,40(sp)
    80007628:	03413023          	sd	s4,32(sp)
    8000762c:	01513c23          	sd	s5,24(sp)
    80007630:	05010413          	addi	s0,sp,80
    80007634:	06c05c63          	blez	a2,800076ac <consolewrite+0x9c>
    80007638:	00060993          	mv	s3,a2
    8000763c:	00050a13          	mv	s4,a0
    80007640:	00058493          	mv	s1,a1
    80007644:	00000913          	li	s2,0
    80007648:	fff00a93          	li	s5,-1
    8000764c:	01c0006f          	j	80007668 <consolewrite+0x58>
    80007650:	fbf44503          	lbu	a0,-65(s0)
    80007654:	0019091b          	addiw	s2,s2,1
    80007658:	00148493          	addi	s1,s1,1
    8000765c:	00001097          	auipc	ra,0x1
    80007660:	a9c080e7          	jalr	-1380(ra) # 800080f8 <uartputc>
    80007664:	03298063          	beq	s3,s2,80007684 <consolewrite+0x74>
    80007668:	00048613          	mv	a2,s1
    8000766c:	00100693          	li	a3,1
    80007670:	000a0593          	mv	a1,s4
    80007674:	fbf40513          	addi	a0,s0,-65
    80007678:	00000097          	auipc	ra,0x0
    8000767c:	9dc080e7          	jalr	-1572(ra) # 80007054 <either_copyin>
    80007680:	fd5518e3          	bne	a0,s5,80007650 <consolewrite+0x40>
    80007684:	04813083          	ld	ra,72(sp)
    80007688:	04013403          	ld	s0,64(sp)
    8000768c:	03813483          	ld	s1,56(sp)
    80007690:	02813983          	ld	s3,40(sp)
    80007694:	02013a03          	ld	s4,32(sp)
    80007698:	01813a83          	ld	s5,24(sp)
    8000769c:	00090513          	mv	a0,s2
    800076a0:	03013903          	ld	s2,48(sp)
    800076a4:	05010113          	addi	sp,sp,80
    800076a8:	00008067          	ret
    800076ac:	00000913          	li	s2,0
    800076b0:	fd5ff06f          	j	80007684 <consolewrite+0x74>

00000000800076b4 <consoleread>:
    800076b4:	f9010113          	addi	sp,sp,-112
    800076b8:	06813023          	sd	s0,96(sp)
    800076bc:	04913c23          	sd	s1,88(sp)
    800076c0:	05213823          	sd	s2,80(sp)
    800076c4:	05313423          	sd	s3,72(sp)
    800076c8:	05413023          	sd	s4,64(sp)
    800076cc:	03513c23          	sd	s5,56(sp)
    800076d0:	03613823          	sd	s6,48(sp)
    800076d4:	03713423          	sd	s7,40(sp)
    800076d8:	03813023          	sd	s8,32(sp)
    800076dc:	06113423          	sd	ra,104(sp)
    800076e0:	01913c23          	sd	s9,24(sp)
    800076e4:	07010413          	addi	s0,sp,112
    800076e8:	00060b93          	mv	s7,a2
    800076ec:	00050913          	mv	s2,a0
    800076f0:	00058c13          	mv	s8,a1
    800076f4:	00060b1b          	sext.w	s6,a2
    800076f8:	00005497          	auipc	s1,0x5
    800076fc:	3d048493          	addi	s1,s1,976 # 8000cac8 <cons>
    80007700:	00400993          	li	s3,4
    80007704:	fff00a13          	li	s4,-1
    80007708:	00a00a93          	li	s5,10
    8000770c:	05705e63          	blez	s7,80007768 <consoleread+0xb4>
    80007710:	09c4a703          	lw	a4,156(s1)
    80007714:	0984a783          	lw	a5,152(s1)
    80007718:	0007071b          	sext.w	a4,a4
    8000771c:	08e78463          	beq	a5,a4,800077a4 <consoleread+0xf0>
    80007720:	07f7f713          	andi	a4,a5,127
    80007724:	00e48733          	add	a4,s1,a4
    80007728:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000772c:	0017869b          	addiw	a3,a5,1
    80007730:	08d4ac23          	sw	a3,152(s1)
    80007734:	00070c9b          	sext.w	s9,a4
    80007738:	0b370663          	beq	a4,s3,800077e4 <consoleread+0x130>
    8000773c:	00100693          	li	a3,1
    80007740:	f9f40613          	addi	a2,s0,-97
    80007744:	000c0593          	mv	a1,s8
    80007748:	00090513          	mv	a0,s2
    8000774c:	f8e40fa3          	sb	a4,-97(s0)
    80007750:	00000097          	auipc	ra,0x0
    80007754:	8b8080e7          	jalr	-1864(ra) # 80007008 <either_copyout>
    80007758:	01450863          	beq	a0,s4,80007768 <consoleread+0xb4>
    8000775c:	001c0c13          	addi	s8,s8,1
    80007760:	fffb8b9b          	addiw	s7,s7,-1
    80007764:	fb5c94e3          	bne	s9,s5,8000770c <consoleread+0x58>
    80007768:	000b851b          	sext.w	a0,s7
    8000776c:	06813083          	ld	ra,104(sp)
    80007770:	06013403          	ld	s0,96(sp)
    80007774:	05813483          	ld	s1,88(sp)
    80007778:	05013903          	ld	s2,80(sp)
    8000777c:	04813983          	ld	s3,72(sp)
    80007780:	04013a03          	ld	s4,64(sp)
    80007784:	03813a83          	ld	s5,56(sp)
    80007788:	02813b83          	ld	s7,40(sp)
    8000778c:	02013c03          	ld	s8,32(sp)
    80007790:	01813c83          	ld	s9,24(sp)
    80007794:	40ab053b          	subw	a0,s6,a0
    80007798:	03013b03          	ld	s6,48(sp)
    8000779c:	07010113          	addi	sp,sp,112
    800077a0:	00008067          	ret
    800077a4:	00001097          	auipc	ra,0x1
    800077a8:	1d8080e7          	jalr	472(ra) # 8000897c <push_on>
    800077ac:	0984a703          	lw	a4,152(s1)
    800077b0:	09c4a783          	lw	a5,156(s1)
    800077b4:	0007879b          	sext.w	a5,a5
    800077b8:	fef70ce3          	beq	a4,a5,800077b0 <consoleread+0xfc>
    800077bc:	00001097          	auipc	ra,0x1
    800077c0:	234080e7          	jalr	564(ra) # 800089f0 <pop_on>
    800077c4:	0984a783          	lw	a5,152(s1)
    800077c8:	07f7f713          	andi	a4,a5,127
    800077cc:	00e48733          	add	a4,s1,a4
    800077d0:	01874703          	lbu	a4,24(a4)
    800077d4:	0017869b          	addiw	a3,a5,1
    800077d8:	08d4ac23          	sw	a3,152(s1)
    800077dc:	00070c9b          	sext.w	s9,a4
    800077e0:	f5371ee3          	bne	a4,s3,8000773c <consoleread+0x88>
    800077e4:	000b851b          	sext.w	a0,s7
    800077e8:	f96bf2e3          	bgeu	s7,s6,8000776c <consoleread+0xb8>
    800077ec:	08f4ac23          	sw	a5,152(s1)
    800077f0:	f7dff06f          	j	8000776c <consoleread+0xb8>

00000000800077f4 <consputc>:
    800077f4:	10000793          	li	a5,256
    800077f8:	00f50663          	beq	a0,a5,80007804 <consputc+0x10>
    800077fc:	00001317          	auipc	t1,0x1
    80007800:	9f430067          	jr	-1548(t1) # 800081f0 <uartputc_sync>
    80007804:	ff010113          	addi	sp,sp,-16
    80007808:	00113423          	sd	ra,8(sp)
    8000780c:	00813023          	sd	s0,0(sp)
    80007810:	01010413          	addi	s0,sp,16
    80007814:	00800513          	li	a0,8
    80007818:	00001097          	auipc	ra,0x1
    8000781c:	9d8080e7          	jalr	-1576(ra) # 800081f0 <uartputc_sync>
    80007820:	02000513          	li	a0,32
    80007824:	00001097          	auipc	ra,0x1
    80007828:	9cc080e7          	jalr	-1588(ra) # 800081f0 <uartputc_sync>
    8000782c:	00013403          	ld	s0,0(sp)
    80007830:	00813083          	ld	ra,8(sp)
    80007834:	00800513          	li	a0,8
    80007838:	01010113          	addi	sp,sp,16
    8000783c:	00001317          	auipc	t1,0x1
    80007840:	9b430067          	jr	-1612(t1) # 800081f0 <uartputc_sync>

0000000080007844 <consoleintr>:
    80007844:	fe010113          	addi	sp,sp,-32
    80007848:	00813823          	sd	s0,16(sp)
    8000784c:	00913423          	sd	s1,8(sp)
    80007850:	01213023          	sd	s2,0(sp)
    80007854:	00113c23          	sd	ra,24(sp)
    80007858:	02010413          	addi	s0,sp,32
    8000785c:	00005917          	auipc	s2,0x5
    80007860:	26c90913          	addi	s2,s2,620 # 8000cac8 <cons>
    80007864:	00050493          	mv	s1,a0
    80007868:	00090513          	mv	a0,s2
    8000786c:	00001097          	auipc	ra,0x1
    80007870:	e40080e7          	jalr	-448(ra) # 800086ac <acquire>
    80007874:	02048c63          	beqz	s1,800078ac <consoleintr+0x68>
    80007878:	0a092783          	lw	a5,160(s2)
    8000787c:	09892703          	lw	a4,152(s2)
    80007880:	07f00693          	li	a3,127
    80007884:	40e7873b          	subw	a4,a5,a4
    80007888:	02e6e263          	bltu	a3,a4,800078ac <consoleintr+0x68>
    8000788c:	00d00713          	li	a4,13
    80007890:	04e48063          	beq	s1,a4,800078d0 <consoleintr+0x8c>
    80007894:	07f7f713          	andi	a4,a5,127
    80007898:	00e90733          	add	a4,s2,a4
    8000789c:	0017879b          	addiw	a5,a5,1
    800078a0:	0af92023          	sw	a5,160(s2)
    800078a4:	00970c23          	sb	s1,24(a4)
    800078a8:	08f92e23          	sw	a5,156(s2)
    800078ac:	01013403          	ld	s0,16(sp)
    800078b0:	01813083          	ld	ra,24(sp)
    800078b4:	00813483          	ld	s1,8(sp)
    800078b8:	00013903          	ld	s2,0(sp)
    800078bc:	00005517          	auipc	a0,0x5
    800078c0:	20c50513          	addi	a0,a0,524 # 8000cac8 <cons>
    800078c4:	02010113          	addi	sp,sp,32
    800078c8:	00001317          	auipc	t1,0x1
    800078cc:	eb030067          	jr	-336(t1) # 80008778 <release>
    800078d0:	00a00493          	li	s1,10
    800078d4:	fc1ff06f          	j	80007894 <consoleintr+0x50>

00000000800078d8 <consoleinit>:
    800078d8:	fe010113          	addi	sp,sp,-32
    800078dc:	00113c23          	sd	ra,24(sp)
    800078e0:	00813823          	sd	s0,16(sp)
    800078e4:	00913423          	sd	s1,8(sp)
    800078e8:	02010413          	addi	s0,sp,32
    800078ec:	00005497          	auipc	s1,0x5
    800078f0:	1dc48493          	addi	s1,s1,476 # 8000cac8 <cons>
    800078f4:	00048513          	mv	a0,s1
    800078f8:	00002597          	auipc	a1,0x2
    800078fc:	de858593          	addi	a1,a1,-536 # 800096e0 <_ZZ18kernelPrintIntegermE6digits+0x6c0>
    80007900:	00001097          	auipc	ra,0x1
    80007904:	d88080e7          	jalr	-632(ra) # 80008688 <initlock>
    80007908:	00000097          	auipc	ra,0x0
    8000790c:	7ac080e7          	jalr	1964(ra) # 800080b4 <uartinit>
    80007910:	01813083          	ld	ra,24(sp)
    80007914:	01013403          	ld	s0,16(sp)
    80007918:	00000797          	auipc	a5,0x0
    8000791c:	d9c78793          	addi	a5,a5,-612 # 800076b4 <consoleread>
    80007920:	0af4bc23          	sd	a5,184(s1)
    80007924:	00000797          	auipc	a5,0x0
    80007928:	cec78793          	addi	a5,a5,-788 # 80007610 <consolewrite>
    8000792c:	0cf4b023          	sd	a5,192(s1)
    80007930:	00813483          	ld	s1,8(sp)
    80007934:	02010113          	addi	sp,sp,32
    80007938:	00008067          	ret

000000008000793c <console_read>:
    8000793c:	ff010113          	addi	sp,sp,-16
    80007940:	00813423          	sd	s0,8(sp)
    80007944:	01010413          	addi	s0,sp,16
    80007948:	00813403          	ld	s0,8(sp)
    8000794c:	00005317          	auipc	t1,0x5
    80007950:	23433303          	ld	t1,564(t1) # 8000cb80 <devsw+0x10>
    80007954:	01010113          	addi	sp,sp,16
    80007958:	00030067          	jr	t1

000000008000795c <console_write>:
    8000795c:	ff010113          	addi	sp,sp,-16
    80007960:	00813423          	sd	s0,8(sp)
    80007964:	01010413          	addi	s0,sp,16
    80007968:	00813403          	ld	s0,8(sp)
    8000796c:	00005317          	auipc	t1,0x5
    80007970:	21c33303          	ld	t1,540(t1) # 8000cb88 <devsw+0x18>
    80007974:	01010113          	addi	sp,sp,16
    80007978:	00030067          	jr	t1

000000008000797c <panic>:
    8000797c:	fe010113          	addi	sp,sp,-32
    80007980:	00113c23          	sd	ra,24(sp)
    80007984:	00813823          	sd	s0,16(sp)
    80007988:	00913423          	sd	s1,8(sp)
    8000798c:	02010413          	addi	s0,sp,32
    80007990:	00050493          	mv	s1,a0
    80007994:	00002517          	auipc	a0,0x2
    80007998:	d5450513          	addi	a0,a0,-684 # 800096e8 <_ZZ18kernelPrintIntegermE6digits+0x6c8>
    8000799c:	00005797          	auipc	a5,0x5
    800079a0:	2807a623          	sw	zero,652(a5) # 8000cc28 <pr+0x18>
    800079a4:	00000097          	auipc	ra,0x0
    800079a8:	034080e7          	jalr	52(ra) # 800079d8 <__printf>
    800079ac:	00048513          	mv	a0,s1
    800079b0:	00000097          	auipc	ra,0x0
    800079b4:	028080e7          	jalr	40(ra) # 800079d8 <__printf>
    800079b8:	00002517          	auipc	a0,0x2
    800079bc:	ab850513          	addi	a0,a0,-1352 # 80009470 <_ZZ18kernelPrintIntegermE6digits+0x450>
    800079c0:	00000097          	auipc	ra,0x0
    800079c4:	018080e7          	jalr	24(ra) # 800079d8 <__printf>
    800079c8:	00100793          	li	a5,1
    800079cc:	00004717          	auipc	a4,0x4
    800079d0:	f6f72623          	sw	a5,-148(a4) # 8000b938 <panicked>
    800079d4:	0000006f          	j	800079d4 <panic+0x58>

00000000800079d8 <__printf>:
    800079d8:	f3010113          	addi	sp,sp,-208
    800079dc:	08813023          	sd	s0,128(sp)
    800079e0:	07313423          	sd	s3,104(sp)
    800079e4:	09010413          	addi	s0,sp,144
    800079e8:	05813023          	sd	s8,64(sp)
    800079ec:	08113423          	sd	ra,136(sp)
    800079f0:	06913c23          	sd	s1,120(sp)
    800079f4:	07213823          	sd	s2,112(sp)
    800079f8:	07413023          	sd	s4,96(sp)
    800079fc:	05513c23          	sd	s5,88(sp)
    80007a00:	05613823          	sd	s6,80(sp)
    80007a04:	05713423          	sd	s7,72(sp)
    80007a08:	03913c23          	sd	s9,56(sp)
    80007a0c:	03a13823          	sd	s10,48(sp)
    80007a10:	03b13423          	sd	s11,40(sp)
    80007a14:	00005317          	auipc	t1,0x5
    80007a18:	1fc30313          	addi	t1,t1,508 # 8000cc10 <pr>
    80007a1c:	01832c03          	lw	s8,24(t1)
    80007a20:	00b43423          	sd	a1,8(s0)
    80007a24:	00c43823          	sd	a2,16(s0)
    80007a28:	00d43c23          	sd	a3,24(s0)
    80007a2c:	02e43023          	sd	a4,32(s0)
    80007a30:	02f43423          	sd	a5,40(s0)
    80007a34:	03043823          	sd	a6,48(s0)
    80007a38:	03143c23          	sd	a7,56(s0)
    80007a3c:	00050993          	mv	s3,a0
    80007a40:	4a0c1663          	bnez	s8,80007eec <__printf+0x514>
    80007a44:	60098c63          	beqz	s3,8000805c <__printf+0x684>
    80007a48:	0009c503          	lbu	a0,0(s3)
    80007a4c:	00840793          	addi	a5,s0,8
    80007a50:	f6f43c23          	sd	a5,-136(s0)
    80007a54:	00000493          	li	s1,0
    80007a58:	22050063          	beqz	a0,80007c78 <__printf+0x2a0>
    80007a5c:	00002a37          	lui	s4,0x2
    80007a60:	00018ab7          	lui	s5,0x18
    80007a64:	000f4b37          	lui	s6,0xf4
    80007a68:	00989bb7          	lui	s7,0x989
    80007a6c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007a70:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007a74:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007a78:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80007a7c:	00148c9b          	addiw	s9,s1,1
    80007a80:	02500793          	li	a5,37
    80007a84:	01998933          	add	s2,s3,s9
    80007a88:	38f51263          	bne	a0,a5,80007e0c <__printf+0x434>
    80007a8c:	00094783          	lbu	a5,0(s2)
    80007a90:	00078c9b          	sext.w	s9,a5
    80007a94:	1e078263          	beqz	a5,80007c78 <__printf+0x2a0>
    80007a98:	0024849b          	addiw	s1,s1,2
    80007a9c:	07000713          	li	a4,112
    80007aa0:	00998933          	add	s2,s3,s1
    80007aa4:	38e78a63          	beq	a5,a4,80007e38 <__printf+0x460>
    80007aa8:	20f76863          	bltu	a4,a5,80007cb8 <__printf+0x2e0>
    80007aac:	42a78863          	beq	a5,a0,80007edc <__printf+0x504>
    80007ab0:	06400713          	li	a4,100
    80007ab4:	40e79663          	bne	a5,a4,80007ec0 <__printf+0x4e8>
    80007ab8:	f7843783          	ld	a5,-136(s0)
    80007abc:	0007a603          	lw	a2,0(a5)
    80007ac0:	00878793          	addi	a5,a5,8
    80007ac4:	f6f43c23          	sd	a5,-136(s0)
    80007ac8:	42064a63          	bltz	a2,80007efc <__printf+0x524>
    80007acc:	00a00713          	li	a4,10
    80007ad0:	02e677bb          	remuw	a5,a2,a4
    80007ad4:	00002d97          	auipc	s11,0x2
    80007ad8:	c3cd8d93          	addi	s11,s11,-964 # 80009710 <digits>
    80007adc:	00900593          	li	a1,9
    80007ae0:	0006051b          	sext.w	a0,a2
    80007ae4:	00000c93          	li	s9,0
    80007ae8:	02079793          	slli	a5,a5,0x20
    80007aec:	0207d793          	srli	a5,a5,0x20
    80007af0:	00fd87b3          	add	a5,s11,a5
    80007af4:	0007c783          	lbu	a5,0(a5)
    80007af8:	02e656bb          	divuw	a3,a2,a4
    80007afc:	f8f40023          	sb	a5,-128(s0)
    80007b00:	14c5d863          	bge	a1,a2,80007c50 <__printf+0x278>
    80007b04:	06300593          	li	a1,99
    80007b08:	00100c93          	li	s9,1
    80007b0c:	02e6f7bb          	remuw	a5,a3,a4
    80007b10:	02079793          	slli	a5,a5,0x20
    80007b14:	0207d793          	srli	a5,a5,0x20
    80007b18:	00fd87b3          	add	a5,s11,a5
    80007b1c:	0007c783          	lbu	a5,0(a5)
    80007b20:	02e6d73b          	divuw	a4,a3,a4
    80007b24:	f8f400a3          	sb	a5,-127(s0)
    80007b28:	12a5f463          	bgeu	a1,a0,80007c50 <__printf+0x278>
    80007b2c:	00a00693          	li	a3,10
    80007b30:	00900593          	li	a1,9
    80007b34:	02d777bb          	remuw	a5,a4,a3
    80007b38:	02079793          	slli	a5,a5,0x20
    80007b3c:	0207d793          	srli	a5,a5,0x20
    80007b40:	00fd87b3          	add	a5,s11,a5
    80007b44:	0007c503          	lbu	a0,0(a5)
    80007b48:	02d757bb          	divuw	a5,a4,a3
    80007b4c:	f8a40123          	sb	a0,-126(s0)
    80007b50:	48e5f263          	bgeu	a1,a4,80007fd4 <__printf+0x5fc>
    80007b54:	06300513          	li	a0,99
    80007b58:	02d7f5bb          	remuw	a1,a5,a3
    80007b5c:	02059593          	slli	a1,a1,0x20
    80007b60:	0205d593          	srli	a1,a1,0x20
    80007b64:	00bd85b3          	add	a1,s11,a1
    80007b68:	0005c583          	lbu	a1,0(a1)
    80007b6c:	02d7d7bb          	divuw	a5,a5,a3
    80007b70:	f8b401a3          	sb	a1,-125(s0)
    80007b74:	48e57263          	bgeu	a0,a4,80007ff8 <__printf+0x620>
    80007b78:	3e700513          	li	a0,999
    80007b7c:	02d7f5bb          	remuw	a1,a5,a3
    80007b80:	02059593          	slli	a1,a1,0x20
    80007b84:	0205d593          	srli	a1,a1,0x20
    80007b88:	00bd85b3          	add	a1,s11,a1
    80007b8c:	0005c583          	lbu	a1,0(a1)
    80007b90:	02d7d7bb          	divuw	a5,a5,a3
    80007b94:	f8b40223          	sb	a1,-124(s0)
    80007b98:	46e57663          	bgeu	a0,a4,80008004 <__printf+0x62c>
    80007b9c:	02d7f5bb          	remuw	a1,a5,a3
    80007ba0:	02059593          	slli	a1,a1,0x20
    80007ba4:	0205d593          	srli	a1,a1,0x20
    80007ba8:	00bd85b3          	add	a1,s11,a1
    80007bac:	0005c583          	lbu	a1,0(a1)
    80007bb0:	02d7d7bb          	divuw	a5,a5,a3
    80007bb4:	f8b402a3          	sb	a1,-123(s0)
    80007bb8:	46ea7863          	bgeu	s4,a4,80008028 <__printf+0x650>
    80007bbc:	02d7f5bb          	remuw	a1,a5,a3
    80007bc0:	02059593          	slli	a1,a1,0x20
    80007bc4:	0205d593          	srli	a1,a1,0x20
    80007bc8:	00bd85b3          	add	a1,s11,a1
    80007bcc:	0005c583          	lbu	a1,0(a1)
    80007bd0:	02d7d7bb          	divuw	a5,a5,a3
    80007bd4:	f8b40323          	sb	a1,-122(s0)
    80007bd8:	3eeaf863          	bgeu	s5,a4,80007fc8 <__printf+0x5f0>
    80007bdc:	02d7f5bb          	remuw	a1,a5,a3
    80007be0:	02059593          	slli	a1,a1,0x20
    80007be4:	0205d593          	srli	a1,a1,0x20
    80007be8:	00bd85b3          	add	a1,s11,a1
    80007bec:	0005c583          	lbu	a1,0(a1)
    80007bf0:	02d7d7bb          	divuw	a5,a5,a3
    80007bf4:	f8b403a3          	sb	a1,-121(s0)
    80007bf8:	42eb7e63          	bgeu	s6,a4,80008034 <__printf+0x65c>
    80007bfc:	02d7f5bb          	remuw	a1,a5,a3
    80007c00:	02059593          	slli	a1,a1,0x20
    80007c04:	0205d593          	srli	a1,a1,0x20
    80007c08:	00bd85b3          	add	a1,s11,a1
    80007c0c:	0005c583          	lbu	a1,0(a1)
    80007c10:	02d7d7bb          	divuw	a5,a5,a3
    80007c14:	f8b40423          	sb	a1,-120(s0)
    80007c18:	42ebfc63          	bgeu	s7,a4,80008050 <__printf+0x678>
    80007c1c:	02079793          	slli	a5,a5,0x20
    80007c20:	0207d793          	srli	a5,a5,0x20
    80007c24:	00fd8db3          	add	s11,s11,a5
    80007c28:	000dc703          	lbu	a4,0(s11)
    80007c2c:	00a00793          	li	a5,10
    80007c30:	00900c93          	li	s9,9
    80007c34:	f8e404a3          	sb	a4,-119(s0)
    80007c38:	00065c63          	bgez	a2,80007c50 <__printf+0x278>
    80007c3c:	f9040713          	addi	a4,s0,-112
    80007c40:	00f70733          	add	a4,a4,a5
    80007c44:	02d00693          	li	a3,45
    80007c48:	fed70823          	sb	a3,-16(a4)
    80007c4c:	00078c93          	mv	s9,a5
    80007c50:	f8040793          	addi	a5,s0,-128
    80007c54:	01978cb3          	add	s9,a5,s9
    80007c58:	f7f40d13          	addi	s10,s0,-129
    80007c5c:	000cc503          	lbu	a0,0(s9)
    80007c60:	fffc8c93          	addi	s9,s9,-1
    80007c64:	00000097          	auipc	ra,0x0
    80007c68:	b90080e7          	jalr	-1136(ra) # 800077f4 <consputc>
    80007c6c:	ffac98e3          	bne	s9,s10,80007c5c <__printf+0x284>
    80007c70:	00094503          	lbu	a0,0(s2)
    80007c74:	e00514e3          	bnez	a0,80007a7c <__printf+0xa4>
    80007c78:	1a0c1663          	bnez	s8,80007e24 <__printf+0x44c>
    80007c7c:	08813083          	ld	ra,136(sp)
    80007c80:	08013403          	ld	s0,128(sp)
    80007c84:	07813483          	ld	s1,120(sp)
    80007c88:	07013903          	ld	s2,112(sp)
    80007c8c:	06813983          	ld	s3,104(sp)
    80007c90:	06013a03          	ld	s4,96(sp)
    80007c94:	05813a83          	ld	s5,88(sp)
    80007c98:	05013b03          	ld	s6,80(sp)
    80007c9c:	04813b83          	ld	s7,72(sp)
    80007ca0:	04013c03          	ld	s8,64(sp)
    80007ca4:	03813c83          	ld	s9,56(sp)
    80007ca8:	03013d03          	ld	s10,48(sp)
    80007cac:	02813d83          	ld	s11,40(sp)
    80007cb0:	0d010113          	addi	sp,sp,208
    80007cb4:	00008067          	ret
    80007cb8:	07300713          	li	a4,115
    80007cbc:	1ce78a63          	beq	a5,a4,80007e90 <__printf+0x4b8>
    80007cc0:	07800713          	li	a4,120
    80007cc4:	1ee79e63          	bne	a5,a4,80007ec0 <__printf+0x4e8>
    80007cc8:	f7843783          	ld	a5,-136(s0)
    80007ccc:	0007a703          	lw	a4,0(a5)
    80007cd0:	00878793          	addi	a5,a5,8
    80007cd4:	f6f43c23          	sd	a5,-136(s0)
    80007cd8:	28074263          	bltz	a4,80007f5c <__printf+0x584>
    80007cdc:	00002d97          	auipc	s11,0x2
    80007ce0:	a34d8d93          	addi	s11,s11,-1484 # 80009710 <digits>
    80007ce4:	00f77793          	andi	a5,a4,15
    80007ce8:	00fd87b3          	add	a5,s11,a5
    80007cec:	0007c683          	lbu	a3,0(a5)
    80007cf0:	00f00613          	li	a2,15
    80007cf4:	0007079b          	sext.w	a5,a4
    80007cf8:	f8d40023          	sb	a3,-128(s0)
    80007cfc:	0047559b          	srliw	a1,a4,0x4
    80007d00:	0047569b          	srliw	a3,a4,0x4
    80007d04:	00000c93          	li	s9,0
    80007d08:	0ee65063          	bge	a2,a4,80007de8 <__printf+0x410>
    80007d0c:	00f6f693          	andi	a3,a3,15
    80007d10:	00dd86b3          	add	a3,s11,a3
    80007d14:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007d18:	0087d79b          	srliw	a5,a5,0x8
    80007d1c:	00100c93          	li	s9,1
    80007d20:	f8d400a3          	sb	a3,-127(s0)
    80007d24:	0cb67263          	bgeu	a2,a1,80007de8 <__printf+0x410>
    80007d28:	00f7f693          	andi	a3,a5,15
    80007d2c:	00dd86b3          	add	a3,s11,a3
    80007d30:	0006c583          	lbu	a1,0(a3)
    80007d34:	00f00613          	li	a2,15
    80007d38:	0047d69b          	srliw	a3,a5,0x4
    80007d3c:	f8b40123          	sb	a1,-126(s0)
    80007d40:	0047d593          	srli	a1,a5,0x4
    80007d44:	28f67e63          	bgeu	a2,a5,80007fe0 <__printf+0x608>
    80007d48:	00f6f693          	andi	a3,a3,15
    80007d4c:	00dd86b3          	add	a3,s11,a3
    80007d50:	0006c503          	lbu	a0,0(a3)
    80007d54:	0087d813          	srli	a6,a5,0x8
    80007d58:	0087d69b          	srliw	a3,a5,0x8
    80007d5c:	f8a401a3          	sb	a0,-125(s0)
    80007d60:	28b67663          	bgeu	a2,a1,80007fec <__printf+0x614>
    80007d64:	00f6f693          	andi	a3,a3,15
    80007d68:	00dd86b3          	add	a3,s11,a3
    80007d6c:	0006c583          	lbu	a1,0(a3)
    80007d70:	00c7d513          	srli	a0,a5,0xc
    80007d74:	00c7d69b          	srliw	a3,a5,0xc
    80007d78:	f8b40223          	sb	a1,-124(s0)
    80007d7c:	29067a63          	bgeu	a2,a6,80008010 <__printf+0x638>
    80007d80:	00f6f693          	andi	a3,a3,15
    80007d84:	00dd86b3          	add	a3,s11,a3
    80007d88:	0006c583          	lbu	a1,0(a3)
    80007d8c:	0107d813          	srli	a6,a5,0x10
    80007d90:	0107d69b          	srliw	a3,a5,0x10
    80007d94:	f8b402a3          	sb	a1,-123(s0)
    80007d98:	28a67263          	bgeu	a2,a0,8000801c <__printf+0x644>
    80007d9c:	00f6f693          	andi	a3,a3,15
    80007da0:	00dd86b3          	add	a3,s11,a3
    80007da4:	0006c683          	lbu	a3,0(a3)
    80007da8:	0147d79b          	srliw	a5,a5,0x14
    80007dac:	f8d40323          	sb	a3,-122(s0)
    80007db0:	21067663          	bgeu	a2,a6,80007fbc <__printf+0x5e4>
    80007db4:	02079793          	slli	a5,a5,0x20
    80007db8:	0207d793          	srli	a5,a5,0x20
    80007dbc:	00fd8db3          	add	s11,s11,a5
    80007dc0:	000dc683          	lbu	a3,0(s11)
    80007dc4:	00800793          	li	a5,8
    80007dc8:	00700c93          	li	s9,7
    80007dcc:	f8d403a3          	sb	a3,-121(s0)
    80007dd0:	00075c63          	bgez	a4,80007de8 <__printf+0x410>
    80007dd4:	f9040713          	addi	a4,s0,-112
    80007dd8:	00f70733          	add	a4,a4,a5
    80007ddc:	02d00693          	li	a3,45
    80007de0:	fed70823          	sb	a3,-16(a4)
    80007de4:	00078c93          	mv	s9,a5
    80007de8:	f8040793          	addi	a5,s0,-128
    80007dec:	01978cb3          	add	s9,a5,s9
    80007df0:	f7f40d13          	addi	s10,s0,-129
    80007df4:	000cc503          	lbu	a0,0(s9)
    80007df8:	fffc8c93          	addi	s9,s9,-1
    80007dfc:	00000097          	auipc	ra,0x0
    80007e00:	9f8080e7          	jalr	-1544(ra) # 800077f4 <consputc>
    80007e04:	ff9d18e3          	bne	s10,s9,80007df4 <__printf+0x41c>
    80007e08:	0100006f          	j	80007e18 <__printf+0x440>
    80007e0c:	00000097          	auipc	ra,0x0
    80007e10:	9e8080e7          	jalr	-1560(ra) # 800077f4 <consputc>
    80007e14:	000c8493          	mv	s1,s9
    80007e18:	00094503          	lbu	a0,0(s2)
    80007e1c:	c60510e3          	bnez	a0,80007a7c <__printf+0xa4>
    80007e20:	e40c0ee3          	beqz	s8,80007c7c <__printf+0x2a4>
    80007e24:	00005517          	auipc	a0,0x5
    80007e28:	dec50513          	addi	a0,a0,-532 # 8000cc10 <pr>
    80007e2c:	00001097          	auipc	ra,0x1
    80007e30:	94c080e7          	jalr	-1716(ra) # 80008778 <release>
    80007e34:	e49ff06f          	j	80007c7c <__printf+0x2a4>
    80007e38:	f7843783          	ld	a5,-136(s0)
    80007e3c:	03000513          	li	a0,48
    80007e40:	01000d13          	li	s10,16
    80007e44:	00878713          	addi	a4,a5,8
    80007e48:	0007bc83          	ld	s9,0(a5)
    80007e4c:	f6e43c23          	sd	a4,-136(s0)
    80007e50:	00000097          	auipc	ra,0x0
    80007e54:	9a4080e7          	jalr	-1628(ra) # 800077f4 <consputc>
    80007e58:	07800513          	li	a0,120
    80007e5c:	00000097          	auipc	ra,0x0
    80007e60:	998080e7          	jalr	-1640(ra) # 800077f4 <consputc>
    80007e64:	00002d97          	auipc	s11,0x2
    80007e68:	8acd8d93          	addi	s11,s11,-1876 # 80009710 <digits>
    80007e6c:	03ccd793          	srli	a5,s9,0x3c
    80007e70:	00fd87b3          	add	a5,s11,a5
    80007e74:	0007c503          	lbu	a0,0(a5)
    80007e78:	fffd0d1b          	addiw	s10,s10,-1
    80007e7c:	004c9c93          	slli	s9,s9,0x4
    80007e80:	00000097          	auipc	ra,0x0
    80007e84:	974080e7          	jalr	-1676(ra) # 800077f4 <consputc>
    80007e88:	fe0d12e3          	bnez	s10,80007e6c <__printf+0x494>
    80007e8c:	f8dff06f          	j	80007e18 <__printf+0x440>
    80007e90:	f7843783          	ld	a5,-136(s0)
    80007e94:	0007bc83          	ld	s9,0(a5)
    80007e98:	00878793          	addi	a5,a5,8
    80007e9c:	f6f43c23          	sd	a5,-136(s0)
    80007ea0:	000c9a63          	bnez	s9,80007eb4 <__printf+0x4dc>
    80007ea4:	1080006f          	j	80007fac <__printf+0x5d4>
    80007ea8:	001c8c93          	addi	s9,s9,1
    80007eac:	00000097          	auipc	ra,0x0
    80007eb0:	948080e7          	jalr	-1720(ra) # 800077f4 <consputc>
    80007eb4:	000cc503          	lbu	a0,0(s9)
    80007eb8:	fe0518e3          	bnez	a0,80007ea8 <__printf+0x4d0>
    80007ebc:	f5dff06f          	j	80007e18 <__printf+0x440>
    80007ec0:	02500513          	li	a0,37
    80007ec4:	00000097          	auipc	ra,0x0
    80007ec8:	930080e7          	jalr	-1744(ra) # 800077f4 <consputc>
    80007ecc:	000c8513          	mv	a0,s9
    80007ed0:	00000097          	auipc	ra,0x0
    80007ed4:	924080e7          	jalr	-1756(ra) # 800077f4 <consputc>
    80007ed8:	f41ff06f          	j	80007e18 <__printf+0x440>
    80007edc:	02500513          	li	a0,37
    80007ee0:	00000097          	auipc	ra,0x0
    80007ee4:	914080e7          	jalr	-1772(ra) # 800077f4 <consputc>
    80007ee8:	f31ff06f          	j	80007e18 <__printf+0x440>
    80007eec:	00030513          	mv	a0,t1
    80007ef0:	00000097          	auipc	ra,0x0
    80007ef4:	7bc080e7          	jalr	1980(ra) # 800086ac <acquire>
    80007ef8:	b4dff06f          	j	80007a44 <__printf+0x6c>
    80007efc:	40c0053b          	negw	a0,a2
    80007f00:	00a00713          	li	a4,10
    80007f04:	02e576bb          	remuw	a3,a0,a4
    80007f08:	00002d97          	auipc	s11,0x2
    80007f0c:	808d8d93          	addi	s11,s11,-2040 # 80009710 <digits>
    80007f10:	ff700593          	li	a1,-9
    80007f14:	02069693          	slli	a3,a3,0x20
    80007f18:	0206d693          	srli	a3,a3,0x20
    80007f1c:	00dd86b3          	add	a3,s11,a3
    80007f20:	0006c683          	lbu	a3,0(a3)
    80007f24:	02e557bb          	divuw	a5,a0,a4
    80007f28:	f8d40023          	sb	a3,-128(s0)
    80007f2c:	10b65e63          	bge	a2,a1,80008048 <__printf+0x670>
    80007f30:	06300593          	li	a1,99
    80007f34:	02e7f6bb          	remuw	a3,a5,a4
    80007f38:	02069693          	slli	a3,a3,0x20
    80007f3c:	0206d693          	srli	a3,a3,0x20
    80007f40:	00dd86b3          	add	a3,s11,a3
    80007f44:	0006c683          	lbu	a3,0(a3)
    80007f48:	02e7d73b          	divuw	a4,a5,a4
    80007f4c:	00200793          	li	a5,2
    80007f50:	f8d400a3          	sb	a3,-127(s0)
    80007f54:	bca5ece3          	bltu	a1,a0,80007b2c <__printf+0x154>
    80007f58:	ce5ff06f          	j	80007c3c <__printf+0x264>
    80007f5c:	40e007bb          	negw	a5,a4
    80007f60:	00001d97          	auipc	s11,0x1
    80007f64:	7b0d8d93          	addi	s11,s11,1968 # 80009710 <digits>
    80007f68:	00f7f693          	andi	a3,a5,15
    80007f6c:	00dd86b3          	add	a3,s11,a3
    80007f70:	0006c583          	lbu	a1,0(a3)
    80007f74:	ff100613          	li	a2,-15
    80007f78:	0047d69b          	srliw	a3,a5,0x4
    80007f7c:	f8b40023          	sb	a1,-128(s0)
    80007f80:	0047d59b          	srliw	a1,a5,0x4
    80007f84:	0ac75e63          	bge	a4,a2,80008040 <__printf+0x668>
    80007f88:	00f6f693          	andi	a3,a3,15
    80007f8c:	00dd86b3          	add	a3,s11,a3
    80007f90:	0006c603          	lbu	a2,0(a3)
    80007f94:	00f00693          	li	a3,15
    80007f98:	0087d79b          	srliw	a5,a5,0x8
    80007f9c:	f8c400a3          	sb	a2,-127(s0)
    80007fa0:	d8b6e4e3          	bltu	a3,a1,80007d28 <__printf+0x350>
    80007fa4:	00200793          	li	a5,2
    80007fa8:	e2dff06f          	j	80007dd4 <__printf+0x3fc>
    80007fac:	00001c97          	auipc	s9,0x1
    80007fb0:	744c8c93          	addi	s9,s9,1860 # 800096f0 <_ZZ18kernelPrintIntegermE6digits+0x6d0>
    80007fb4:	02800513          	li	a0,40
    80007fb8:	ef1ff06f          	j	80007ea8 <__printf+0x4d0>
    80007fbc:	00700793          	li	a5,7
    80007fc0:	00600c93          	li	s9,6
    80007fc4:	e0dff06f          	j	80007dd0 <__printf+0x3f8>
    80007fc8:	00700793          	li	a5,7
    80007fcc:	00600c93          	li	s9,6
    80007fd0:	c69ff06f          	j	80007c38 <__printf+0x260>
    80007fd4:	00300793          	li	a5,3
    80007fd8:	00200c93          	li	s9,2
    80007fdc:	c5dff06f          	j	80007c38 <__printf+0x260>
    80007fe0:	00300793          	li	a5,3
    80007fe4:	00200c93          	li	s9,2
    80007fe8:	de9ff06f          	j	80007dd0 <__printf+0x3f8>
    80007fec:	00400793          	li	a5,4
    80007ff0:	00300c93          	li	s9,3
    80007ff4:	dddff06f          	j	80007dd0 <__printf+0x3f8>
    80007ff8:	00400793          	li	a5,4
    80007ffc:	00300c93          	li	s9,3
    80008000:	c39ff06f          	j	80007c38 <__printf+0x260>
    80008004:	00500793          	li	a5,5
    80008008:	00400c93          	li	s9,4
    8000800c:	c2dff06f          	j	80007c38 <__printf+0x260>
    80008010:	00500793          	li	a5,5
    80008014:	00400c93          	li	s9,4
    80008018:	db9ff06f          	j	80007dd0 <__printf+0x3f8>
    8000801c:	00600793          	li	a5,6
    80008020:	00500c93          	li	s9,5
    80008024:	dadff06f          	j	80007dd0 <__printf+0x3f8>
    80008028:	00600793          	li	a5,6
    8000802c:	00500c93          	li	s9,5
    80008030:	c09ff06f          	j	80007c38 <__printf+0x260>
    80008034:	00800793          	li	a5,8
    80008038:	00700c93          	li	s9,7
    8000803c:	bfdff06f          	j	80007c38 <__printf+0x260>
    80008040:	00100793          	li	a5,1
    80008044:	d91ff06f          	j	80007dd4 <__printf+0x3fc>
    80008048:	00100793          	li	a5,1
    8000804c:	bf1ff06f          	j	80007c3c <__printf+0x264>
    80008050:	00900793          	li	a5,9
    80008054:	00800c93          	li	s9,8
    80008058:	be1ff06f          	j	80007c38 <__printf+0x260>
    8000805c:	00001517          	auipc	a0,0x1
    80008060:	69c50513          	addi	a0,a0,1692 # 800096f8 <_ZZ18kernelPrintIntegermE6digits+0x6d8>
    80008064:	00000097          	auipc	ra,0x0
    80008068:	918080e7          	jalr	-1768(ra) # 8000797c <panic>

000000008000806c <printfinit>:
    8000806c:	fe010113          	addi	sp,sp,-32
    80008070:	00813823          	sd	s0,16(sp)
    80008074:	00913423          	sd	s1,8(sp)
    80008078:	00113c23          	sd	ra,24(sp)
    8000807c:	02010413          	addi	s0,sp,32
    80008080:	00005497          	auipc	s1,0x5
    80008084:	b9048493          	addi	s1,s1,-1136 # 8000cc10 <pr>
    80008088:	00048513          	mv	a0,s1
    8000808c:	00001597          	auipc	a1,0x1
    80008090:	67c58593          	addi	a1,a1,1660 # 80009708 <_ZZ18kernelPrintIntegermE6digits+0x6e8>
    80008094:	00000097          	auipc	ra,0x0
    80008098:	5f4080e7          	jalr	1524(ra) # 80008688 <initlock>
    8000809c:	01813083          	ld	ra,24(sp)
    800080a0:	01013403          	ld	s0,16(sp)
    800080a4:	0004ac23          	sw	zero,24(s1)
    800080a8:	00813483          	ld	s1,8(sp)
    800080ac:	02010113          	addi	sp,sp,32
    800080b0:	00008067          	ret

00000000800080b4 <uartinit>:
    800080b4:	ff010113          	addi	sp,sp,-16
    800080b8:	00813423          	sd	s0,8(sp)
    800080bc:	01010413          	addi	s0,sp,16
    800080c0:	100007b7          	lui	a5,0x10000
    800080c4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800080c8:	f8000713          	li	a4,-128
    800080cc:	00e781a3          	sb	a4,3(a5)
    800080d0:	00300713          	li	a4,3
    800080d4:	00e78023          	sb	a4,0(a5)
    800080d8:	000780a3          	sb	zero,1(a5)
    800080dc:	00e781a3          	sb	a4,3(a5)
    800080e0:	00700693          	li	a3,7
    800080e4:	00d78123          	sb	a3,2(a5)
    800080e8:	00e780a3          	sb	a4,1(a5)
    800080ec:	00813403          	ld	s0,8(sp)
    800080f0:	01010113          	addi	sp,sp,16
    800080f4:	00008067          	ret

00000000800080f8 <uartputc>:
    800080f8:	00004797          	auipc	a5,0x4
    800080fc:	8407a783          	lw	a5,-1984(a5) # 8000b938 <panicked>
    80008100:	00078463          	beqz	a5,80008108 <uartputc+0x10>
    80008104:	0000006f          	j	80008104 <uartputc+0xc>
    80008108:	fd010113          	addi	sp,sp,-48
    8000810c:	02813023          	sd	s0,32(sp)
    80008110:	00913c23          	sd	s1,24(sp)
    80008114:	01213823          	sd	s2,16(sp)
    80008118:	01313423          	sd	s3,8(sp)
    8000811c:	02113423          	sd	ra,40(sp)
    80008120:	03010413          	addi	s0,sp,48
    80008124:	00004917          	auipc	s2,0x4
    80008128:	81c90913          	addi	s2,s2,-2020 # 8000b940 <uart_tx_r>
    8000812c:	00093783          	ld	a5,0(s2)
    80008130:	00004497          	auipc	s1,0x4
    80008134:	81848493          	addi	s1,s1,-2024 # 8000b948 <uart_tx_w>
    80008138:	0004b703          	ld	a4,0(s1)
    8000813c:	02078693          	addi	a3,a5,32
    80008140:	00050993          	mv	s3,a0
    80008144:	02e69c63          	bne	a3,a4,8000817c <uartputc+0x84>
    80008148:	00001097          	auipc	ra,0x1
    8000814c:	834080e7          	jalr	-1996(ra) # 8000897c <push_on>
    80008150:	00093783          	ld	a5,0(s2)
    80008154:	0004b703          	ld	a4,0(s1)
    80008158:	02078793          	addi	a5,a5,32
    8000815c:	00e79463          	bne	a5,a4,80008164 <uartputc+0x6c>
    80008160:	0000006f          	j	80008160 <uartputc+0x68>
    80008164:	00001097          	auipc	ra,0x1
    80008168:	88c080e7          	jalr	-1908(ra) # 800089f0 <pop_on>
    8000816c:	00093783          	ld	a5,0(s2)
    80008170:	0004b703          	ld	a4,0(s1)
    80008174:	02078693          	addi	a3,a5,32
    80008178:	fce688e3          	beq	a3,a4,80008148 <uartputc+0x50>
    8000817c:	01f77693          	andi	a3,a4,31
    80008180:	00005597          	auipc	a1,0x5
    80008184:	ab058593          	addi	a1,a1,-1360 # 8000cc30 <uart_tx_buf>
    80008188:	00d586b3          	add	a3,a1,a3
    8000818c:	00170713          	addi	a4,a4,1
    80008190:	01368023          	sb	s3,0(a3)
    80008194:	00e4b023          	sd	a4,0(s1)
    80008198:	10000637          	lui	a2,0x10000
    8000819c:	02f71063          	bne	a4,a5,800081bc <uartputc+0xc4>
    800081a0:	0340006f          	j	800081d4 <uartputc+0xdc>
    800081a4:	00074703          	lbu	a4,0(a4)
    800081a8:	00f93023          	sd	a5,0(s2)
    800081ac:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    800081b0:	00093783          	ld	a5,0(s2)
    800081b4:	0004b703          	ld	a4,0(s1)
    800081b8:	00f70e63          	beq	a4,a5,800081d4 <uartputc+0xdc>
    800081bc:	00564683          	lbu	a3,5(a2)
    800081c0:	01f7f713          	andi	a4,a5,31
    800081c4:	00e58733          	add	a4,a1,a4
    800081c8:	0206f693          	andi	a3,a3,32
    800081cc:	00178793          	addi	a5,a5,1
    800081d0:	fc069ae3          	bnez	a3,800081a4 <uartputc+0xac>
    800081d4:	02813083          	ld	ra,40(sp)
    800081d8:	02013403          	ld	s0,32(sp)
    800081dc:	01813483          	ld	s1,24(sp)
    800081e0:	01013903          	ld	s2,16(sp)
    800081e4:	00813983          	ld	s3,8(sp)
    800081e8:	03010113          	addi	sp,sp,48
    800081ec:	00008067          	ret

00000000800081f0 <uartputc_sync>:
    800081f0:	ff010113          	addi	sp,sp,-16
    800081f4:	00813423          	sd	s0,8(sp)
    800081f8:	01010413          	addi	s0,sp,16
    800081fc:	00003717          	auipc	a4,0x3
    80008200:	73c72703          	lw	a4,1852(a4) # 8000b938 <panicked>
    80008204:	02071663          	bnez	a4,80008230 <uartputc_sync+0x40>
    80008208:	00050793          	mv	a5,a0
    8000820c:	100006b7          	lui	a3,0x10000
    80008210:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80008214:	02077713          	andi	a4,a4,32
    80008218:	fe070ce3          	beqz	a4,80008210 <uartputc_sync+0x20>
    8000821c:	0ff7f793          	andi	a5,a5,255
    80008220:	00f68023          	sb	a5,0(a3)
    80008224:	00813403          	ld	s0,8(sp)
    80008228:	01010113          	addi	sp,sp,16
    8000822c:	00008067          	ret
    80008230:	0000006f          	j	80008230 <uartputc_sync+0x40>

0000000080008234 <uartstart>:
    80008234:	ff010113          	addi	sp,sp,-16
    80008238:	00813423          	sd	s0,8(sp)
    8000823c:	01010413          	addi	s0,sp,16
    80008240:	00003617          	auipc	a2,0x3
    80008244:	70060613          	addi	a2,a2,1792 # 8000b940 <uart_tx_r>
    80008248:	00003517          	auipc	a0,0x3
    8000824c:	70050513          	addi	a0,a0,1792 # 8000b948 <uart_tx_w>
    80008250:	00063783          	ld	a5,0(a2)
    80008254:	00053703          	ld	a4,0(a0)
    80008258:	04f70263          	beq	a4,a5,8000829c <uartstart+0x68>
    8000825c:	100005b7          	lui	a1,0x10000
    80008260:	00005817          	auipc	a6,0x5
    80008264:	9d080813          	addi	a6,a6,-1584 # 8000cc30 <uart_tx_buf>
    80008268:	01c0006f          	j	80008284 <uartstart+0x50>
    8000826c:	0006c703          	lbu	a4,0(a3)
    80008270:	00f63023          	sd	a5,0(a2)
    80008274:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80008278:	00063783          	ld	a5,0(a2)
    8000827c:	00053703          	ld	a4,0(a0)
    80008280:	00f70e63          	beq	a4,a5,8000829c <uartstart+0x68>
    80008284:	01f7f713          	andi	a4,a5,31
    80008288:	00e806b3          	add	a3,a6,a4
    8000828c:	0055c703          	lbu	a4,5(a1)
    80008290:	00178793          	addi	a5,a5,1
    80008294:	02077713          	andi	a4,a4,32
    80008298:	fc071ae3          	bnez	a4,8000826c <uartstart+0x38>
    8000829c:	00813403          	ld	s0,8(sp)
    800082a0:	01010113          	addi	sp,sp,16
    800082a4:	00008067          	ret

00000000800082a8 <uartgetc>:
    800082a8:	ff010113          	addi	sp,sp,-16
    800082ac:	00813423          	sd	s0,8(sp)
    800082b0:	01010413          	addi	s0,sp,16
    800082b4:	10000737          	lui	a4,0x10000
    800082b8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    800082bc:	0017f793          	andi	a5,a5,1
    800082c0:	00078c63          	beqz	a5,800082d8 <uartgetc+0x30>
    800082c4:	00074503          	lbu	a0,0(a4)
    800082c8:	0ff57513          	andi	a0,a0,255
    800082cc:	00813403          	ld	s0,8(sp)
    800082d0:	01010113          	addi	sp,sp,16
    800082d4:	00008067          	ret
    800082d8:	fff00513          	li	a0,-1
    800082dc:	ff1ff06f          	j	800082cc <uartgetc+0x24>

00000000800082e0 <uartintr>:
    800082e0:	100007b7          	lui	a5,0x10000
    800082e4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    800082e8:	0017f793          	andi	a5,a5,1
    800082ec:	0a078463          	beqz	a5,80008394 <uartintr+0xb4>
    800082f0:	fe010113          	addi	sp,sp,-32
    800082f4:	00813823          	sd	s0,16(sp)
    800082f8:	00913423          	sd	s1,8(sp)
    800082fc:	00113c23          	sd	ra,24(sp)
    80008300:	02010413          	addi	s0,sp,32
    80008304:	100004b7          	lui	s1,0x10000
    80008308:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    8000830c:	0ff57513          	andi	a0,a0,255
    80008310:	fffff097          	auipc	ra,0xfffff
    80008314:	534080e7          	jalr	1332(ra) # 80007844 <consoleintr>
    80008318:	0054c783          	lbu	a5,5(s1)
    8000831c:	0017f793          	andi	a5,a5,1
    80008320:	fe0794e3          	bnez	a5,80008308 <uartintr+0x28>
    80008324:	00003617          	auipc	a2,0x3
    80008328:	61c60613          	addi	a2,a2,1564 # 8000b940 <uart_tx_r>
    8000832c:	00003517          	auipc	a0,0x3
    80008330:	61c50513          	addi	a0,a0,1564 # 8000b948 <uart_tx_w>
    80008334:	00063783          	ld	a5,0(a2)
    80008338:	00053703          	ld	a4,0(a0)
    8000833c:	04f70263          	beq	a4,a5,80008380 <uartintr+0xa0>
    80008340:	100005b7          	lui	a1,0x10000
    80008344:	00005817          	auipc	a6,0x5
    80008348:	8ec80813          	addi	a6,a6,-1812 # 8000cc30 <uart_tx_buf>
    8000834c:	01c0006f          	j	80008368 <uartintr+0x88>
    80008350:	0006c703          	lbu	a4,0(a3)
    80008354:	00f63023          	sd	a5,0(a2)
    80008358:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000835c:	00063783          	ld	a5,0(a2)
    80008360:	00053703          	ld	a4,0(a0)
    80008364:	00f70e63          	beq	a4,a5,80008380 <uartintr+0xa0>
    80008368:	01f7f713          	andi	a4,a5,31
    8000836c:	00e806b3          	add	a3,a6,a4
    80008370:	0055c703          	lbu	a4,5(a1)
    80008374:	00178793          	addi	a5,a5,1
    80008378:	02077713          	andi	a4,a4,32
    8000837c:	fc071ae3          	bnez	a4,80008350 <uartintr+0x70>
    80008380:	01813083          	ld	ra,24(sp)
    80008384:	01013403          	ld	s0,16(sp)
    80008388:	00813483          	ld	s1,8(sp)
    8000838c:	02010113          	addi	sp,sp,32
    80008390:	00008067          	ret
    80008394:	00003617          	auipc	a2,0x3
    80008398:	5ac60613          	addi	a2,a2,1452 # 8000b940 <uart_tx_r>
    8000839c:	00003517          	auipc	a0,0x3
    800083a0:	5ac50513          	addi	a0,a0,1452 # 8000b948 <uart_tx_w>
    800083a4:	00063783          	ld	a5,0(a2)
    800083a8:	00053703          	ld	a4,0(a0)
    800083ac:	04f70263          	beq	a4,a5,800083f0 <uartintr+0x110>
    800083b0:	100005b7          	lui	a1,0x10000
    800083b4:	00005817          	auipc	a6,0x5
    800083b8:	87c80813          	addi	a6,a6,-1924 # 8000cc30 <uart_tx_buf>
    800083bc:	01c0006f          	j	800083d8 <uartintr+0xf8>
    800083c0:	0006c703          	lbu	a4,0(a3)
    800083c4:	00f63023          	sd	a5,0(a2)
    800083c8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    800083cc:	00063783          	ld	a5,0(a2)
    800083d0:	00053703          	ld	a4,0(a0)
    800083d4:	02f70063          	beq	a4,a5,800083f4 <uartintr+0x114>
    800083d8:	01f7f713          	andi	a4,a5,31
    800083dc:	00e806b3          	add	a3,a6,a4
    800083e0:	0055c703          	lbu	a4,5(a1)
    800083e4:	00178793          	addi	a5,a5,1
    800083e8:	02077713          	andi	a4,a4,32
    800083ec:	fc071ae3          	bnez	a4,800083c0 <uartintr+0xe0>
    800083f0:	00008067          	ret
    800083f4:	00008067          	ret

00000000800083f8 <kinit>:
    800083f8:	fc010113          	addi	sp,sp,-64
    800083fc:	02913423          	sd	s1,40(sp)
    80008400:	fffff7b7          	lui	a5,0xfffff
    80008404:	00006497          	auipc	s1,0x6
    80008408:	84b48493          	addi	s1,s1,-1973 # 8000dc4f <end+0xfff>
    8000840c:	02813823          	sd	s0,48(sp)
    80008410:	01313c23          	sd	s3,24(sp)
    80008414:	00f4f4b3          	and	s1,s1,a5
    80008418:	02113c23          	sd	ra,56(sp)
    8000841c:	03213023          	sd	s2,32(sp)
    80008420:	01413823          	sd	s4,16(sp)
    80008424:	01513423          	sd	s5,8(sp)
    80008428:	04010413          	addi	s0,sp,64
    8000842c:	000017b7          	lui	a5,0x1
    80008430:	01100993          	li	s3,17
    80008434:	00f487b3          	add	a5,s1,a5
    80008438:	01b99993          	slli	s3,s3,0x1b
    8000843c:	06f9e063          	bltu	s3,a5,8000849c <kinit+0xa4>
    80008440:	00005a97          	auipc	s5,0x5
    80008444:	810a8a93          	addi	s5,s5,-2032 # 8000cc50 <end>
    80008448:	0754ec63          	bltu	s1,s5,800084c0 <kinit+0xc8>
    8000844c:	0734fa63          	bgeu	s1,s3,800084c0 <kinit+0xc8>
    80008450:	00088a37          	lui	s4,0x88
    80008454:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80008458:	00003917          	auipc	s2,0x3
    8000845c:	4f890913          	addi	s2,s2,1272 # 8000b950 <kmem>
    80008460:	00ca1a13          	slli	s4,s4,0xc
    80008464:	0140006f          	j	80008478 <kinit+0x80>
    80008468:	000017b7          	lui	a5,0x1
    8000846c:	00f484b3          	add	s1,s1,a5
    80008470:	0554e863          	bltu	s1,s5,800084c0 <kinit+0xc8>
    80008474:	0534f663          	bgeu	s1,s3,800084c0 <kinit+0xc8>
    80008478:	00001637          	lui	a2,0x1
    8000847c:	00100593          	li	a1,1
    80008480:	00048513          	mv	a0,s1
    80008484:	00000097          	auipc	ra,0x0
    80008488:	5e4080e7          	jalr	1508(ra) # 80008a68 <__memset>
    8000848c:	00093783          	ld	a5,0(s2)
    80008490:	00f4b023          	sd	a5,0(s1)
    80008494:	00993023          	sd	s1,0(s2)
    80008498:	fd4498e3          	bne	s1,s4,80008468 <kinit+0x70>
    8000849c:	03813083          	ld	ra,56(sp)
    800084a0:	03013403          	ld	s0,48(sp)
    800084a4:	02813483          	ld	s1,40(sp)
    800084a8:	02013903          	ld	s2,32(sp)
    800084ac:	01813983          	ld	s3,24(sp)
    800084b0:	01013a03          	ld	s4,16(sp)
    800084b4:	00813a83          	ld	s5,8(sp)
    800084b8:	04010113          	addi	sp,sp,64
    800084bc:	00008067          	ret
    800084c0:	00001517          	auipc	a0,0x1
    800084c4:	26850513          	addi	a0,a0,616 # 80009728 <digits+0x18>
    800084c8:	fffff097          	auipc	ra,0xfffff
    800084cc:	4b4080e7          	jalr	1204(ra) # 8000797c <panic>

00000000800084d0 <freerange>:
    800084d0:	fc010113          	addi	sp,sp,-64
    800084d4:	000017b7          	lui	a5,0x1
    800084d8:	02913423          	sd	s1,40(sp)
    800084dc:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    800084e0:	009504b3          	add	s1,a0,s1
    800084e4:	fffff537          	lui	a0,0xfffff
    800084e8:	02813823          	sd	s0,48(sp)
    800084ec:	02113c23          	sd	ra,56(sp)
    800084f0:	03213023          	sd	s2,32(sp)
    800084f4:	01313c23          	sd	s3,24(sp)
    800084f8:	01413823          	sd	s4,16(sp)
    800084fc:	01513423          	sd	s5,8(sp)
    80008500:	01613023          	sd	s6,0(sp)
    80008504:	04010413          	addi	s0,sp,64
    80008508:	00a4f4b3          	and	s1,s1,a0
    8000850c:	00f487b3          	add	a5,s1,a5
    80008510:	06f5e463          	bltu	a1,a5,80008578 <freerange+0xa8>
    80008514:	00004a97          	auipc	s5,0x4
    80008518:	73ca8a93          	addi	s5,s5,1852 # 8000cc50 <end>
    8000851c:	0954e263          	bltu	s1,s5,800085a0 <freerange+0xd0>
    80008520:	01100993          	li	s3,17
    80008524:	01b99993          	slli	s3,s3,0x1b
    80008528:	0734fc63          	bgeu	s1,s3,800085a0 <freerange+0xd0>
    8000852c:	00058a13          	mv	s4,a1
    80008530:	00003917          	auipc	s2,0x3
    80008534:	42090913          	addi	s2,s2,1056 # 8000b950 <kmem>
    80008538:	00002b37          	lui	s6,0x2
    8000853c:	0140006f          	j	80008550 <freerange+0x80>
    80008540:	000017b7          	lui	a5,0x1
    80008544:	00f484b3          	add	s1,s1,a5
    80008548:	0554ec63          	bltu	s1,s5,800085a0 <freerange+0xd0>
    8000854c:	0534fa63          	bgeu	s1,s3,800085a0 <freerange+0xd0>
    80008550:	00001637          	lui	a2,0x1
    80008554:	00100593          	li	a1,1
    80008558:	00048513          	mv	a0,s1
    8000855c:	00000097          	auipc	ra,0x0
    80008560:	50c080e7          	jalr	1292(ra) # 80008a68 <__memset>
    80008564:	00093703          	ld	a4,0(s2)
    80008568:	016487b3          	add	a5,s1,s6
    8000856c:	00e4b023          	sd	a4,0(s1)
    80008570:	00993023          	sd	s1,0(s2)
    80008574:	fcfa76e3          	bgeu	s4,a5,80008540 <freerange+0x70>
    80008578:	03813083          	ld	ra,56(sp)
    8000857c:	03013403          	ld	s0,48(sp)
    80008580:	02813483          	ld	s1,40(sp)
    80008584:	02013903          	ld	s2,32(sp)
    80008588:	01813983          	ld	s3,24(sp)
    8000858c:	01013a03          	ld	s4,16(sp)
    80008590:	00813a83          	ld	s5,8(sp)
    80008594:	00013b03          	ld	s6,0(sp)
    80008598:	04010113          	addi	sp,sp,64
    8000859c:	00008067          	ret
    800085a0:	00001517          	auipc	a0,0x1
    800085a4:	18850513          	addi	a0,a0,392 # 80009728 <digits+0x18>
    800085a8:	fffff097          	auipc	ra,0xfffff
    800085ac:	3d4080e7          	jalr	980(ra) # 8000797c <panic>

00000000800085b0 <kfree>:
    800085b0:	fe010113          	addi	sp,sp,-32
    800085b4:	00813823          	sd	s0,16(sp)
    800085b8:	00113c23          	sd	ra,24(sp)
    800085bc:	00913423          	sd	s1,8(sp)
    800085c0:	02010413          	addi	s0,sp,32
    800085c4:	03451793          	slli	a5,a0,0x34
    800085c8:	04079c63          	bnez	a5,80008620 <kfree+0x70>
    800085cc:	00004797          	auipc	a5,0x4
    800085d0:	68478793          	addi	a5,a5,1668 # 8000cc50 <end>
    800085d4:	00050493          	mv	s1,a0
    800085d8:	04f56463          	bltu	a0,a5,80008620 <kfree+0x70>
    800085dc:	01100793          	li	a5,17
    800085e0:	01b79793          	slli	a5,a5,0x1b
    800085e4:	02f57e63          	bgeu	a0,a5,80008620 <kfree+0x70>
    800085e8:	00001637          	lui	a2,0x1
    800085ec:	00100593          	li	a1,1
    800085f0:	00000097          	auipc	ra,0x0
    800085f4:	478080e7          	jalr	1144(ra) # 80008a68 <__memset>
    800085f8:	00003797          	auipc	a5,0x3
    800085fc:	35878793          	addi	a5,a5,856 # 8000b950 <kmem>
    80008600:	0007b703          	ld	a4,0(a5)
    80008604:	01813083          	ld	ra,24(sp)
    80008608:	01013403          	ld	s0,16(sp)
    8000860c:	00e4b023          	sd	a4,0(s1)
    80008610:	0097b023          	sd	s1,0(a5)
    80008614:	00813483          	ld	s1,8(sp)
    80008618:	02010113          	addi	sp,sp,32
    8000861c:	00008067          	ret
    80008620:	00001517          	auipc	a0,0x1
    80008624:	10850513          	addi	a0,a0,264 # 80009728 <digits+0x18>
    80008628:	fffff097          	auipc	ra,0xfffff
    8000862c:	354080e7          	jalr	852(ra) # 8000797c <panic>

0000000080008630 <kalloc>:
    80008630:	fe010113          	addi	sp,sp,-32
    80008634:	00813823          	sd	s0,16(sp)
    80008638:	00913423          	sd	s1,8(sp)
    8000863c:	00113c23          	sd	ra,24(sp)
    80008640:	02010413          	addi	s0,sp,32
    80008644:	00003797          	auipc	a5,0x3
    80008648:	30c78793          	addi	a5,a5,780 # 8000b950 <kmem>
    8000864c:	0007b483          	ld	s1,0(a5)
    80008650:	02048063          	beqz	s1,80008670 <kalloc+0x40>
    80008654:	0004b703          	ld	a4,0(s1)
    80008658:	00001637          	lui	a2,0x1
    8000865c:	00500593          	li	a1,5
    80008660:	00048513          	mv	a0,s1
    80008664:	00e7b023          	sd	a4,0(a5)
    80008668:	00000097          	auipc	ra,0x0
    8000866c:	400080e7          	jalr	1024(ra) # 80008a68 <__memset>
    80008670:	01813083          	ld	ra,24(sp)
    80008674:	01013403          	ld	s0,16(sp)
    80008678:	00048513          	mv	a0,s1
    8000867c:	00813483          	ld	s1,8(sp)
    80008680:	02010113          	addi	sp,sp,32
    80008684:	00008067          	ret

0000000080008688 <initlock>:
    80008688:	ff010113          	addi	sp,sp,-16
    8000868c:	00813423          	sd	s0,8(sp)
    80008690:	01010413          	addi	s0,sp,16
    80008694:	00813403          	ld	s0,8(sp)
    80008698:	00b53423          	sd	a1,8(a0)
    8000869c:	00052023          	sw	zero,0(a0)
    800086a0:	00053823          	sd	zero,16(a0)
    800086a4:	01010113          	addi	sp,sp,16
    800086a8:	00008067          	ret

00000000800086ac <acquire>:
    800086ac:	fe010113          	addi	sp,sp,-32
    800086b0:	00813823          	sd	s0,16(sp)
    800086b4:	00913423          	sd	s1,8(sp)
    800086b8:	00113c23          	sd	ra,24(sp)
    800086bc:	01213023          	sd	s2,0(sp)
    800086c0:	02010413          	addi	s0,sp,32
    800086c4:	00050493          	mv	s1,a0
    800086c8:	10002973          	csrr	s2,sstatus
    800086cc:	100027f3          	csrr	a5,sstatus
    800086d0:	ffd7f793          	andi	a5,a5,-3
    800086d4:	10079073          	csrw	sstatus,a5
    800086d8:	fffff097          	auipc	ra,0xfffff
    800086dc:	8e4080e7          	jalr	-1820(ra) # 80006fbc <mycpu>
    800086e0:	07852783          	lw	a5,120(a0)
    800086e4:	06078e63          	beqz	a5,80008760 <acquire+0xb4>
    800086e8:	fffff097          	auipc	ra,0xfffff
    800086ec:	8d4080e7          	jalr	-1836(ra) # 80006fbc <mycpu>
    800086f0:	07852783          	lw	a5,120(a0)
    800086f4:	0004a703          	lw	a4,0(s1)
    800086f8:	0017879b          	addiw	a5,a5,1
    800086fc:	06f52c23          	sw	a5,120(a0)
    80008700:	04071063          	bnez	a4,80008740 <acquire+0x94>
    80008704:	00100713          	li	a4,1
    80008708:	00070793          	mv	a5,a4
    8000870c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008710:	0007879b          	sext.w	a5,a5
    80008714:	fe079ae3          	bnez	a5,80008708 <acquire+0x5c>
    80008718:	0ff0000f          	fence
    8000871c:	fffff097          	auipc	ra,0xfffff
    80008720:	8a0080e7          	jalr	-1888(ra) # 80006fbc <mycpu>
    80008724:	01813083          	ld	ra,24(sp)
    80008728:	01013403          	ld	s0,16(sp)
    8000872c:	00a4b823          	sd	a0,16(s1)
    80008730:	00013903          	ld	s2,0(sp)
    80008734:	00813483          	ld	s1,8(sp)
    80008738:	02010113          	addi	sp,sp,32
    8000873c:	00008067          	ret
    80008740:	0104b903          	ld	s2,16(s1)
    80008744:	fffff097          	auipc	ra,0xfffff
    80008748:	878080e7          	jalr	-1928(ra) # 80006fbc <mycpu>
    8000874c:	faa91ce3          	bne	s2,a0,80008704 <acquire+0x58>
    80008750:	00001517          	auipc	a0,0x1
    80008754:	fe050513          	addi	a0,a0,-32 # 80009730 <digits+0x20>
    80008758:	fffff097          	auipc	ra,0xfffff
    8000875c:	224080e7          	jalr	548(ra) # 8000797c <panic>
    80008760:	00195913          	srli	s2,s2,0x1
    80008764:	fffff097          	auipc	ra,0xfffff
    80008768:	858080e7          	jalr	-1960(ra) # 80006fbc <mycpu>
    8000876c:	00197913          	andi	s2,s2,1
    80008770:	07252e23          	sw	s2,124(a0)
    80008774:	f75ff06f          	j	800086e8 <acquire+0x3c>

0000000080008778 <release>:
    80008778:	fe010113          	addi	sp,sp,-32
    8000877c:	00813823          	sd	s0,16(sp)
    80008780:	00113c23          	sd	ra,24(sp)
    80008784:	00913423          	sd	s1,8(sp)
    80008788:	01213023          	sd	s2,0(sp)
    8000878c:	02010413          	addi	s0,sp,32
    80008790:	00052783          	lw	a5,0(a0)
    80008794:	00079a63          	bnez	a5,800087a8 <release+0x30>
    80008798:	00001517          	auipc	a0,0x1
    8000879c:	fa050513          	addi	a0,a0,-96 # 80009738 <digits+0x28>
    800087a0:	fffff097          	auipc	ra,0xfffff
    800087a4:	1dc080e7          	jalr	476(ra) # 8000797c <panic>
    800087a8:	01053903          	ld	s2,16(a0)
    800087ac:	00050493          	mv	s1,a0
    800087b0:	fffff097          	auipc	ra,0xfffff
    800087b4:	80c080e7          	jalr	-2036(ra) # 80006fbc <mycpu>
    800087b8:	fea910e3          	bne	s2,a0,80008798 <release+0x20>
    800087bc:	0004b823          	sd	zero,16(s1)
    800087c0:	0ff0000f          	fence
    800087c4:	0f50000f          	fence	iorw,ow
    800087c8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800087cc:	ffffe097          	auipc	ra,0xffffe
    800087d0:	7f0080e7          	jalr	2032(ra) # 80006fbc <mycpu>
    800087d4:	100027f3          	csrr	a5,sstatus
    800087d8:	0027f793          	andi	a5,a5,2
    800087dc:	04079a63          	bnez	a5,80008830 <release+0xb8>
    800087e0:	07852783          	lw	a5,120(a0)
    800087e4:	02f05e63          	blez	a5,80008820 <release+0xa8>
    800087e8:	fff7871b          	addiw	a4,a5,-1
    800087ec:	06e52c23          	sw	a4,120(a0)
    800087f0:	00071c63          	bnez	a4,80008808 <release+0x90>
    800087f4:	07c52783          	lw	a5,124(a0)
    800087f8:	00078863          	beqz	a5,80008808 <release+0x90>
    800087fc:	100027f3          	csrr	a5,sstatus
    80008800:	0027e793          	ori	a5,a5,2
    80008804:	10079073          	csrw	sstatus,a5
    80008808:	01813083          	ld	ra,24(sp)
    8000880c:	01013403          	ld	s0,16(sp)
    80008810:	00813483          	ld	s1,8(sp)
    80008814:	00013903          	ld	s2,0(sp)
    80008818:	02010113          	addi	sp,sp,32
    8000881c:	00008067          	ret
    80008820:	00001517          	auipc	a0,0x1
    80008824:	f3850513          	addi	a0,a0,-200 # 80009758 <digits+0x48>
    80008828:	fffff097          	auipc	ra,0xfffff
    8000882c:	154080e7          	jalr	340(ra) # 8000797c <panic>
    80008830:	00001517          	auipc	a0,0x1
    80008834:	f1050513          	addi	a0,a0,-240 # 80009740 <digits+0x30>
    80008838:	fffff097          	auipc	ra,0xfffff
    8000883c:	144080e7          	jalr	324(ra) # 8000797c <panic>

0000000080008840 <holding>:
    80008840:	00052783          	lw	a5,0(a0)
    80008844:	00079663          	bnez	a5,80008850 <holding+0x10>
    80008848:	00000513          	li	a0,0
    8000884c:	00008067          	ret
    80008850:	fe010113          	addi	sp,sp,-32
    80008854:	00813823          	sd	s0,16(sp)
    80008858:	00913423          	sd	s1,8(sp)
    8000885c:	00113c23          	sd	ra,24(sp)
    80008860:	02010413          	addi	s0,sp,32
    80008864:	01053483          	ld	s1,16(a0)
    80008868:	ffffe097          	auipc	ra,0xffffe
    8000886c:	754080e7          	jalr	1876(ra) # 80006fbc <mycpu>
    80008870:	01813083          	ld	ra,24(sp)
    80008874:	01013403          	ld	s0,16(sp)
    80008878:	40a48533          	sub	a0,s1,a0
    8000887c:	00153513          	seqz	a0,a0
    80008880:	00813483          	ld	s1,8(sp)
    80008884:	02010113          	addi	sp,sp,32
    80008888:	00008067          	ret

000000008000888c <push_off>:
    8000888c:	fe010113          	addi	sp,sp,-32
    80008890:	00813823          	sd	s0,16(sp)
    80008894:	00113c23          	sd	ra,24(sp)
    80008898:	00913423          	sd	s1,8(sp)
    8000889c:	02010413          	addi	s0,sp,32
    800088a0:	100024f3          	csrr	s1,sstatus
    800088a4:	100027f3          	csrr	a5,sstatus
    800088a8:	ffd7f793          	andi	a5,a5,-3
    800088ac:	10079073          	csrw	sstatus,a5
    800088b0:	ffffe097          	auipc	ra,0xffffe
    800088b4:	70c080e7          	jalr	1804(ra) # 80006fbc <mycpu>
    800088b8:	07852783          	lw	a5,120(a0)
    800088bc:	02078663          	beqz	a5,800088e8 <push_off+0x5c>
    800088c0:	ffffe097          	auipc	ra,0xffffe
    800088c4:	6fc080e7          	jalr	1788(ra) # 80006fbc <mycpu>
    800088c8:	07852783          	lw	a5,120(a0)
    800088cc:	01813083          	ld	ra,24(sp)
    800088d0:	01013403          	ld	s0,16(sp)
    800088d4:	0017879b          	addiw	a5,a5,1
    800088d8:	06f52c23          	sw	a5,120(a0)
    800088dc:	00813483          	ld	s1,8(sp)
    800088e0:	02010113          	addi	sp,sp,32
    800088e4:	00008067          	ret
    800088e8:	0014d493          	srli	s1,s1,0x1
    800088ec:	ffffe097          	auipc	ra,0xffffe
    800088f0:	6d0080e7          	jalr	1744(ra) # 80006fbc <mycpu>
    800088f4:	0014f493          	andi	s1,s1,1
    800088f8:	06952e23          	sw	s1,124(a0)
    800088fc:	fc5ff06f          	j	800088c0 <push_off+0x34>

0000000080008900 <pop_off>:
    80008900:	ff010113          	addi	sp,sp,-16
    80008904:	00813023          	sd	s0,0(sp)
    80008908:	00113423          	sd	ra,8(sp)
    8000890c:	01010413          	addi	s0,sp,16
    80008910:	ffffe097          	auipc	ra,0xffffe
    80008914:	6ac080e7          	jalr	1708(ra) # 80006fbc <mycpu>
    80008918:	100027f3          	csrr	a5,sstatus
    8000891c:	0027f793          	andi	a5,a5,2
    80008920:	04079663          	bnez	a5,8000896c <pop_off+0x6c>
    80008924:	07852783          	lw	a5,120(a0)
    80008928:	02f05a63          	blez	a5,8000895c <pop_off+0x5c>
    8000892c:	fff7871b          	addiw	a4,a5,-1
    80008930:	06e52c23          	sw	a4,120(a0)
    80008934:	00071c63          	bnez	a4,8000894c <pop_off+0x4c>
    80008938:	07c52783          	lw	a5,124(a0)
    8000893c:	00078863          	beqz	a5,8000894c <pop_off+0x4c>
    80008940:	100027f3          	csrr	a5,sstatus
    80008944:	0027e793          	ori	a5,a5,2
    80008948:	10079073          	csrw	sstatus,a5
    8000894c:	00813083          	ld	ra,8(sp)
    80008950:	00013403          	ld	s0,0(sp)
    80008954:	01010113          	addi	sp,sp,16
    80008958:	00008067          	ret
    8000895c:	00001517          	auipc	a0,0x1
    80008960:	dfc50513          	addi	a0,a0,-516 # 80009758 <digits+0x48>
    80008964:	fffff097          	auipc	ra,0xfffff
    80008968:	018080e7          	jalr	24(ra) # 8000797c <panic>
    8000896c:	00001517          	auipc	a0,0x1
    80008970:	dd450513          	addi	a0,a0,-556 # 80009740 <digits+0x30>
    80008974:	fffff097          	auipc	ra,0xfffff
    80008978:	008080e7          	jalr	8(ra) # 8000797c <panic>

000000008000897c <push_on>:
    8000897c:	fe010113          	addi	sp,sp,-32
    80008980:	00813823          	sd	s0,16(sp)
    80008984:	00113c23          	sd	ra,24(sp)
    80008988:	00913423          	sd	s1,8(sp)
    8000898c:	02010413          	addi	s0,sp,32
    80008990:	100024f3          	csrr	s1,sstatus
    80008994:	100027f3          	csrr	a5,sstatus
    80008998:	0027e793          	ori	a5,a5,2
    8000899c:	10079073          	csrw	sstatus,a5
    800089a0:	ffffe097          	auipc	ra,0xffffe
    800089a4:	61c080e7          	jalr	1564(ra) # 80006fbc <mycpu>
    800089a8:	07852783          	lw	a5,120(a0)
    800089ac:	02078663          	beqz	a5,800089d8 <push_on+0x5c>
    800089b0:	ffffe097          	auipc	ra,0xffffe
    800089b4:	60c080e7          	jalr	1548(ra) # 80006fbc <mycpu>
    800089b8:	07852783          	lw	a5,120(a0)
    800089bc:	01813083          	ld	ra,24(sp)
    800089c0:	01013403          	ld	s0,16(sp)
    800089c4:	0017879b          	addiw	a5,a5,1
    800089c8:	06f52c23          	sw	a5,120(a0)
    800089cc:	00813483          	ld	s1,8(sp)
    800089d0:	02010113          	addi	sp,sp,32
    800089d4:	00008067          	ret
    800089d8:	0014d493          	srli	s1,s1,0x1
    800089dc:	ffffe097          	auipc	ra,0xffffe
    800089e0:	5e0080e7          	jalr	1504(ra) # 80006fbc <mycpu>
    800089e4:	0014f493          	andi	s1,s1,1
    800089e8:	06952e23          	sw	s1,124(a0)
    800089ec:	fc5ff06f          	j	800089b0 <push_on+0x34>

00000000800089f0 <pop_on>:
    800089f0:	ff010113          	addi	sp,sp,-16
    800089f4:	00813023          	sd	s0,0(sp)
    800089f8:	00113423          	sd	ra,8(sp)
    800089fc:	01010413          	addi	s0,sp,16
    80008a00:	ffffe097          	auipc	ra,0xffffe
    80008a04:	5bc080e7          	jalr	1468(ra) # 80006fbc <mycpu>
    80008a08:	100027f3          	csrr	a5,sstatus
    80008a0c:	0027f793          	andi	a5,a5,2
    80008a10:	04078463          	beqz	a5,80008a58 <pop_on+0x68>
    80008a14:	07852783          	lw	a5,120(a0)
    80008a18:	02f05863          	blez	a5,80008a48 <pop_on+0x58>
    80008a1c:	fff7879b          	addiw	a5,a5,-1
    80008a20:	06f52c23          	sw	a5,120(a0)
    80008a24:	07853783          	ld	a5,120(a0)
    80008a28:	00079863          	bnez	a5,80008a38 <pop_on+0x48>
    80008a2c:	100027f3          	csrr	a5,sstatus
    80008a30:	ffd7f793          	andi	a5,a5,-3
    80008a34:	10079073          	csrw	sstatus,a5
    80008a38:	00813083          	ld	ra,8(sp)
    80008a3c:	00013403          	ld	s0,0(sp)
    80008a40:	01010113          	addi	sp,sp,16
    80008a44:	00008067          	ret
    80008a48:	00001517          	auipc	a0,0x1
    80008a4c:	d3850513          	addi	a0,a0,-712 # 80009780 <digits+0x70>
    80008a50:	fffff097          	auipc	ra,0xfffff
    80008a54:	f2c080e7          	jalr	-212(ra) # 8000797c <panic>
    80008a58:	00001517          	auipc	a0,0x1
    80008a5c:	d0850513          	addi	a0,a0,-760 # 80009760 <digits+0x50>
    80008a60:	fffff097          	auipc	ra,0xfffff
    80008a64:	f1c080e7          	jalr	-228(ra) # 8000797c <panic>

0000000080008a68 <__memset>:
    80008a68:	ff010113          	addi	sp,sp,-16
    80008a6c:	00813423          	sd	s0,8(sp)
    80008a70:	01010413          	addi	s0,sp,16
    80008a74:	1a060e63          	beqz	a2,80008c30 <__memset+0x1c8>
    80008a78:	40a007b3          	neg	a5,a0
    80008a7c:	0077f793          	andi	a5,a5,7
    80008a80:	00778693          	addi	a3,a5,7
    80008a84:	00b00813          	li	a6,11
    80008a88:	0ff5f593          	andi	a1,a1,255
    80008a8c:	fff6071b          	addiw	a4,a2,-1
    80008a90:	1b06e663          	bltu	a3,a6,80008c3c <__memset+0x1d4>
    80008a94:	1cd76463          	bltu	a4,a3,80008c5c <__memset+0x1f4>
    80008a98:	1a078e63          	beqz	a5,80008c54 <__memset+0x1ec>
    80008a9c:	00b50023          	sb	a1,0(a0)
    80008aa0:	00100713          	li	a4,1
    80008aa4:	1ae78463          	beq	a5,a4,80008c4c <__memset+0x1e4>
    80008aa8:	00b500a3          	sb	a1,1(a0)
    80008aac:	00200713          	li	a4,2
    80008ab0:	1ae78a63          	beq	a5,a4,80008c64 <__memset+0x1fc>
    80008ab4:	00b50123          	sb	a1,2(a0)
    80008ab8:	00300713          	li	a4,3
    80008abc:	18e78463          	beq	a5,a4,80008c44 <__memset+0x1dc>
    80008ac0:	00b501a3          	sb	a1,3(a0)
    80008ac4:	00400713          	li	a4,4
    80008ac8:	1ae78263          	beq	a5,a4,80008c6c <__memset+0x204>
    80008acc:	00b50223          	sb	a1,4(a0)
    80008ad0:	00500713          	li	a4,5
    80008ad4:	1ae78063          	beq	a5,a4,80008c74 <__memset+0x20c>
    80008ad8:	00b502a3          	sb	a1,5(a0)
    80008adc:	00700713          	li	a4,7
    80008ae0:	18e79e63          	bne	a5,a4,80008c7c <__memset+0x214>
    80008ae4:	00b50323          	sb	a1,6(a0)
    80008ae8:	00700e93          	li	t4,7
    80008aec:	00859713          	slli	a4,a1,0x8
    80008af0:	00e5e733          	or	a4,a1,a4
    80008af4:	01059e13          	slli	t3,a1,0x10
    80008af8:	01c76e33          	or	t3,a4,t3
    80008afc:	01859313          	slli	t1,a1,0x18
    80008b00:	006e6333          	or	t1,t3,t1
    80008b04:	02059893          	slli	a7,a1,0x20
    80008b08:	40f60e3b          	subw	t3,a2,a5
    80008b0c:	011368b3          	or	a7,t1,a7
    80008b10:	02859813          	slli	a6,a1,0x28
    80008b14:	0108e833          	or	a6,a7,a6
    80008b18:	03059693          	slli	a3,a1,0x30
    80008b1c:	003e589b          	srliw	a7,t3,0x3
    80008b20:	00d866b3          	or	a3,a6,a3
    80008b24:	03859713          	slli	a4,a1,0x38
    80008b28:	00389813          	slli	a6,a7,0x3
    80008b2c:	00f507b3          	add	a5,a0,a5
    80008b30:	00e6e733          	or	a4,a3,a4
    80008b34:	000e089b          	sext.w	a7,t3
    80008b38:	00f806b3          	add	a3,a6,a5
    80008b3c:	00e7b023          	sd	a4,0(a5)
    80008b40:	00878793          	addi	a5,a5,8
    80008b44:	fed79ce3          	bne	a5,a3,80008b3c <__memset+0xd4>
    80008b48:	ff8e7793          	andi	a5,t3,-8
    80008b4c:	0007871b          	sext.w	a4,a5
    80008b50:	01d787bb          	addw	a5,a5,t4
    80008b54:	0ce88e63          	beq	a7,a4,80008c30 <__memset+0x1c8>
    80008b58:	00f50733          	add	a4,a0,a5
    80008b5c:	00b70023          	sb	a1,0(a4)
    80008b60:	0017871b          	addiw	a4,a5,1
    80008b64:	0cc77663          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008b68:	00e50733          	add	a4,a0,a4
    80008b6c:	00b70023          	sb	a1,0(a4)
    80008b70:	0027871b          	addiw	a4,a5,2
    80008b74:	0ac77e63          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008b78:	00e50733          	add	a4,a0,a4
    80008b7c:	00b70023          	sb	a1,0(a4)
    80008b80:	0037871b          	addiw	a4,a5,3
    80008b84:	0ac77663          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008b88:	00e50733          	add	a4,a0,a4
    80008b8c:	00b70023          	sb	a1,0(a4)
    80008b90:	0047871b          	addiw	a4,a5,4
    80008b94:	08c77e63          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008b98:	00e50733          	add	a4,a0,a4
    80008b9c:	00b70023          	sb	a1,0(a4)
    80008ba0:	0057871b          	addiw	a4,a5,5
    80008ba4:	08c77663          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008ba8:	00e50733          	add	a4,a0,a4
    80008bac:	00b70023          	sb	a1,0(a4)
    80008bb0:	0067871b          	addiw	a4,a5,6
    80008bb4:	06c77e63          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008bb8:	00e50733          	add	a4,a0,a4
    80008bbc:	00b70023          	sb	a1,0(a4)
    80008bc0:	0077871b          	addiw	a4,a5,7
    80008bc4:	06c77663          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008bc8:	00e50733          	add	a4,a0,a4
    80008bcc:	00b70023          	sb	a1,0(a4)
    80008bd0:	0087871b          	addiw	a4,a5,8
    80008bd4:	04c77e63          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008bd8:	00e50733          	add	a4,a0,a4
    80008bdc:	00b70023          	sb	a1,0(a4)
    80008be0:	0097871b          	addiw	a4,a5,9
    80008be4:	04c77663          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008be8:	00e50733          	add	a4,a0,a4
    80008bec:	00b70023          	sb	a1,0(a4)
    80008bf0:	00a7871b          	addiw	a4,a5,10
    80008bf4:	02c77e63          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008bf8:	00e50733          	add	a4,a0,a4
    80008bfc:	00b70023          	sb	a1,0(a4)
    80008c00:	00b7871b          	addiw	a4,a5,11
    80008c04:	02c77663          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008c08:	00e50733          	add	a4,a0,a4
    80008c0c:	00b70023          	sb	a1,0(a4)
    80008c10:	00c7871b          	addiw	a4,a5,12
    80008c14:	00c77e63          	bgeu	a4,a2,80008c30 <__memset+0x1c8>
    80008c18:	00e50733          	add	a4,a0,a4
    80008c1c:	00b70023          	sb	a1,0(a4)
    80008c20:	00d7879b          	addiw	a5,a5,13
    80008c24:	00c7f663          	bgeu	a5,a2,80008c30 <__memset+0x1c8>
    80008c28:	00f507b3          	add	a5,a0,a5
    80008c2c:	00b78023          	sb	a1,0(a5)
    80008c30:	00813403          	ld	s0,8(sp)
    80008c34:	01010113          	addi	sp,sp,16
    80008c38:	00008067          	ret
    80008c3c:	00b00693          	li	a3,11
    80008c40:	e55ff06f          	j	80008a94 <__memset+0x2c>
    80008c44:	00300e93          	li	t4,3
    80008c48:	ea5ff06f          	j	80008aec <__memset+0x84>
    80008c4c:	00100e93          	li	t4,1
    80008c50:	e9dff06f          	j	80008aec <__memset+0x84>
    80008c54:	00000e93          	li	t4,0
    80008c58:	e95ff06f          	j	80008aec <__memset+0x84>
    80008c5c:	00000793          	li	a5,0
    80008c60:	ef9ff06f          	j	80008b58 <__memset+0xf0>
    80008c64:	00200e93          	li	t4,2
    80008c68:	e85ff06f          	j	80008aec <__memset+0x84>
    80008c6c:	00400e93          	li	t4,4
    80008c70:	e7dff06f          	j	80008aec <__memset+0x84>
    80008c74:	00500e93          	li	t4,5
    80008c78:	e75ff06f          	j	80008aec <__memset+0x84>
    80008c7c:	00600e93          	li	t4,6
    80008c80:	e6dff06f          	j	80008aec <__memset+0x84>

0000000080008c84 <__memmove>:
    80008c84:	ff010113          	addi	sp,sp,-16
    80008c88:	00813423          	sd	s0,8(sp)
    80008c8c:	01010413          	addi	s0,sp,16
    80008c90:	0e060863          	beqz	a2,80008d80 <__memmove+0xfc>
    80008c94:	fff6069b          	addiw	a3,a2,-1
    80008c98:	0006881b          	sext.w	a6,a3
    80008c9c:	0ea5e863          	bltu	a1,a0,80008d8c <__memmove+0x108>
    80008ca0:	00758713          	addi	a4,a1,7
    80008ca4:	00a5e7b3          	or	a5,a1,a0
    80008ca8:	40a70733          	sub	a4,a4,a0
    80008cac:	0077f793          	andi	a5,a5,7
    80008cb0:	00f73713          	sltiu	a4,a4,15
    80008cb4:	00174713          	xori	a4,a4,1
    80008cb8:	0017b793          	seqz	a5,a5
    80008cbc:	00e7f7b3          	and	a5,a5,a4
    80008cc0:	10078863          	beqz	a5,80008dd0 <__memmove+0x14c>
    80008cc4:	00900793          	li	a5,9
    80008cc8:	1107f463          	bgeu	a5,a6,80008dd0 <__memmove+0x14c>
    80008ccc:	0036581b          	srliw	a6,a2,0x3
    80008cd0:	fff8081b          	addiw	a6,a6,-1
    80008cd4:	02081813          	slli	a6,a6,0x20
    80008cd8:	01d85893          	srli	a7,a6,0x1d
    80008cdc:	00858813          	addi	a6,a1,8
    80008ce0:	00058793          	mv	a5,a1
    80008ce4:	00050713          	mv	a4,a0
    80008ce8:	01088833          	add	a6,a7,a6
    80008cec:	0007b883          	ld	a7,0(a5)
    80008cf0:	00878793          	addi	a5,a5,8
    80008cf4:	00870713          	addi	a4,a4,8
    80008cf8:	ff173c23          	sd	a7,-8(a4)
    80008cfc:	ff0798e3          	bne	a5,a6,80008cec <__memmove+0x68>
    80008d00:	ff867713          	andi	a4,a2,-8
    80008d04:	02071793          	slli	a5,a4,0x20
    80008d08:	0207d793          	srli	a5,a5,0x20
    80008d0c:	00f585b3          	add	a1,a1,a5
    80008d10:	40e686bb          	subw	a3,a3,a4
    80008d14:	00f507b3          	add	a5,a0,a5
    80008d18:	06e60463          	beq	a2,a4,80008d80 <__memmove+0xfc>
    80008d1c:	0005c703          	lbu	a4,0(a1)
    80008d20:	00e78023          	sb	a4,0(a5)
    80008d24:	04068e63          	beqz	a3,80008d80 <__memmove+0xfc>
    80008d28:	0015c603          	lbu	a2,1(a1)
    80008d2c:	00100713          	li	a4,1
    80008d30:	00c780a3          	sb	a2,1(a5)
    80008d34:	04e68663          	beq	a3,a4,80008d80 <__memmove+0xfc>
    80008d38:	0025c603          	lbu	a2,2(a1)
    80008d3c:	00200713          	li	a4,2
    80008d40:	00c78123          	sb	a2,2(a5)
    80008d44:	02e68e63          	beq	a3,a4,80008d80 <__memmove+0xfc>
    80008d48:	0035c603          	lbu	a2,3(a1)
    80008d4c:	00300713          	li	a4,3
    80008d50:	00c781a3          	sb	a2,3(a5)
    80008d54:	02e68663          	beq	a3,a4,80008d80 <__memmove+0xfc>
    80008d58:	0045c603          	lbu	a2,4(a1)
    80008d5c:	00400713          	li	a4,4
    80008d60:	00c78223          	sb	a2,4(a5)
    80008d64:	00e68e63          	beq	a3,a4,80008d80 <__memmove+0xfc>
    80008d68:	0055c603          	lbu	a2,5(a1)
    80008d6c:	00500713          	li	a4,5
    80008d70:	00c782a3          	sb	a2,5(a5)
    80008d74:	00e68663          	beq	a3,a4,80008d80 <__memmove+0xfc>
    80008d78:	0065c703          	lbu	a4,6(a1)
    80008d7c:	00e78323          	sb	a4,6(a5)
    80008d80:	00813403          	ld	s0,8(sp)
    80008d84:	01010113          	addi	sp,sp,16
    80008d88:	00008067          	ret
    80008d8c:	02061713          	slli	a4,a2,0x20
    80008d90:	02075713          	srli	a4,a4,0x20
    80008d94:	00e587b3          	add	a5,a1,a4
    80008d98:	f0f574e3          	bgeu	a0,a5,80008ca0 <__memmove+0x1c>
    80008d9c:	02069613          	slli	a2,a3,0x20
    80008da0:	02065613          	srli	a2,a2,0x20
    80008da4:	fff64613          	not	a2,a2
    80008da8:	00e50733          	add	a4,a0,a4
    80008dac:	00c78633          	add	a2,a5,a2
    80008db0:	fff7c683          	lbu	a3,-1(a5)
    80008db4:	fff78793          	addi	a5,a5,-1
    80008db8:	fff70713          	addi	a4,a4,-1
    80008dbc:	00d70023          	sb	a3,0(a4)
    80008dc0:	fec798e3          	bne	a5,a2,80008db0 <__memmove+0x12c>
    80008dc4:	00813403          	ld	s0,8(sp)
    80008dc8:	01010113          	addi	sp,sp,16
    80008dcc:	00008067          	ret
    80008dd0:	02069713          	slli	a4,a3,0x20
    80008dd4:	02075713          	srli	a4,a4,0x20
    80008dd8:	00170713          	addi	a4,a4,1
    80008ddc:	00e50733          	add	a4,a0,a4
    80008de0:	00050793          	mv	a5,a0
    80008de4:	0005c683          	lbu	a3,0(a1)
    80008de8:	00178793          	addi	a5,a5,1
    80008dec:	00158593          	addi	a1,a1,1
    80008df0:	fed78fa3          	sb	a3,-1(a5)
    80008df4:	fee798e3          	bne	a5,a4,80008de4 <__memmove+0x160>
    80008df8:	f89ff06f          	j	80008d80 <__memmove+0xfc>
	...
