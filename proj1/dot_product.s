	.file	"dot_product.c"
	.text
	.globl	dot_product
	.type	dot_product, @function
dot_product:
.LFB496:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	addq	$-128, %rsp
	movq	%rdi, -232(%rbp)
	movq	%rsi, -240(%rbp)
	movl	%edx, -244(%rbp)
	movl	.LC0(%rip), %eax
	movl	%eax, -176(%rbp)
	movl	.LC0(%rip), %eax
	movl	%eax, -172(%rbp)
	movl	.LC0(%rip), %eax
	movl	%eax, -168(%rbp)
	movl	.LC0(%rip), %eax
	movl	%eax, -164(%rbp)
	leaq	-176(%rbp), %rax
	movq	%rax, -208(%rbp)
	movq	-208(%rbp), %rax
	movaps	(%rax), %xmm0
	movaps	%xmm0, -144(%rbp)
	movl	$0, -212(%rbp)
	jmp	.L3
.L8:
	movl	-212(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-232(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -200(%rbp)
	movq	-200(%rbp), %rax
	movaps	(%rax), %xmm0
	movaps	%xmm0, -128(%rbp)
	movl	-212(%rbp), %eax
	cltq
	leaq	0(,%rax,4), %rdx
	movq	-240(%rbp), %rax
	addq	%rdx, %rax
	movq	%rax, -192(%rbp)
	movq	-192(%rbp), %rax
	movaps	(%rax), %xmm0
	movaps	%xmm0, -112(%rbp)
	movaps	-128(%rbp), %xmm0
	movaps	%xmm0, -80(%rbp)
	movaps	-112(%rbp), %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	-64(%rbp), %xmm0
	movaps	-80(%rbp), %xmm1
	mulps	%xmm1, %xmm0
	movaps	%xmm0, -96(%rbp)
	movaps	-96(%rbp), %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	-144(%rbp), %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	-32(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	addps	%xmm1, %xmm0
	movaps	%xmm0, -144(%rbp)
	addl	$4, -212(%rbp)
.L3:
	movl	-212(%rbp), %eax
	cmpl	-244(%rbp), %eax
	jl	.L8
	leaq	-160(%rbp), %rax
	movq	%rax, -184(%rbp)
	movaps	-144(%rbp), %xmm0
	movaps	%xmm0, -16(%rbp)
	movq	-184(%rbp), %rax
	movaps	-16(%rbp), %xmm0
	movaps	%xmm0, (%rax)
	movss	-160(%rbp), %xmm1
	movss	-156(%rbp), %xmm0
	addss	%xmm1, %xmm0
	movss	-152(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	-148(%rbp), %xmm1
	addss	%xmm1, %xmm0
	movss	%xmm0, -248(%rbp)
	movl	-248(%rbp), %eax
	movl	%eax, -248(%rbp)
	movss	-248(%rbp), %xmm0
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE496:
	.size	dot_product, .-dot_product
	.section	.rodata
	.align 4
.LC0:
	.long	0
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
