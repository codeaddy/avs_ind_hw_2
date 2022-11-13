	.file	"main.c"
	.intel_syntax noprefix
	.text
	.globl	rims
	.section	.rodata
.LC0:
	.string	"0"
.LC1:
	.string	"I"
.LC2:
	.string	"II"
.LC3:
	.string	"III"
.LC4:
	.string	"IV"
.LC5:
	.string	"V"
.LC6:
	.string	"VI"
.LC7:
	.string	"VII"
.LC8:
	.string	"VIII"
.LC9:
	.string	"IX"
	.section	.data.rel.local,"aw"
	.align 32
	.type	rims, @object
	.size	rims, 80
rims:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.quad	.LC8
	.quad	.LC9
	.text
	.globl	read_string
	.type	read_string, @function
read_string:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -8[rbp], rdi 			# принимаем входные параметры (str, n, ptr)
	mov	QWORD PTR -16[rbp], rsi
	mov	QWORD PTR -24[rbp], rdx
	mov	rdx, QWORD PTR -24[rbp]
	mov	rax, QWORD PTR -8[rbp]
	mov	rcx, rdx
	mov	edx, 1000000
	mov	esi, 1
	mov	rdi, rax
	call	fread@PLT
	mov	edx, eax
	mov	rax, QWORD PTR -16[rbp]
	mov	DWORD PTR [rax], edx			# n = fread(...), то есть сохраняем число считанных символов с файла
	nop
	leave
	ret
	.size	read_string, .-read_string
	.globl	print_string
	.type	print_string, @function
print_string:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	DWORD PTR -20[rbp], edi  		# сохранили res_len
	mov	QWORD PTR -32[rbp], rsi 		# str
	mov	QWORD PTR -40[rbp], rdx 		# ptr
	mov	DWORD PTR -4[rbp], 0 			# i = 0
	jmp	.L3
.L4:
	mov	eax, DWORD PTR -4[rbp] 			
	movsx	rdx, eax
	mov	rax, QWORD PTR -32[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	mov	rdx, QWORD PTR -40[rbp] 		# передаем ссылку на выходной файл
	mov	rsi, rdx						# передаем i
	mov	edi, eax 						# передаем строку
	call	fputc@PLT
	add	DWORD PTR -4[rbp], 1 			# i++
.L3:
	mov	eax, DWORD PTR -4[rbp]
	cmp	eax, DWORD PTR -20[rbp] 		# i < res_len ?
	jl	.L4
	nop
	nop
	leave
	ret
	.size	print_string, .-print_string
	.globl	process
	.type	process, @function
process:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 48
	mov	QWORD PTR -24[rbp], rdi 		# сохраняем result
	mov	QWORD PTR -32[rbp], rsi 		# res_len
	mov	QWORD PTR -40[rbp], rdx 		# str
	mov	DWORD PTR -44[rbp], ecx 		# n
	mov	DWORD PTR -12[rbp], 0			# i = 0
	jmp	.L6
.L11:
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 48 							# str[i] >= '1' ?
	jle	.L7
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	cmp	al, 57 							# str[i] <= '9' ?
	jg	.L7
	mov	eax, DWORD PTR -12[rbp]			
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	sub	eax, 48
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, rims[rip]
	mov	rax, QWORD PTR [rdx+rax]
	mov	rdi, rax
	call	strlen@PLT
	mov	DWORD PTR -4[rbp], eax 			# tmp = strlen(rims[str[i] - '0'])
	mov	DWORD PTR -8[rbp], 0			# j = 0
	jmp	.L8
.L9:
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	add	rax, rdx
	movzx	eax, BYTE PTR [rax]
	movsx	eax, al
	sub	eax, 48
	cdqe
	lea	rdx, 0[0+rax*8]
	lea	rax, rims[rip]
	mov	rdx, QWORD PTR [rdx+rax]
	mov	eax, DWORD PTR -8[rbp]
	cdqe
	lea	rcx, [rdx+rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR [rcx]
	mov	BYTE PTR [rdx], al
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax] 					# res_len + 1
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], edx 			# result[*res_len] = rims[str[i] - '0'][j]
	add	DWORD PTR -8[rbp], 1 			# j++
.L8:
	mov	eax, DWORD PTR -8[rbp]
	cmp	eax, DWORD PTR -4[rbp]			# j < tmp ?
	jl	.L9
	jmp	.L10
.L7:
	mov	eax, DWORD PTR -12[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -40[rbp]
	lea	rcx, [rdx+rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rdx, rax
	movzx	eax, BYTE PTR [rcx]
	mov	BYTE PTR [rdx], al
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	lea	edx, 1[rax]
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], edx
.L10:
	add	DWORD PTR -12[rbp], 1 			# i++
.L6:
	mov	eax, DWORD PTR -12[rbp]
	cmp	eax, DWORD PTR -44[rbp] 		# i < n ?
	jl	.L11
	nop
	nop
	leave
	ret
	.size	process, .-process
	.globl	generate
	.type	generate, @function
generate:
	endbr64
	push	rbp
	mov	rbp, rsp
	sub	rsp, 32
	mov	QWORD PTR -24[rbp], rdi 		# сохранили str
	mov	QWORD PTR -32[rbp], rsi 		# сохранили n
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	eax, -1 						# (*n) == -1 ?
	jne	.L13
	call	rand@PLT
	movsx	rdx, eax
	imul	rdx, rdx, 1374389535
	shr	rdx, 32
	sar	edx, 5
	mov	ecx, eax
	sar	ecx, 31
	sub	edx, ecx
	imul	ecx, edx, 100
	sub	eax, ecx
	mov	edx, eax
	add	edx, 1
	mov	rax, QWORD PTR -32[rbp]
	mov	DWORD PTR [rax], edx 			# обновили n
.L13:
	mov	DWORD PTR -4[rbp], 0 			# i = 0
	jmp	.L14
.L15:
	call	rand@PLT
	cdq
	shr	edx, 25
	add	eax, edx
	and	eax, 127
	sub	eax, edx
	mov	ecx, eax
	mov	eax, DWORD PTR -4[rbp]
	movsx	rdx, eax
	mov	rax, QWORD PTR -24[rbp]
	add	rax, rdx
	mov	edx, ecx
	mov	BYTE PTR [rax], dl 				# str[i] = (char)(rand() % 128)
	add	DWORD PTR -4[rbp], 1 			# i++
.L14:
	mov	rax, QWORD PTR -32[rbp]
	mov	eax, DWORD PTR [rax]
	cmp	DWORD PTR -4[rbp], eax 			# i < *n ?
	jl	.L15
	nop
	nop
	leave
	ret
	.size	generate, .-generate
	.section	.rodata
	.align 8
.LC10:
	.string	"Command line doesn't fit pattern '{program_name} -d {input_file_name} {output_file_name}' "
	.align 8
.LC11:
	.string	"or\n'{program_name} -g {string_size} {output_file_name}\n'Program finished."
.LC12:
	.string	"-g"
.LC13:
	.string	"-d"
.LC14:
	.string	"r"
	.align 8
.LC15:
	.string	"Couldn't open input file.\nProgram finished."
.LC16:
	.string	"w"
	.align 8
.LC17:
	.string	"Couldn't open output file.\nProgram finished."
.LC18:
	.string	"input data:\n"
.LC19:
	.string	"\n\noutput data:\n"
.LC21:
	.string	"Spent time:%f sec."
	.text
	.globl	main
	.type	main, @function
main:
	endbr64
	push	rbp
	mov	rbp, rsp
	lea	r11, -1998848[rsp]
.LPSRL0:
	sub	rsp, 4096
	or	DWORD PTR [rsp], 0
	cmp	rsp, r11
	jne	.LPSRL0
	sub	rsp, 1248
	mov	DWORD PTR -2000084[rbp], edi	# argc
	mov	QWORD PTR -2000096[rbp], rsi 	# argv
	mov	rax, QWORD PTR fs:40
	mov	QWORD PTR -8[rbp], rax
	xor	eax, eax
	cmp	DWORD PTR -2000084[rbp], 4		# argc != 4 ?
	je	.L17
	lea	rax, .LC10[rip]					# выводим строку о том, что ввод некорректен и завершаем программу
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L24
.L17:
	mov	edi, 0
	call	time@PLT
	mov	edi, eax						# srand(time(NULL))
	call	srand@PLT
	mov	rax, QWORD PTR -2000096[rbp]	
	mov	rax, QWORD PTR 8[rax]			# rax = argv[1]
	mov	QWORD PTR -2000056[rbp], rax	# сохранили argv[1]
	mov	rax, QWORD PTR -2000056[rbp]
	lea	rdx, .LC12[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT					# type == -g ?
	test	eax, eax
	je	.L19
	mov	rax, QWORD PTR -2000056[rbp]
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT					# type == -d ?
	test	eax, eax
	je	.L19
	lea	rax, .LC10[rip]					# выводим строку о том, что ввод некорректен и завершаем программу
	mov	rdi, rax
	call	puts@PLT
	lea	rax, .LC11[rip]
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L24
.L19:
	mov	DWORD PTR -2000072[rbp], 0		# n = 0
	mov	rax, QWORD PTR -2000056[rbp]
	lea	rdx, .LC13[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	strcmp@PLT					# type == -d ?
	test	eax, eax
	jne	.L20
	mov	rax, QWORD PTR -2000096[rbp]
	mov	rax, QWORD PTR 16[rax]			# rax = argv[2]
	mov	QWORD PTR -2000048[rbp], rax	# сохранили argv[2]
	mov	rax, QWORD PTR -2000096[rbp]
	mov	rax, QWORD PTR 24[rax]			# rax = argv[3]
	mov	QWORD PTR -2000064[rbp], rax	# сохранили argv[3]
	mov	rax, QWORD PTR -2000048[rbp]
	lea	rdx, .LC14[rip]
	mov	rsi, rdx
	mov	rdi, rax
	call	fopen@PLT
	mov	QWORD PTR -2000040[rbp], rax	# сохранили адрес входного файла
	cmp	QWORD PTR -2000040[rbp], 0
	jne	.L21 							# смогли ли открыть файл?
	lea	rax, .LC15[rip]					# выводим строку о том, что не смогли открыть входной файл
	mov	rdi, rax
	call	puts@PLT
	mov	eax, 0
	jmp	.L24
.L21:
	mov	rdx, QWORD PTR -2000040[rbp]	# передаем адрес входного файла
	lea	rcx, -2000072[rbp]
	lea	rax, -2000016[rbp]
	mov	rsi, rcx						# передаем переменную размера строки
	mov	rdi, rax						# передаем адрес строки для ввода
	call	read_string
	mov	rax, QWORD PTR -2000040[rbp]
	mov	rdi, rax
	call	fclose@PLT
	jmp	.L22
.L20:
	mov	rax, QWORD PTR -2000096[rbp]
	add	rax, 16 						# argv[2]
	mov	rax, QWORD PTR [rax]
	mov	rdi, rax
	call	atoi@PLT
	mov	DWORD PTR -2000072[rbp], eax 	# n = argv[2]
	mov	rax, QWORD PTR -2000096[rbp]
	mov	rax, QWORD PTR 24[rax]
	mov	QWORD PTR -2000064[rbp], rax
	lea	rdx, -2000072[rbp]
	lea	rax, -2000016[rbp]
	mov	rsi, rdx 						# передаем n
	mov	rdi, rax 						# передаем str
	call	generate
.L22:
	mov	DWORD PTR -2000068[rbp], 0		# res_len = 0
	call	clock@PLT
	mov	QWORD PTR -2000032[rbp], rax 	# t_start = clock()
	mov	ecx, DWORD PTR -2000072[rbp]	# передаем n
	lea	rdx, -2000016[rbp]				# передаем str
	lea	rsi, -2000068[rbp]				# передаем res_len
	lea	rax, -1000016[rbp]				# передаем result
	mov	rdi, rax
	call	process
	mov	rax, QWORD PTR -2000064[rbp]
	lea	rdx, .LC16[rip] 				
	mov	rsi, rdx						# передаем строку с правами доступа к выходному файлу
	mov	rdi, rax						# передаем адрес выходного файла
	call	fopen@PLT
	mov	QWORD PTR -2000024[rbp], rax
	cmp	QWORD PTR -2000024[rbp], 0
	jne	.L23
	lea	rax, .LC17[rip]
	mov	rdi, rax
	call	puts@PLT					# выводим строку о том, что не смогли открыть выходной файл
	mov	eax, 0
	jmp	.L24
.L23:
	mov	rax, QWORD PTR -2000024[rbp]
	mov	rcx, rax
	mov	edx, 12 						# передаем какие-то магические константы для функции fwrite
	mov	esi, 1
	lea	rax, .LC18[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	eax, DWORD PTR -2000072[rbp]
	mov	rdx, QWORD PTR -2000024[rbp] 	# передаем адрес к файлу
	lea	rcx, -2000016[rbp]
	mov	rsi, rcx 						# передаем строку для вывода (str)
	mov	edi, eax 						# передаем размер строки для вывода
	call	print_string
	mov	rax, QWORD PTR -2000024[rbp]
	mov	rcx, rax
	mov	edx, 15 						# опять какие-то магические константы для функции fwrite
	mov	esi, 1
	lea	rax, .LC19[rip]
	mov	rdi, rax
	call	fwrite@PLT
	mov	eax, DWORD PTR -2000068[rbp]
	mov	rdx, QWORD PTR -2000024[rbp] 	# передаем адрес к файлу
	lea	rcx, -1000016[rbp]
	mov	rsi, rcx 						# передаем строку для вывода (result)
	mov	edi, eax 						# передаем размер строки для вывода
	call	print_string
	call	clock@PLT
	pxor	xmm0, xmm0
	cvtsi2sd	xmm0, rax
	pxor	xmm1, xmm1
	cvtsi2sd	xmm1, QWORD PTR -2000032[rbp]
	subsd	xmm0, xmm1
	movsd	xmm1, QWORD PTR .LC20[rip]
	divsd	xmm0, xmm1
	movq	rax, xmm0 					# посчитали время выполнения программы в секундах
	movq	xmm0, rax
	lea	rax, .LC21[rip]
	mov	rdi, rax						# передаем сообщение о времени выполнения программы
	mov	eax, 1
	call	printf@PLT
	mov	rax, QWORD PTR -2000024[rbp]
	mov	rdi, rax						# передаем адрес выходного файла
	call	fclose@PLT
	mov	eax, 0
.L24:
	mov	rdx, QWORD PTR -8[rbp]
	sub	rdx, QWORD PTR fs:40
	je	.L25
	call	__stack_chk_fail@PLT
.L25:
	leave
	ret
	.size	main, .-main
	.section	.rodata
	.align 8
.LC20:
	.long	0
	.long	1093567616
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
