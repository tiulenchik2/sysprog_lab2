	.file	"prog.c"
	.intel_syntax noprefix
	.text
	.globl	A
	.bss
	.align 32
	.type	A, @object
	.size	A, 4194304
A:
	.zero	4194304
	.globl	B
	.align 32
	.type	B, @object
	.size	B, 4194304
B:
	.zero	4194304
	.globl	C
	.align 32
	.type	C, @object
	.size	C, 4194304
C:
	.zero	4194304
	.globl	X
	.align 32
	.type	X, @object
	.size	X, 4194304
X:
	.zero	4194304
	.globl	Y
	.align 32
	.type	Y, @object
	.size	Y, 4194304
Y:
	.zero	4194304
	.text
	.globl	init
	.type	init, @function
init:
.LFB6:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	mov	edi, 1
	call	srand@PLT
	mov	DWORD PTR -12[rbp], 0
	jmp	.L2
.L5:
	mov	DWORD PTR -8[rbp], 0
	jmp	.L3
.L4:
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	movss	xmm1, DWORD PTR .LC0[rip]
	divss	xmm0, xmm1
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	edx, DWORD PTR -12[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	movss	DWORD PTR [rdx+rax], xmm0
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	movss	xmm1, DWORD PTR .LC0[rip]
	divss	xmm0, xmm1
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	mov	edx, DWORD PTR -12[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	movss	DWORD PTR [rdx+rax], xmm0
	add	DWORD PTR -8[rbp], 1
.L3:
	cmp	DWORD PTR -8[rbp], 1023
	jle	.L4
	add	DWORD PTR -12[rbp], 1
.L2:
	cmp	DWORD PTR -12[rbp], 1023
	jle	.L5
	mov	DWORD PTR -4[rbp], 0
	jmp	.L6
.L7:
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	movss	xmm1, DWORD PTR .LC0[rip]
	divss	xmm0, xmm1
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, X[rip]
	movss	DWORD PTR [rdx+rax], xmm0
	call	rand@PLT
	pxor	xmm0, xmm0
	cvtsi2ss	xmm0, eax
	movss	xmm1, DWORD PTR .LC0[rip]
	divss	xmm0, xmm1
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, Y[rip]
	movss	DWORD PTR [rdx+rax], xmm0
	add	DWORD PTR -4[rbp], 1
.L6:
	cmp	DWORD PTR -4[rbp], 1048575
	jle	.L7
	nop
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	init, .-init
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB7:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	mov	DWORD PTR -16[rbp], 0
	jmp	.L9
.L14:
	mov	DWORD PTR -12[rbp], 0
	jmp	.L10
.L13:
	pxor	xmm0, xmm0
	movss	DWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L11
.L12:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	mov	edx, DWORD PTR -16[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*4]
	lea	rax, A[rip]
	movss	xmm1, DWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	mov	edx, DWORD PTR -4[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*4]
	lea	rax, B[rip]
	movss	xmm0, DWORD PTR [rdx+rax]
	mulss	xmm0, xmm1
	movss	xmm1, DWORD PTR -8[rbp]
	addss	xmm0, xmm1
	movss	DWORD PTR -8[rbp], xmm0
	add	DWORD PTR -4[rbp], 1
.L11:
	cmp	DWORD PTR -4[rbp], 1023
	jle	.L12
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	mov	edx, DWORD PTR -16[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*4]
	lea	rax, C[rip]
	movss	xmm0, DWORD PTR -8[rbp]
	movss	DWORD PTR [rdx+rax], xmm0
	add	DWORD PTR -12[rbp], 1
.L10:
	cmp	DWORD PTR -12[rbp], 1023
	jle	.L13
	add	DWORD PTR -16[rbp], 1
.L9:
	cmp	DWORD PTR -16[rbp], 1023
	jle	.L14
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	matmul, .-matmul
	.globl	saxpy
	.type	saxpy, @function
saxpy:
.LFB8:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	movss	DWORD PTR -20[rbp], xmm0
	mov	DWORD PTR -4[rbp], 0
	jmp	.L16
.L17:
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, X[rip]
	movss	xmm0, DWORD PTR [rdx+rax]
	movaps	xmm1, xmm0
	mulss	xmm1, DWORD PTR -20[rbp]
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, Y[rip]
	movss	xmm0, DWORD PTR [rdx+rax]
	addss	xmm0, xmm1
	mov	eax, DWORD PTR -4[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, Y[rip]
	movss	DWORD PTR [rdx+rax], xmm0
	add	DWORD PTR -4[rbp], 1
.L16:
	cmp	DWORD PTR -4[rbp], 1048575
	jle	.L17
	nop
	nop
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE8:
	.size	saxpy, .-saxpy
	.globl	sum
	.type	sum, @function
sum:
.LFB9:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	pxor	xmm0, xmm0
	movsd	QWORD PTR -8[rbp], xmm0
	mov	DWORD PTR -20[rbp], 0
	jmp	.L19
.L22:
	mov	DWORD PTR -16[rbp], 0
	jmp	.L20
.L21:
	mov	eax, DWORD PTR -16[rbp]
	cdqe
	mov	edx, DWORD PTR -20[rbp]
	movsxd	rdx, edx
	sal	rdx, 10
	add	rax, rdx
	lea	rdx, 0[0+rax*4]
	lea	rax, C[rip]
	movss	xmm0, DWORD PTR [rdx+rax]
	cvtss2sd	xmm0, xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -16[rbp], 1
.L20:
	cmp	DWORD PTR -16[rbp], 1023
	jle	.L21
	add	DWORD PTR -20[rbp], 1
.L19:
	cmp	DWORD PTR -20[rbp], 1023
	jle	.L22
	mov	DWORD PTR -12[rbp], 0
	jmp	.L23
.L24:
	mov	eax, DWORD PTR -12[rbp]
	cdqe
	lea	rdx, 0[0+rax*4]
	lea	rax, Y[rip]
	movss	xmm0, DWORD PTR [rdx+rax]
	cvtss2sd	xmm0, xmm0
	movsd	xmm1, QWORD PTR -8[rbp]
	addsd	xmm0, xmm1
	movsd	QWORD PTR -8[rbp], xmm0
	add	DWORD PTR -12[rbp], 1
.L23:
	cmp	DWORD PTR -12[rbp], 1048575
	jle	.L24
	movsd	xmm0, QWORD PTR -8[rbp]
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE9:
	.size	sum, .-sum
	.section	.rodata
.LC4:
	.string	"sum = %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB10:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	sub	rsp, 16
	call	init
	call	matmul
	mov	DWORD PTR -4[rbp], 0
	jmp	.L27
.L28:
	mov	eax, DWORD PTR .LC3[rip]
	movd	xmm0, eax
	call	saxpy
	add	DWORD PTR -4[rbp], 1
.L27:
	cmp	DWORD PTR -4[rbp], 199
	jle	.L28
	call	sum
	movq	rax, xmm0
	lea	rdx, .LC4[rip]
	movq	xmm0, rax
	mov	rdi, rdx
	mov	eax, 1
	call	printf@PLT
	mov	eax, 0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE10:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1325400064
	.align 4
.LC3:
	.long	953267991
	.ident	"GCC: (Ubuntu 15.2.0-16ubuntu1) 15.2.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	1f - 0f
	.long	4f - 1f
	.long	5
0:
	.string	"GNU"
1:
	.align 8
	.long	0xc0000002
	.long	3f - 2f
2:
	.long	0x3
3:
	.align 8
4:
