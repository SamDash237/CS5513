	.file	"intrinsic_example.c"
	.section	.rodata
.LC9:
	.string	"a3 is %f, %f, %f, %f\n"
	.text
	.globl	main
	.type	main, @function
main:
.LFB496:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$176, %rsp
	movl	.LC0(%rip), %eax
	movl	%eax, -144(%rbp)
	movl	.LC1(%rip), %eax
	movl	%eax, -140(%rbp)
	movl	.LC2(%rip), %eax
	movl	%eax, -136(%rbp)
	movl	.LC3(%rip), %eax
	movl	%eax, -132(%rbp)
	movl	.LC4(%rip), %eax
	movl	%eax, -128(%rbp)
	movl	.LC5(%rip), %eax
	movl	%eax, -124(%rbp)
	movl	.LC6(%rip), %eax
	movl	%eax, -120(%rbp)
	movl	.LC7(%rip), %eax
	movl	%eax, -116(%rbp)
	movl	.LC8(%rip), %eax
	movl	%eax, -112(%rbp)
	movl	.LC8(%rip), %eax
	movl	%eax, -108(%rbp)
	movl	.LC8(%rip), %eax
	movl	%eax, -104(%rbp)
	movl	.LC8(%rip), %eax
	movl	%eax, -100(%rbp)
	leaq	-144(%rbp), %rax
	movq	%rax, -168(%rbp)
	movq	-168(%rbp), %rax
	movaps	(%rax), %xmm0
	movaps	%xmm0, -96(%rbp)
	leaq	-128(%rbp), %rax
	movq	%rax, -160(%rbp)
	movq	-160(%rbp), %rax
	movaps	(%rax), %xmm0
	movaps	%xmm0, -80(%rbp)
	movaps	-96(%rbp), %xmm0
	movaps	%xmm0, -48(%rbp)
	movaps	-80(%rbp), %xmm0
	movaps	%xmm0, -32(%rbp)
	movaps	-32(%rbp), %xmm0
	movaps	-48(%rbp), %xmm1
	addps	%xmm1, %xmm0
	movaps	%xmm0, -64(%rbp)
	leaq	-112(%rbp), %rax
	movq	%rax, -152(%rbp)
	movaps	-64(%rbp), %xmm0
	movaps	%xmm0, -16(%rbp)
	movq	-152(%rbp), %rax
	movaps	-16(%rbp), %xmm0
	movaps	%xmm0, (%rax)
	movss	-100(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm3
	movss	-104(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm2
	movss	-108(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm1
	movss	-112(%rbp), %xmm0
	unpcklps	%xmm0, %xmm0
	cvtps2pd	%xmm0, %xmm0
	movl	$.LC9, %edi
	movl	$4, %eax
	call	printf
	movl	$0, %eax
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE496:
	.size	main, .-main
	.section	.rodata
	.align 4
.LC0:
	.long	1065353216
	.align 4
.LC1:
	.long	1073741824
	.align 4
.LC2:
	.long	1077936128
	.align 4
.LC3:
	.long	1082130432
	.align 4
.LC4:
	.long	1084227584
	.align 4
.LC5:
	.long	1086324736
	.align 4
.LC6:
	.long	1088421888
	.align 4
.LC7:
	.long	1090519040
	.align 4
.LC8:
	.long	0
	.ident	"GCC: (Ubuntu 4.8.4-2ubuntu1~14.04.4) 4.8.4"
	.section	.note.GNU-stack,"",@progbits
