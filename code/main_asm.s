	.file	"main_long.c"
	.intel_syntax noprefix
	.text
	.p2align 4
	.globl	read_string
	.type	read_string, @function
read_string:
	push	rbx
	mov	rcx, rdx
	mov	rbx, rsi
	mov	edx, 1000000
	mov	esi, 1
	call	fread@PLT
	mov	DWORD PTR [rbx], eax
	pop	rbx
	ret
	.size	read_string, .-read_string
	.p2align 4
	.globl	print_string
	.type	print_string, @function
print_string:
	test	edi, edi
	jle	.L9
	lea	eax, -1[rdi]
	push	r12
	lea	r12, 1[rsi+rax]
	push	rbp
	mov	rbp, rdx
	push	rbx
	mov	rbx, rsi
	.p2align 4,,10
	.p2align 3
.L6:
	movsx	edi, BYTE PTR [rbx]
	mov	rsi, rbp
	add	rbx, 1
	call	fputc@PLT
	cmp	rbx, r12
	jne	.L6
	pop	rbx
	pop	rbp
	pop	r12
	ret
	.p2align 4,,10
	.p2align 3
.L9:
	ret
	.size	print_string, .-print_string
	.p2align 4
	.globl	process
	.type	process, @function
process:
	test	ecx, ecx
	jle	.L23
	push	r15
	lea	eax, -1[rcx]
	push	r14
	lea	r15, 1[rdx+rax]
	lea	r14, rims[rip]
	push	r13
	mov	r13, rdi
	push	r12
	mov	r12, rdx
	push	rbp
	mov	rbp, rsi
	push	rbx
	sub	rsp, 8
	jmp	.L19
	.p2align 4,,10
	.p2align 3
.L14:
	movsx	rax, DWORD PTR 0[rbp]
	mov	BYTE PTR 0[r13+rax], bl
	add	DWORD PTR 0[rbp], 1
.L16:
	add	r12, 1
	cmp	r15, r12
	je	.L27
.L19:
	movsx	ebx, BYTE PTR [r12]
	lea	eax, -49[rbx]
	cmp	al, 8
	ja	.L14
	lea	eax, -48[rbx]
	movsx	rax, al
	mov	rdi, QWORD PTR [r14+rax*8]
	call	strlen@PLT
	test	eax, eax
	jle	.L16
	lea	esi, -1[rax]
	mov	ecx, DWORD PTR 0[rbp]
	xor	eax, eax
	jmp	.L18
	.p2align 4,,10
	.p2align 3
.L28:
	movsx	ebx, BYTE PTR [r12]
	mov	rax, rdx
.L18:
	sub	ebx, 48
	movsx	rcx, ecx
	movsx	rbx, ebx
	mov	rdx, QWORD PTR [r14+rbx*8]
	movzx	edx, BYTE PTR [rdx+rax]
	mov	BYTE PTR 0[r13+rcx], dl
	mov	edi, DWORD PTR 0[rbp]
	lea	rdx, 1[rax]
	lea	ecx, 1[rdi]
	mov	DWORD PTR 0[rbp], ecx
	cmp	rax, rsi
	jne	.L28
	add	r12, 1
	cmp	r15, r12
	jne	.L19
.L27:
	add	rsp, 8
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L23:
	ret
	.size	process, .-process
	.p2align 4
	.globl	generate
	.type	generate, @function
generate:
	mov	eax, DWORD PTR [rsi]
	push	r12
	push	rbp
	mov	rbp, rdi
	push	rbx
	mov	rbx, rsi
	cmp	eax, -1
	je	.L37
.L30:
	xor	r12d, r12d
	test	eax, eax
	jle	.L29
	.p2align 4,,10
	.p2align 3
.L31:
	call	rand@PLT
	cdq
	shr	edx, 25
	add	eax, edx
	and	eax, 127
	sub	eax, edx
	mov	BYTE PTR 0[rbp+r12], al
	add	r12, 1
	cmp	DWORD PTR [rbx], r12d
	jg	.L31
.L29:
	pop	rbx
	pop	rbp
	pop	r12
	ret
	.p2align 4,,10
	.p2align 3
.L37:
	call	rand@PLT
	movsx	rdx, eax
	mov	ecx, eax
	imul	rdx, rdx, 1374389535
	sar	ecx, 31
	sar	rdx, 37
	sub	edx, ecx
	imul	edx, edx, 100
	sub	eax, edx
	add	eax, 1
	mov	DWORD PTR [rbx], eax
	jmp	.L30
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
	push	r15
	push	r14
	push	r13
	push	r12
	push	rbp
	push	rbx
	lea	r11, -1998848[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 1208
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR 2000040[rsp], rax
	xor	eax, eax
	cmp	edi, 4
	je	.L39
.L42:
	lea	rdi, .LC0[rip]
	call	puts@PLT
	lea	rdi, .LC1[rip]
	call	puts@PLT
.L40:
	mov	rax, QWORD PTR 2000040[rsp]
	sub	rax, QWORD PTR fs:40
	jne	.L54
	add	rsp, 2000056
	xor	eax, eax
	pop	rbx
	pop	rbp
	pop	r12
	pop	r13
	pop	r14
	pop	r15
	ret
.L39:
	xor	edi, edi
	mov	rbx, rsi
	lea	r12, .LC3[rip]
	call	time@PLT
	mov	edi, eax
	call	srand@PLT
	mov	rbp, QWORD PTR 8[rbx]
	lea	rsi, .LC2[rip]
	mov	rdi, rbp
	call	strcmp@PLT
	test	eax, eax
	je	.L41
	mov	rsi, r12
	mov	rdi, rbp
	call	strcmp@PLT
	test	eax, eax
	jne	.L42
.L41:
	mov	rsi, r12
	mov	rdi, rbp
	mov	DWORD PTR 24[rsp], 0
	call	strcmp@PLT
	test	eax, eax
	jne	.L43
	mov	rdi, QWORD PTR 16[rbx]
	lea	rsi, .LC4[rip]
	mov	r15, QWORD PTR 24[rbx]
	call	fopen@PLT
	mov	r12, rax
	test	rax, rax
	je	.L55
	lea	rbp, 32[rsp]
	lea	rsi, 24[rsp]
	mov	rdx, rax
	mov	rdi, rbp
	call	read_string
	mov	rdi, r12
	call	fclose@PLT
.L45:
	call	clock@PLT
	mov	r13d, DWORD PTR 24[rsp]
	mov	ebx, 50000
	lea	r14, 28[rsp]
	mov	QWORD PTR 8[rsp], rax
	lea	r12, 1000032[rsp]
	.p2align 4,,10
	.p2align 3
.L46:
	mov	ecx, r13d
	mov	rdx, rbp
	mov	rsi, r14
	mov	rdi, r12
	mov	DWORD PTR 28[rsp], 0
	call	process
	sub	rbx, 1
	jne	.L46
	call	clock@PLT
	lea	rsi, .LC6[rip]
	mov	rdi, r15
	mov	rbx, rax
	call	fopen@PLT
	mov	r14, rax
	test	rax, rax
	je	.L56
	mov	rcx, rax
	mov	edx, 12
	mov	esi, 1
	lea	rdi, .LC8[rip]
	call	fwrite@PLT
	mov	rdx, r14
	mov	rsi, rbp
	mov	edi, r13d
	call	print_string
	mov	rcx, r14
	mov	edx, 15
	mov	esi, 1
	lea	rdi, .LC9[rip]
	call	fwrite@PLT
	mov	edi, DWORD PTR 28[rsp]
	mov	rdx, r14
	mov	rsi, r12
	call	print_string
	pxor	xmm0, xmm0
	pxor	xmm1, xmm1
	lea	rsi, .LC11[rip]
	cvtsi2sd	xmm0, rbx
	mov	edi, 1
	mov	eax, 1
	cvtsi2sd	xmm1, QWORD PTR 8[rsp]
	subsd	xmm0, xmm1
	divsd	xmm0, QWORD PTR .LC10[rip]
	call	__printf_chk@PLT
	mov	rdi, r14
	call	fclose@PLT
	jmp	.L40
.L43:
	mov	rdi, QWORD PTR 16[rbx]
	xor	esi, esi
	mov	edx, 10
	lea	rbp, 32[rsp]
	call	strtol@PLT
	lea	rsi, 24[rsp]
	mov	rdi, rbp
	mov	r15, QWORD PTR 24[rbx]
	mov	DWORD PTR 24[rsp], eax
	call	generate
	jmp	.L45
.L55:
	lea	rdi, .LC5[rip]
	call	puts@PLT
	jmp	.L40
.L56:
	lea	rdi, .LC7[rip]
	call	puts@PLT
	jmp	.L40
.L54:
	call	__stack_chk_fail@PLT
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
	.long	0
	.long	1093567616
	.ident	"GCC: (Ubuntu 11.2.0-19ubuntu1) 11.2.0"
	.section	.note.GNU-stack,"",@progbits
