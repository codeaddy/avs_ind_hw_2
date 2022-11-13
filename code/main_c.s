	.file	"main_long.c"
	.text
	.p2align 4
	.globl	read_string
	.type	read_string, @function
read_string:
.LFB51:
	.cfi_startproc
	endbr64
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rdx, %rcx
	movq	%rsi, %rbx
	movl	$1000000, %edx
	movl	$1, %esi
	call	fread@PLT
	movl	%eax, (%rbx)
	popq	%rbx
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE51:
	.size	read_string, .-read_string
	.p2align 4
	.globl	print_string
	.type	print_string, @function
print_string:
.LFB52:
	.cfi_startproc
	endbr64
	testl	%edi, %edi
	jle	.L9
	leal	-1(%rdi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	leaq	1(%rsi,%rax), %r12
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	.p2align 4,,10
	.p2align 3
.L6:
	movsbl	(%rbx), %edi
	movq	%rbp, %rsi
	addq	$1, %rbx
	call	fputc@PLT
	cmpq	%r12, %rbx
	jne	.L6
	popq	%rbx
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	ret
	.cfi_endproc
.LFE52:
	.size	print_string, .-print_string
	.p2align 4
	.globl	process
	.type	process, @function
process:
.LFB53:
	.cfi_startproc
	endbr64
	testl	%ecx, %ecx
	jle	.L26
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	leal	-1(%rcx), %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	1(%rdx,%rax), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	leaq	rims(%rip), %r13
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movq	%rdi, %r12
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movq	%rdx, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movq	%rsi, %rbx
	subq	$8, %rsp
	.cfi_def_cfa_offset 64
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L14:
	movslq	(%rbx), %rdx
	movb	%al, (%r12,%rdx)
	addl	$1, (%rbx)
.L16:
	addq	$1, %rbp
	cmpq	%rbp, %r14
	je	.L29
.L21:
	movzbl	0(%rbp), %eax
	leal	-49(%rax), %edx
	cmpb	$8, %dl
	ja	.L14
	subl	$48, %eax
	movsbq	%al, %rax
	movq	0(%r13,%rax,8), %r15
	movq	%r15, %rdi
	call	strlen@PLT
	testl	%eax, %eax
	jle	.L16
	movzbl	(%r15), %ecx
	movslq	(%rbx), %rdx
	movb	%cl, (%r12,%rdx)
	movl	(%rbx), %edi
	leal	1(%rdi), %ecx
	movl	%ecx, (%rbx)
	cmpl	$1, %eax
	je	.L16
	leal	-2(%rax), %edx
	movl	$1, %esi
	addq	$2, %rdx
	.p2align 4,,10
	.p2align 3
.L19:
	movsbl	0(%rbp), %eax
	movslq	%ecx, %rcx
	subl	$48, %eax
	cltq
	movq	0(%r13,%rax,8), %rax
	movzbl	(%rax,%rsi), %eax
	addq	$1, %rsi
	movb	%al, (%r12,%rcx)
	movl	(%rbx), %eax
	leal	1(%rax), %ecx
	movl	%ecx, (%rbx)
	cmpq	%rdx, %rsi
	jne	.L19
	addq	$1, %rbp
	cmpq	%rbp, %r14
	jne	.L21
.L29:
	addq	$8, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L26:
	.cfi_restore 3
	.cfi_restore 6
	.cfi_restore 12
	.cfi_restore 13
	.cfi_restore 14
	.cfi_restore 15
	ret
	.cfi_endproc
.LFE53:
	.size	process, .-process
	.p2align 4
	.globl	generate
	.type	generate, @function
generate:
.LFB54:
	.cfi_startproc
	endbr64
	movl	(%rsi), %eax
	pushq	%r12
	.cfi_def_cfa_offset 16
	.cfi_offset 12, -16
	pushq	%rbp
	.cfi_def_cfa_offset 24
	.cfi_offset 6, -24
	movq	%rdi, %rbp
	pushq	%rbx
	.cfi_def_cfa_offset 32
	.cfi_offset 3, -32
	movq	%rsi, %rbx
	cmpl	$-1, %eax
	je	.L38
.L31:
	xorl	%r12d, %r12d
	testl	%eax, %eax
	jle	.L30
	.p2align 4,,10
	.p2align 3
.L32:
	call	rand@PLT
	cltd
	shrl	$25, %edx
	addl	%edx, %eax
	andl	$127, %eax
	subl	%edx, %eax
	movb	%al, 0(%rbp,%r12)
	addq	$1, %r12
	cmpl	%r12d, (%rbx)
	jg	.L32
.L30:
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 24
	popq	%rbp
	.cfi_def_cfa_offset 16
	popq	%r12
	.cfi_def_cfa_offset 8
	ret
	.p2align 4,,10
	.p2align 3
.L38:
	.cfi_restore_state
	call	rand@PLT
	movslq	%eax, %rdx
	movl	%eax, %ecx
	imulq	$1374389535, %rdx, %rdx
	sarl	$31, %ecx
	sarq	$37, %rdx
	subl	%ecx, %edx
	imull	$100, %edx, %edx
	subl	%edx, %eax
	addl	$1, %eax
	movl	%eax, (%rbx)
	jmp	.L31
	.cfi_endproc
.LFE54:
	.size	generate, .-generate
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Command line doesn't fit pattern '{program_name} -d {input_file_name} {output_file_name}' "
	.align 8
.LC1:
	.string	"or\n'{program_name} -g {string_size} {output_file_name}\n'Program finished."
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"-g"
.LC3:
	.string	"-d"
.LC4:
	.string	"r"
	.section	.rodata.str1.8
	.align 8
.LC5:
	.string	"Couldn't open input file.\nProgram finished."
	.section	.rodata.str1.1
.LC6:
	.string	"w"
	.section	.rodata.str1.8
	.align 8
.LC7:
	.string	"Couldn't open output file.\nProgram finished."
	.section	.rodata.str1.1
.LC8:
	.string	"input data:\n"
.LC9:
	.string	"\n\noutput data:\n"
.LC11:
	.string	"Spent time:%f sec.\n"
	.section	.text.startup,"ax",@progbits
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB55:
	.cfi_startproc
	endbr64
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	leaq	-1998848(%rsp), %r11
	.cfi_def_cfa 11, 1998904
.LPSRL0:
	subq	$4096, %rsp
	orq	$0, (%rsp)
	cmpq	%r11, %rsp
	jne	.LPSRL0
	.cfi_def_cfa_register 7
	subq	$1240, %rsp
	.cfi_def_cfa_offset 2000144
	movq	%fs:40, %rax
	movq	%rax, 2000072(%rsp)
	xorl	%eax, %eax
	cmpl	$4, %edi
	je	.L40
.L43:
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	leaq	.LC1(%rip), %rdi
	call	puts@PLT
.L41:
	movq	2000072(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L70
	addq	$2000088, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L40:
	.cfi_restore_state
	xorl	%edi, %edi
	movq	%rsi, %rbx
	leaq	.LC3(%rip), %r12
	call	time@PLT
	movl	%eax, %edi
	call	srand@PLT
	movq	8(%rbx), %rbp
	leaq	.LC2(%rip), %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L68
.L42:
	movq	%r12, %rsi
	movq	%rbp, %rdi
	movl	$0, 60(%rsp)
	call	strcmp@PLT
	testl	%eax, %eax
	jne	.L44
	movq	24(%rbx), %rax
	movq	16(%rbx), %rdi
	leaq	.LC4(%rip), %rsi
	movq	%rax, 32(%rsp)
	call	fopen@PLT
	movq	%rax, %rbp
	testq	%rax, %rax
	je	.L71
	leaq	64(%rsp), %rax
	leaq	60(%rsp), %rsi
	movq	%rbp, %rdx
	movq	%rax, %rdi
	movq	%rax, 24(%rsp)
	call	read_string
	movq	%rbp, %rdi
	call	fclose@PLT
.L46:
	call	clock@PLT
	movq	$50000, 16(%rsp)
	movq	%rax, 40(%rsp)
	movl	60(%rsp), %eax
	movl	%eax, 12(%rsp)
	subl	$1, %eax
	leaq	65(%rsp,%rax), %rbx
	.p2align 4,,10
	.p2align 3
.L51:
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L58
	movq	24(%rsp), %r13
	xorl	%r15d, %r15d
	leaq	rims(%rip), %rbp
	jmp	.L50
	.p2align 4,,10
	.p2align 3
.L48:
	movslq	%r15d, %rdx
	addl	$1, %r15d
	movb	%al, 1000064(%rsp,%rdx)
.L49:
	addq	$1, %r13
	cmpq	%r13, %rbx
	je	.L47
.L50:
	movzbl	0(%r13), %eax
	leal	-49(%rax), %edx
	cmpb	$8, %dl
	ja	.L48
	subl	$48, %eax
	movsbq	%al, %rax
	movq	0(%rbp,%rax,8), %r12
	movq	%r12, %rdi
	call	strlen@PLT
	movq	%rax, %r14
	testl	%eax, %eax
	jle	.L49
	movslq	%r15d, %rax
	leal	-1(%r14), %edx
	movq	%r12, %rsi
	addq	$1, %r13
	leaq	1000064(%rsp,%rax), %rdi
	addq	$1, %rdx
	addl	%r14d, %r15d
	call	memcpy@PLT
	cmpq	%r13, %rbx
	jne	.L50
.L47:
	subq	$1, 16(%rsp)
	jne	.L51
.L73:
	call	clock@PLT
	movq	32(%rsp), %rdi
	leaq	.LC6(%rip), %rsi
	movq	%rax, %rbx
	call	fopen@PLT
	movq	%rax, %r12
	testq	%rax, %rax
	je	.L72
	movq	%rax, %rcx
	movl	$12, %edx
	movl	$1, %esi
	leaq	.LC8(%rip), %rdi
	call	fwrite@PLT
	movl	12(%rsp), %eax
	testl	%eax, %eax
	jle	.L53
	subl	$1, %eax
	movq	24(%rsp), %r13
	leaq	65(%rsp,%rax), %rbp
.L54:
	movsbl	0(%r13), %edi
	movq	%r12, %rsi
	addq	$1, %r13
	call	fputc@PLT
	cmpq	%rbp, %r13
	jne	.L54
.L53:
	movq	%r12, %rcx
	movl	$15, %edx
	movl	$1, %esi
	leaq	.LC9(%rip), %rdi
	call	fwrite@PLT
	testl	%r15d, %r15d
	je	.L55
	leal	-1(%r15), %eax
	leaq	1000064(%rsp), %rbp
	leaq	1000065(%rsp,%rax), %r13
.L56:
	movsbl	0(%rbp), %edi
	movq	%r12, %rsi
	addq	$1, %rbp
	call	fputc@PLT
	cmpq	%r13, %rbp
	jne	.L56
.L55:
	pxor	%xmm0, %xmm0
	pxor	%xmm1, %xmm1
	movl	$1, %edi
	movl	$1, %eax
	cvtsi2sdq	40(%rsp), %xmm1
	leaq	.LC11(%rip), %rsi
	cvtsi2sdq	%rbx, %xmm0
	subsd	%xmm1, %xmm0
	mulsd	.LC10(%rip), %xmm0
	call	__printf_chk@PLT
	movq	%r12, %rdi
	call	fclose@PLT
	jmp	.L41
.L68:
	movq	%r12, %rsi
	movq	%rbp, %rdi
	call	strcmp@PLT
	testl	%eax, %eax
	je	.L42
	jmp	.L43
	.p2align 4,,10
	.p2align 3
.L58:
	xorl	%r15d, %r15d
	subq	$1, 16(%rsp)
	jne	.L51
	jmp	.L73
.L44:
	movq	16(%rbx), %rdi
	xorl	%esi, %esi
	movl	$10, %edx
	call	strtol@PLT
	leaq	60(%rsp), %rsi
	movl	%eax, 60(%rsp)
	movq	24(%rbx), %rax
	movq	%rax, 32(%rsp)
	leaq	64(%rsp), %rax
	movq	%rax, %rdi
	movq	%rax, 24(%rsp)
	call	generate
	jmp	.L46
.L71:
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L41
.L72:
	leaq	.LC7(%rip), %rdi
	call	puts@PLT
	jmp	.L41
.L70:
	call	__stack_chk_fail@PLT
	.cfi_endproc
.LFE55:
	.size	main, .-main
	.globl	rims
	.section	.rodata.str1.1
.LC12:
	.string	"0"
.LC13:
	.string	"I"
.LC14:
	.string	"II"
.LC15:
	.string	"III"
.LC16:
	.string	"IV"
.LC17:
	.string	"V"
.LC18:
	.string	"VI"
.LC19:
	.string	"VII"
.LC20:
	.string	"VIII"
.LC21:
	.string	"IX"
	.section	.data.rel.local,"aw"
	.align 32
	.type	rims, @object
	.size	rims, 80
rims:
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	.LC15
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.quad	.LC19
	.quad	.LC20
	.quad	.LC21
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC10:
	.long	-1598689907
	.long	1051772663
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
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
