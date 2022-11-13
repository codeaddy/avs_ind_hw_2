	.file	"main.c"
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
	lea	r12, 1[rsi+rax] 				# сохранили указатель на последний символ str
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
	