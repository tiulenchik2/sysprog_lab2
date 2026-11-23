	.file	"prog.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.type	saxpy.constprop.0, @function
saxpy.constprop.0:
.LFB44:
	.cfi_startproc
	lea	rax, Y[rip]
	vbroadcastss	ymm1, DWORD PTR .LC1[rip]
	lea	rdx, X[rip]
	lea	rcx, 4194304[rax]
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L2:
	vmovaps	ymm0, YMMWORD PTR [rdx]
	add	rax, 32
	add	rdx, 32
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR -32[rax]
	vmovaps	YMMWORD PTR -32[rax], ymm0
	cmp	rax, rcx
	jne	.L2
	vzeroupper
	ret
	.cfi_endproc
.LFE44:
	.size	saxpy.constprop.0, .-saxpy.constprop.0
	.p2align 4
	.globl	init
	.type	init, @function
init:
.LFB39:
	.cfi_startproc
	endbr64
	push	r13
	.cfi_def_cfa_offset 16
	.cfi_offset 13, -16
	mov	edi, 1
	push	r12
	.cfi_def_cfa_offset 24
	.cfi_offset 12, -24
	lea	r12, B[rip]
	push	rbp
	.cfi_def_cfa_offset 32
	.cfi_offset 6, -32
	lea	rbp, A[rip]
	lea	r13, 4194304[rbp]
	push	rbx
	.cfi_def_cfa_offset 40
	.cfi_offset 3, -40
	sub	rsp, 8
	.cfi_def_cfa_offset 48
	call	srand@PLT
.L6:
	xor	ebx, ebx
	.p2align 4,,10
	.p2align 3
.L7:
	call	rand@PLT
	vxorps	xmm1, xmm1, xmm1
	vcvtsi2ss	xmm0, xmm1, eax
	vmulss	xmm0, xmm0, DWORD PTR .LC2[rip]
	vmovss	DWORD PTR 0[rbp+rbx], xmm0
	call	rand@PLT
	vxorps	xmm1, xmm1, xmm1
	vcvtsi2ss	xmm0, xmm1, eax
	vmulss	xmm0, xmm0, DWORD PTR .LC2[rip]
	vmovss	DWORD PTR [r12+rbx], xmm0
	add	rbx, 4
	cmp	rbx, 4096
	jne	.L7
	add	rbp, 4096
	add	r12, 4096
	cmp	rbp, r13
	jne	.L6
	lea	rbx, X[rip]
	lea	r12, Y[rip]
	lea	rbp, 4194304[rbx]
.L9:
	call	rand@PLT
	vxorps	xmm2, xmm2, xmm2
	add	rbx, 4
	add	r12, 4
	vcvtsi2ss	xmm0, xmm2, eax
	vmulss	xmm0, xmm0, DWORD PTR .LC2[rip]
	vmovss	DWORD PTR -4[rbx], xmm0
	call	rand@PLT
	vxorps	xmm2, xmm2, xmm2
	vcvtsi2ss	xmm0, xmm2, eax
	vmulss	xmm0, xmm0, DWORD PTR .LC2[rip]
	vmovss	DWORD PTR -4[r12], xmm0
	cmp	rbx, rbp
	jne	.L9
	add	rsp, 8
	.cfi_def_cfa_offset 40
	pop	rbx
	.cfi_def_cfa_offset 32
	pop	rbp
	.cfi_def_cfa_offset 24
	pop	r12
	.cfi_def_cfa_offset 16
	pop	r13
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE39:
	.size	init, .-init
	.p2align 4
	.globl	matmul
	.type	matmul, @function
matmul:
.LFB40:
	.cfi_startproc
	endbr64
	push	rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	lea	r9, B[rip+4096]
	lea	r11, C[rip]
	xor	r10d, r10d
	mov	rbp, rsp
	.cfi_def_cfa_register 6
	push	r12
	.cfi_offset 12, -24
	lea	r12, A[rip]
	push	rbx
	.cfi_offset 3, -32
	lea	rbx, 4190208[r9]
.L14:
	mov	r8, r10
	mov	rcx, rbx
	lea	rsi, B[rip]
	mov	rdi, r11
	sal	r8, 12
	add	r8, r12
.L18:
	mov	rax, rsi
	mov	rdx, r8
	vxorps	xmm0, xmm0, xmm0
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L15:
	vbroadcastss	ymm1, DWORD PTR [rdx]
	add	rax, 4096
	add	rdx, 4
	vfmadd231ps	ymm0, ymm1, YMMWORD PTR -4096[rax]
	cmp	rax, rcx
	jne	.L15
	add	rsi, 32
	vmovaps	YMMWORD PTR [rdi], ymm0
	lea	rcx, 32[rax]
	add	rdi, 32
	cmp	rsi, r9
	jne	.L18
	inc	r10
	add	r11, 4096
	cmp	r10, 1024
	jne	.L14
	vzeroupper
	pop	rbx
	pop	r12
	pop	rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE40:
	.size	matmul, .-matmul
	.p2align 4
	.globl	saxpy
	.type	saxpy, @function
saxpy:
.LFB41:
	.cfi_startproc
	endbr64
	lea	rax, X[rip]
	vbroadcastss	ymm1, xmm0
	lea	rdx, Y[rip]
	lea	rcx, 4194304[rax]
	.p2align 5
	.p2align 4,,10
	.p2align 3
.L23:
	vmovaps	ymm0, YMMWORD PTR [rax]
	add	rax, 32
	add	rdx, 32
	vfmadd213ps	ymm0, ymm1, YMMWORD PTR -32[rdx]
	vmovaps	YMMWORD PTR -32[rdx], ymm0
	cmp	rax, rcx
	jne	.L23
	vzeroupper
	ret
	.cfi_endproc
.LFE41:
	.size	saxpy, .-saxpy
	.p2align 4
	.globl	sum
	.type	sum, @function
sum:
.LFB42:
	.cfi_startproc
	endbr64
	lea	rcx, C[rip]
	vxorpd	xmm0, xmm0, xmm0
	lea	rdx, 4096[rcx]
	lea	rsi, 4198400[rcx]
.L26:
	mov	rax, rcx
	.p2align 4,,10
	.p2align 3
.L27:
	vmovaps	ymm1, YMMWORD PTR [rax]
	add	rax, 32
	vcvtps2pd	ymm2, xmm1
	vaddsd	xmm0, xmm0, xmm2
	vunpckhpd	xmm3, xmm2, xmm2
	vextractf32x4	xmm1, ymm1, 0x1
	vcvtps2pd	ymm1, xmm1
	vaddsd	xmm0, xmm0, xmm3
	vextractf64x2	xmm3, ymm2, 1
	valignq	ymm2, ymm2, ymm2, 3
	vaddsd	xmm0, xmm0, xmm3
	vaddsd	xmm0, xmm0, xmm2
	vunpckhpd	xmm2, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm1
	vaddsd	xmm0, xmm0, xmm2
	vextractf64x2	xmm2, ymm1, 1
	valignq	ymm1, ymm1, ymm1, 3
	vaddsd	xmm0, xmm0, xmm2
	vaddsd	xmm0, xmm0, xmm1
	cmp	rax, rdx
	jne	.L27
	lea	rdx, 4096[rax]
	add	rcx, 4096
	cmp	rdx, rsi
	jne	.L26
	lea	rax, Y[rip]
	lea	rdx, 4194304[rax]
.L29:
	vmovaps	ymm1, YMMWORD PTR [rax]
	add	rax, 32
	vcvtps2pd	ymm3, xmm1
	vaddsd	xmm4, xmm3, xmm0
	vunpckhpd	xmm2, xmm3, xmm3
	vextractf32x4	xmm1, ymm1, 0x1
	vextractf64x2	xmm0, ymm3, 1
	vcvtps2pd	ymm1, xmm1
	valignq	ymm3, ymm3, ymm3, 3
	vaddsd	xmm2, xmm2, xmm4
	vaddsd	xmm0, xmm0, xmm2
	vunpckhpd	xmm2, xmm1, xmm1
	vaddsd	xmm0, xmm0, xmm3
	vaddsd	xmm0, xmm0, xmm1
	vaddsd	xmm0, xmm0, xmm2
	vextractf64x2	xmm2, ymm1, 1
	valignq	ymm1, ymm1, ymm1, 3
	vaddsd	xmm0, xmm0, xmm2
	vaddsd	xmm0, xmm0, xmm1
	cmp	rdx, rax
	jne	.L29
	vzeroupper
	ret
	.cfi_endproc
.LFE42:
	.size	sum, .-sum
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"sum = %f\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB43:
	.cfi_startproc
	endbr64
	sub	rsp, 8
	.cfi_def_cfa_offset 16
	call	init
	call	matmul
	mov	esi, 200
	.p2align 4,,10
	.p2align 3
.L33:
	call	saxpy.constprop.0
	call	saxpy.constprop.0
	sub	esi, 2
	jne	.L33
	call	sum
	mov	edi, 2
	lea	rsi, .LC4[rip]
	mov	eax, 1
	call	__printf_chk@PLT
	xor	eax, eax
	add	rsp, 8
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE43:
	.size	main, .-main
	.globl	Y
	.bss
	.align 32
	.type	Y, @object
	.size	Y, 4194304
Y:
	.zero	4194304
	.globl	X
	.align 32
	.type	X, @object
	.size	X, 4194304
X:
	.zero	4194304
	.globl	C
	.align 32
	.type	C, @object
	.size	C, 4194304
C:
	.zero	4194304
	.globl	B
	.align 32
	.type	B, @object
	.size	B, 4194304
B:
	.zero	4194304
	.globl	A
	.align 32
	.type	A, @object
	.size	A, 4194304
A:
	.zero	4194304
	.section	.rodata.cst4,"aM",@progbits,4
	.align 4
.LC1:
	.long	953267991
	.align 4
.LC2:
	.long	805306368
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
