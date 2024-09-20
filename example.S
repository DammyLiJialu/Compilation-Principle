	.section	.rodata
	.align	3
.LC0:
	.string	"Enter the elements of the first 2x2 matrix (A):"
	.align	3
.LC1:
	.string	"A[%d][%d]: "
	.align	3
.LC2:
	.string	"%d"
	.align	3
.LC3:
	.string	"Enter the elements of the second 2x2 matrix (B):"
	.align	3
.LC4:
	.string	"B[%d][%d]: "
	.align	3
.LC5:
	.string	"Resulting matrix (C = A * B):"
	.align	3
.LC6:
	.string	"%d "


	.text
	.align	2
	.globl	main
	.type	main, @function
main:
	addi sp,sp,-112
	sd	ra,104(sp)
	sd	s0,96(sp)
	addi s0,sp,112
	lui	a5,%hi(.LC0)
	addi a0,a5,%lo(.LC0)
	call puts
	sw	zero,-20(s0)
	j	.L2
.L5:#清零
	sw	zero,-24(s0)
	j	.L3
.L4:# 读取矩阵 A 的元素提示
	lw	a4,-24(s0)
	lw	a5,-20(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC1)
	addi a0,a5,%lo(.LC1)
	call printf
	addi a4,s0,-72
	lw	a3,-24(s0)
	lw	a5,-20(s0)
	slli a5,a5,1
	add	a5,a3,a5
	slli a5,a5,2
	add	a5,a4,a5
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi a0,a5,%lo(.LC2)
	call __isoc99_scanf
	lw	a5,-24(s0)
	addiw a5,a5,1
	sw	a5,-24(s0)
.L3:
	lw	a5,-24(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L4 
	lw	a5,-20(s0)
	addiw	a5,a5,1
	sw	a5,-20(s0)
.L2:
	lw	a5,-20(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L5
	lui	a5,%hi(.LC3)
	addi	a0,a5,%lo(.LC3)
	call	puts
	sw	zero,-28(s0)
	j	.L6
.L9:
	sw	zero,-32(s0)
	j	.L7
.L8:
	lw	a4,-32(s0)
	lw	a5,-28(s0)
	mv	a2,a4
	mv	a1,a5
	lui	a5,%hi(.LC4)
	addi	a0,a5,%lo(.LC4)
	call	printf
	addi	a4,s0,-88
	lw	a3,-32(s0)
	lw	a5,-28(s0)
	slli	a5,a5,1
	add	a5,a3,a5
	slli	a5,a5,2
	add	a5,a4,a5
	mv	a1,a5
	lui	a5,%hi(.LC2)
	addi	a0,a5,%lo(.LC2)
	call	__isoc99_scanf
	lw	a5,-32(s0)
	addiw	a5,a5,1
	sw	a5,-32(s0)
.L7:
	lw	a5,-32(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L8
	lw	a5,-28(s0)
	addiw	a5,a5,1
	sw	a5,-28(s0)
.L6:# 读取矩阵A
	lw	a5,-28(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L9
	sw	zero,-36(s0)
	j	.L10
.L15:
	sw	zero,-40(s0)
	j	.L11
.L14:
	lw	a5,-40(s0)
	lw	a4,-36(s0)
	slli	a4,a4,1
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	zero,-88(a5)
	sw	zero,-44(s0)
	j	.L12
.L13:
	lw	a5,-40(s0)
	lw	a4,-36(s0)
	slli	a4,a4,1
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a4,-88(a5)
	lw	a5,-44(s0)
	lw	a3,-36(s0)
	slli	a3,a3,1
	add	a5,a3,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a3,-56(a5)
	lw	a5,-40(s0)
	lw	a2,-44(s0)
	slli	a2,a2,1
	add	a5,a2,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-72(a5)
	mulw	a5,a3,a5
	sext.w	a5,a5
	addw	a5,a4,a5
	sext.w	a4,a5
	lw	a5,-40(s0)
	lw	a3,-36(s0)
	slli	a3,a3,1
	add	a5,a3,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	sw	a4,-88(a5)
	lw	a5,-44(s0)
	addiw	a5,a5,1
	sw	a5,-44(s0)
.L12:
	lw	a5,-44(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L13
	lw	a5,-40(s0)
	addiw	a5,a5,1
	sw	a5,-40(s0)
.L11:
	lw	a5,-40(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L14
	lw	a5,-36(s0)
	addiw a5,a5,1
	sw	a5,-36(s0)
.L10:#输出信息
	lw	a5,-36(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L15
	lui	a5,%hi(.LC5)
	addi	a0,a5,%lo(.LC5)
	call	puts
	sw	zero,-48(s0)
	j	.L16
.L19:
	sw	zero,-52(s0)
	j	.L17
.L18:
	lw	a5,-52(s0)
	lw	a4,-48(s0)
	slli	a4,a4,1
	add	a5,a4,a5
	slli	a5,a5,2
	addi	a5,a5,-16
	add	a5,a5,s0
	lw	a5,-88(a5)
	mv	a1,a5
	lui	a5,%hi(.LC6)
	addi	a0,a5,%lo(.LC6)
	call	printf
	lw	a5,-52(s0)
	addiw	a5,a5,1
	sw	a5,-52(s0)
.L17:
	lw	a5,-52(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L18
	li	a0,10
	call	putchar
	lw	a5,-48(s0)
	addiw	a5,a5,1
	sw	a5,-48(s0)
.L16:
	lw	a5,-48(s0)
	sext.w	a4,a5
	li	a5,1
	ble	a4,a5,.L19
	li	a5,0
	mv	a0,a5
	ld	ra,104(sp)
	ld	s0,96(sp)
	addi sp,sp,112
	jr	ra
	
