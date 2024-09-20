average:
	addi	sp,sp,-48
	sd	s0,40(sp)
	addi	s0,sp,48
	sd	a0,-40(s0)
	mv	a5,a1
	sw	a5,-44(s0)
	sw	zero,-20(s0)
	sw	zero,-24(s0)
	j	.L2
.L3:
	lw	a5,-24(s0)
	slli	a5,a5,2
	ld	a4,-40(s0)
	add	a5,a4,a5
	flw	fa5,0(a5)
	flw	fa4,-20(s0)
	fadd.s	fa5,fa4,fa5
	fsw	fa5,-20(s0)
	lw	a5,-24(s0)
	addiw	a5,a5,1
	sw	a5,-24(s0)
.L2:
	lw	a5,-24(s0)
	mv	a4,a5
	lw	a5,-44(s0)
	sext.w	a4,a4
	sext.w	a5,a5
	blt	a4,a5,.L3
	lw	a5,-44(s0)
	fcvt.s.w	fa5,a5
	flw	fa4,-20(s0)
	fdiv.s	fa5,fa4,fa5
	fmv.s	fa0,fa5
	ld	s0,40(sp)
	addi	sp,sp,48
	jr	ra
	.size	average, .-average
	.section	.rodata
	.align	3
.LC0:
	.string	"%f"
	.align	3
.LC1:
	.string	"%.2f\n"
	.text
	.align	1
	.globl	main
	.type	main, @function
main:
	addi	sp,sp,-48
	sd	ra,40(sp)
	sd	s0,32(sp)
	addi	s0,sp,48
	sw	zero,-20(s0)
	j	.L6
.L7:
	addi	a4,s0,-40
	lw	a5,-20(s0)
	slli	a5,a5,2
	add	a5,a4,a5
	mv	a1,a5
	lui	a5,%hi(.LC0)
	addi	a0,a5,%lo(.LC0)
	call	__isoc99_scanf
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L6:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,2
	ble	a4,a5,.L7
	addi	a5,s0,-40
	li	a1,3
	mv	a0,a5
	call	average
	fsw	fa0,-24(s0)
	flw	fa5,-24(s0)
	fcvt.d.s	fa5,fa5
	fmv.x.d	a1,fa5
	lui	a5,%hi(.LC1)
	addi	a0,a5,%lo(.LC1)
	call	printf
	li	a5,0
	mv	a0,a5
	ld	ra,40(sp)
	ld	s0,32(sp)
	addi	sp,sp,48
	jr	ra
	.size	main, .-main
	