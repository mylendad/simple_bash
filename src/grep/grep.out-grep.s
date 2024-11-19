	.file	"grep.c"
	.text
.Ltext0:
	.file 0 "/home/mylendad/Projects/C3_SimpleBashUtils-1/src/grep" "grep.c"
	.section	.rodata
.LC0:
	.string	"Error"
.LC1:
	.string	"e:ivclnhsf:o"
	.text
	.globl	parser
	.type	parser, @function
parser:
.LFB0:
	.file 1 "grep.c"
	.loc 1 9 37
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$104, %rsp
	.cfi_offset 3, -24
	movq	%rdi, -88(%rbp)
	movl	%esi, -92(%rbp)
	movq	%rdx, -104(%rbp)
	.loc 1 10 11
	pxor	%xmm0, %xmm0
	movaps	%xmm0, -64(%rbp)
	movaps	%xmm0, -48(%rbp)
	movaps	%xmm0, -32(%rbp)
	.loc 1 13 11
	jmp	.L7
.L8:
	.loc 1 15 5
	cmpl	$101, -68(%rbp)
	je	.L3
	cmpl	$105, -68(%rbp)
	je	.L4
	jmp	.L10
.L3:
	.loc 1 18 24
	movl	$1, -56(%rbp)
	.loc 1 19 34
	movq	optarg(%rip), %rax
	movq	%rax, -64(%rbp)
	.loc 1 20 13
	jmp	.L6
.L4:
	.loc 1 22 24
	movl	$2, -52(%rbp)
	.loc 1 23 13
	jmp	.L6
.L10:
	.loc 1 50 13
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
	.loc 1 51 13
	movl	$1, %edi
	call	exit@PLT
.L6:
	.loc 1 53 21
	movq	-64(%rbp), %rax
	.loc 1 53 12
	testq	%rax, %rax
	jne	.L7
	.loc 1 54 40
	movl	optind(%rip), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-104(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	.loc 1 54 34
	movq	%rax, -64(%rbp)
	.loc 1 55 19
	movl	optind(%rip), %eax
	addl	$1, %eax
	movl	%eax, optind(%rip)
.L7:
	.loc 1 13 25
	movq	-104(%rbp), %rcx
	movl	-92(%rbp), %eax
	leaq	.LC1(%rip), %rdx
	movq	%rcx, %rsi
	movl	%eax, %edi
	call	getopt@PLT
	movl	%eax, -68(%rbp)
	.loc 1 13 61 discriminator 1
	cmpl	$-1, -68(%rbp)
	jne	.L8
	.loc 1 58 12
	movq	-88(%rbp), %rax
	movq	-64(%rbp), %rcx
	movq	-56(%rbp), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	-48(%rbp), %rcx
	movq	-40(%rbp), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	-32(%rbp), %rcx
	movq	-24(%rbp), %rbx
	movq	%rcx, 32(%rax)
	movq	%rbx, 40(%rax)
	.loc 1 59 1
	movq	-88(%rbp), %rax
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE0:
	.size	parser, .-parser
	.section	.rodata
.LC2:
	.string	"r"
	.text
	.globl	reader
	.type	reader, @function
reader:
.LFB1:
	.loc 1 62 55
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$48, %rsp
	movq	%rdi, -40(%rbp)
	movq	%rsi, -48(%rbp)
	.loc 1 63 15
	movq	-40(%rbp), %rax
	leaq	.LC2(%rip), %rdx
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -16(%rbp)
	.loc 1 64 8
	cmpq	$0, -16(%rbp)
	jne	.L12
	.loc 1 65 21
	movl	52(%rbp), %eax
	.loc 1 65 12
	testl	%eax, %eax
	je	.L13
	.loc 1 66 13
	movq	-40(%rbp), %rax
	movq	%rax, %rdi
	call	perror@PLT
.L13:
	.loc 1 68 9
	movl	$1, %edi
	call	exit@PLT
.L12:
	.loc 1 71 11
	movq	$0, -8(%rbp)
	.loc 1 72 9
	movl	$0, -24(%rbp)
	.loc 1 74 15
	jmp	.L15
.L16:
.LBB2:
	.loc 1 75 26
	movq	-8(%rbp), %rsi
	movq	-48(%rbp), %rax
	movl	$0, %r8d
	movl	$0, %ecx
	movl	$0, %edx
	movq	%rax, %rdi
	call	regexec@PLT
	movl	%eax, -20(%rbp)
	.loc 1 76 16
	cmpl	$0, -20(%rbp)
	jne	.L15
	.loc 1 77 13
	movl	-24(%rbp), %edx
	movq	-8(%rbp), %rax
	movl	%edx, %esi
	movq	%rax, %rdi
	call	outline
.L15:
.LBE2:
	.loc 1 74 16
	movq	-16(%rbp), %rdx
	movq	-8(%rbp), %rax
	movl	$1024, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	.loc 1 74 37 discriminator 1
	testq	%rax, %rax
	jne	.L16
	.loc 1 82 9
	movq	-8(%rbp), %rax
	movq	%rax, %rdi
	call	free@PLT
	.loc 1 83 21
	movl	36(%rbp), %eax
	.loc 1 83 12
	testl	%eax, %eax
	je	.L18
	.loc 1 83 35 discriminator 1
	movl	40(%rbp), %eax
	.loc 1 83 24 discriminator 1
	testl	%eax, %eax
	je	.L18
	.loc 1 85 13
	movq	-16(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
.L18:
	.loc 1 87 5
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE1:
	.size	reader, .-reader
	.globl	outline
	.type	outline, @function
outline:
.LFB2:
	.loc 1 90 32
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movq	%rdi, -24(%rbp)
	movl	%esi, -28(%rbp)
.LBB3:
	.loc 1 91 14
	movl	$0, -4(%rbp)
	.loc 1 91 5
	jmp	.L20
.L21:
	.loc 1 92 21
	movl	-4(%rbp), %eax
	movslq	%eax, %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 92 9
	movsbl	%al, %eax
	movl	%eax, %edi
	call	putchar@PLT
	.loc 1 91 29 discriminator 3
	addl	$1, -4(%rbp)
.L20:
	.loc 1 91 23 discriminator 1
	movl	-4(%rbp), %eax
	cmpl	-28(%rbp), %eax
	jl	.L21
.LBE3:
	.loc 1 95 13
	movl	-28(%rbp), %eax
	cltq
	leaq	-1(%rax), %rdx
	movq	-24(%rbp), %rax
	addq	%rdx, %rax
	movzbl	(%rax), %eax
	.loc 1 95 8
	cmpb	$10, %al
	je	.L23
	.loc 1 96 9
	movl	$10, %edi
	call	putchar@PLT
.L23:
	.loc 1 98 1
	nop
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE2:
	.size	outline, .-outline
	.globl	output
	.type	output, @function
output:
.LFB3:
	.loc 1 100 53
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%rbx
	subq	$120, %rsp
	.cfi_offset 3, -24
	movl	%edi, -116(%rbp)
	movq	%rsi, -128(%rbp)
	.loc 1 100 53
	movq	%fs:40, %rax
	movq	%rax, -24(%rbp)
	xorl	%eax, %eax
	.loc 1 102 16
	movq	-128(%rbp), %rdx
	movl	-116(%rbp), %eax
	movl	%eax, %esi
	leaq	16(%rbp), %rdi
	call	parser
	.loc 1 104 18
	movl	28(%rbp), %edx
	.loc 1 104 40
	movq	16(%rbp), %rcx
	.loc 1 104 18
	leaq	-96(%rbp), %rax
	movq	%rcx, %rsi
	movq	%rax, %rdi
	call	regcomp@PLT
	movl	%eax, -100(%rbp)
	.loc 1 105 8
	cmpl	$0, -100(%rbp)
	je	.L29
	.loc 1 106 9
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	perror@PLT
.LBB4:
	.loc 1 107 18
	movl	optind(%rip), %eax
	movl	%eax, -104(%rbp)
	.loc 1 107 9
	jmp	.L26
.L27:
	.loc 1 108 34
	movl	-104(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-128(%rbp), %rax
	addq	%rdx, %rax
	.loc 1 108 13
	movq	(%rax), %rdx
	leaq	-96(%rbp), %rsi
	subq	$48, %rsp
	movq	%rsp, %rax
	movq	16(%rbp), %rcx
	movq	24(%rbp), %rbx
	movq	%rcx, (%rax)
	movq	%rbx, 8(%rax)
	movq	32(%rbp), %rcx
	movq	40(%rbp), %rbx
	movq	%rcx, 16(%rax)
	movq	%rbx, 24(%rax)
	movq	48(%rbp), %rcx
	movq	56(%rbp), %rbx
	movq	%rcx, 32(%rax)
	movq	%rbx, 40(%rax)
	movq	%rdx, %rdi
	call	reader
	addq	$48, %rsp
	.loc 1 107 41 discriminator 3
	addl	$1, -104(%rbp)
.L26:
	.loc 1 107 32 discriminator 1
	movl	-104(%rbp), %eax
	cmpl	-116(%rbp), %eax
	jl	.L27
.L29:
.LBE4:
	.loc 1 112 1
	nop
	movq	-24(%rbp), %rax
	subq	%fs:40, %rax
	je	.L28
	call	__stack_chk_fail@PLT
.L28:
	movq	-8(%rbp), %rbx
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE3:
	.size	output, .-output
.Letext0:
	.file 2 "/usr/lib/gcc/x86_64-linux-gnu/13/include/stddef.h"
	.file 3 "/usr/include/x86_64-linux-gnu/bits/types.h"
	.file 4 "/usr/include/x86_64-linux-gnu/bits/types/struct_FILE.h"
	.file 5 "/usr/include/x86_64-linux-gnu/bits/types/FILE.h"
	.file 6 "/usr/include/regex.h"
	.file 7 "/usr/include/x86_64-linux-gnu/bits/getopt_core.h"
	.file 8 "grep.h"
	.file 9 "/usr/include/stdio.h"
	.file 10 "/usr/include/stdlib.h"
	.section	.debug_info,"",@progbits
.Ldebug_info0:
	.long	0x772
	.value	0x5
	.byte	0x1
	.byte	0x8
	.long	.Ldebug_abbrev0
	.uleb128 0x1a
	.long	.LASF98
	.byte	0x1d
	.long	.LASF0
	.long	.LASF1
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.long	.Ldebug_line0
	.uleb128 0x8
	.long	.LASF9
	.byte	0x2
	.byte	0xd6
	.byte	0x1b
	.long	0x3a
	.uleb128 0x5
	.byte	0x8
	.byte	0x7
	.long	.LASF2
	.uleb128 0x5
	.byte	0x4
	.byte	0x7
	.long	.LASF3
	.uleb128 0x1b
	.byte	0x8
	.uleb128 0x5
	.byte	0x1
	.byte	0x8
	.long	.LASF4
	.uleb128 0x5
	.byte	0x2
	.byte	0x7
	.long	.LASF5
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF6
	.uleb128 0x5
	.byte	0x2
	.byte	0x5
	.long	.LASF7
	.uleb128 0x1c
	.byte	0x4
	.byte	0x5
	.string	"int"
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF8
	.uleb128 0x8
	.long	.LASF10
	.byte	0x3
	.byte	0x98
	.byte	0x12
	.long	0x6d
	.uleb128 0x8
	.long	.LASF11
	.byte	0x3
	.byte	0x99
	.byte	0x12
	.long	0x6d
	.uleb128 0x3
	.long	0x9b
	.uleb128 0xa
	.long	0x8c
	.uleb128 0xf
	.long	0x8c
	.uleb128 0x5
	.byte	0x1
	.byte	0x6
	.long	.LASF12
	.uleb128 0xf
	.long	0x9b
	.uleb128 0x13
	.long	.LASF49
	.byte	0xd8
	.byte	0x4
	.byte	0x31
	.byte	0x8
	.long	0x22e
	.uleb128 0x1
	.long	.LASF13
	.byte	0x4
	.byte	0x33
	.byte	0x7
	.long	0x66
	.byte	0
	.uleb128 0x1
	.long	.LASF14
	.byte	0x4
	.byte	0x36
	.byte	0x9
	.long	0x8c
	.byte	0x8
	.uleb128 0x1
	.long	.LASF15
	.byte	0x4
	.byte	0x37
	.byte	0x9
	.long	0x8c
	.byte	0x10
	.uleb128 0x1
	.long	.LASF16
	.byte	0x4
	.byte	0x38
	.byte	0x9
	.long	0x8c
	.byte	0x18
	.uleb128 0x1
	.long	.LASF17
	.byte	0x4
	.byte	0x39
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0x1
	.long	.LASF18
	.byte	0x4
	.byte	0x3a
	.byte	0x9
	.long	0x8c
	.byte	0x28
	.uleb128 0x1
	.long	.LASF19
	.byte	0x4
	.byte	0x3b
	.byte	0x9
	.long	0x8c
	.byte	0x30
	.uleb128 0x1
	.long	.LASF20
	.byte	0x4
	.byte	0x3c
	.byte	0x9
	.long	0x8c
	.byte	0x38
	.uleb128 0x1
	.long	.LASF21
	.byte	0x4
	.byte	0x3d
	.byte	0x9
	.long	0x8c
	.byte	0x40
	.uleb128 0x1
	.long	.LASF22
	.byte	0x4
	.byte	0x40
	.byte	0x9
	.long	0x8c
	.byte	0x48
	.uleb128 0x1
	.long	.LASF23
	.byte	0x4
	.byte	0x41
	.byte	0x9
	.long	0x8c
	.byte	0x50
	.uleb128 0x1
	.long	.LASF24
	.byte	0x4
	.byte	0x42
	.byte	0x9
	.long	0x8c
	.byte	0x58
	.uleb128 0x1
	.long	.LASF25
	.byte	0x4
	.byte	0x44
	.byte	0x16
	.long	0x247
	.byte	0x60
	.uleb128 0x1
	.long	.LASF26
	.byte	0x4
	.byte	0x46
	.byte	0x14
	.long	0x24c
	.byte	0x68
	.uleb128 0x1
	.long	.LASF27
	.byte	0x4
	.byte	0x48
	.byte	0x7
	.long	0x66
	.byte	0x70
	.uleb128 0x1
	.long	.LASF28
	.byte	0x4
	.byte	0x49
	.byte	0x7
	.long	0x66
	.byte	0x74
	.uleb128 0x1
	.long	.LASF29
	.byte	0x4
	.byte	0x4a
	.byte	0xb
	.long	0x74
	.byte	0x78
	.uleb128 0x1
	.long	.LASF30
	.byte	0x4
	.byte	0x4d
	.byte	0x12
	.long	0x51
	.byte	0x80
	.uleb128 0x1
	.long	.LASF31
	.byte	0x4
	.byte	0x4e
	.byte	0xf
	.long	0x58
	.byte	0x82
	.uleb128 0x1
	.long	.LASF32
	.byte	0x4
	.byte	0x4f
	.byte	0x8
	.long	0x251
	.byte	0x83
	.uleb128 0x1
	.long	.LASF33
	.byte	0x4
	.byte	0x51
	.byte	0xf
	.long	0x261
	.byte	0x88
	.uleb128 0x1
	.long	.LASF34
	.byte	0x4
	.byte	0x59
	.byte	0xd
	.long	0x80
	.byte	0x90
	.uleb128 0x1
	.long	.LASF35
	.byte	0x4
	.byte	0x5b
	.byte	0x17
	.long	0x26b
	.byte	0x98
	.uleb128 0x1
	.long	.LASF36
	.byte	0x4
	.byte	0x5c
	.byte	0x19
	.long	0x275
	.byte	0xa0
	.uleb128 0x1
	.long	.LASF37
	.byte	0x4
	.byte	0x5d
	.byte	0x14
	.long	0x24c
	.byte	0xa8
	.uleb128 0x1
	.long	.LASF38
	.byte	0x4
	.byte	0x5e
	.byte	0x9
	.long	0x48
	.byte	0xb0
	.uleb128 0x1
	.long	.LASF39
	.byte	0x4
	.byte	0x5f
	.byte	0xa
	.long	0x2e
	.byte	0xb8
	.uleb128 0x1
	.long	.LASF40
	.byte	0x4
	.byte	0x60
	.byte	0x7
	.long	0x66
	.byte	0xc0
	.uleb128 0x1
	.long	.LASF41
	.byte	0x4
	.byte	0x62
	.byte	0x8
	.long	0x27a
	.byte	0xc4
	.byte	0
	.uleb128 0x8
	.long	.LASF42
	.byte	0x5
	.byte	0x7
	.byte	0x19
	.long	0xa7
	.uleb128 0x1d
	.long	.LASF99
	.byte	0x4
	.byte	0x2b
	.byte	0xe
	.uleb128 0xd
	.long	.LASF43
	.uleb128 0x3
	.long	0x242
	.uleb128 0x3
	.long	0xa7
	.uleb128 0x14
	.long	0x9b
	.long	0x261
	.uleb128 0x15
	.long	0x3a
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x23a
	.uleb128 0xd
	.long	.LASF44
	.uleb128 0x3
	.long	0x266
	.uleb128 0xd
	.long	.LASF45
	.uleb128 0x3
	.long	0x270
	.uleb128 0x14
	.long	0x9b
	.long	0x28a
	.uleb128 0x15
	.long	0x3a
	.byte	0x13
	.byte	0
	.uleb128 0x3
	.long	0x22e
	.uleb128 0xa
	.long	0x28a
	.uleb128 0x5
	.byte	0x8
	.byte	0x5
	.long	.LASF46
	.uleb128 0x8
	.long	.LASF47
	.byte	0x6
	.byte	0x38
	.byte	0x1b
	.long	0x3a
	.uleb128 0x8
	.long	.LASF48
	.byte	0x6
	.byte	0x48
	.byte	0x1b
	.long	0x3a
	.uleb128 0x1e
	.long	.LASF50
	.byte	0x40
	.byte	0x6
	.value	0x19d
	.byte	0x8
	.long	0x37f
	.uleb128 0x6
	.long	.LASF51
	.value	0x1a1
	.byte	0x14
	.long	0x384
	.byte	0
	.uleb128 0x6
	.long	.LASF52
	.value	0x1a4
	.byte	0x14
	.long	0x29b
	.byte	0x8
	.uleb128 0x6
	.long	.LASF53
	.value	0x1a7
	.byte	0x14
	.long	0x29b
	.byte	0x10
	.uleb128 0x6
	.long	.LASF54
	.value	0x1aa
	.byte	0x10
	.long	0x2a7
	.byte	0x18
	.uleb128 0x6
	.long	.LASF55
	.value	0x1af
	.byte	0x9
	.long	0x8c
	.byte	0x20
	.uleb128 0x6
	.long	.LASF56
	.value	0x1b5
	.byte	0x13
	.long	0x389
	.byte	0x28
	.uleb128 0x6
	.long	.LASF57
	.value	0x1b8
	.byte	0xa
	.long	0x2e
	.byte	0x30
	.uleb128 0x9
	.long	.LASF58
	.value	0x1be
	.long	0x41
	.byte	0x1
	.value	0x1c0
	.uleb128 0x9
	.long	.LASF59
	.value	0x1c9
	.long	0x41
	.byte	0x2
	.value	0x1c1
	.uleb128 0x9
	.long	.LASF60
	.value	0x1cd
	.long	0x41
	.byte	0x1
	.value	0x1c3
	.uleb128 0x9
	.long	.LASF61
	.value	0x1d1
	.long	0x41
	.byte	0x1
	.value	0x1c4
	.uleb128 0x9
	.long	.LASF62
	.value	0x1d5
	.long	0x41
	.byte	0x1
	.value	0x1c5
	.uleb128 0x9
	.long	.LASF63
	.value	0x1d8
	.long	0x41
	.byte	0x1
	.value	0x1c6
	.uleb128 0x9
	.long	.LASF64
	.value	0x1db
	.long	0x41
	.byte	0x1
	.value	0x1c7
	.byte	0
	.uleb128 0xd
	.long	.LASF65
	.uleb128 0x3
	.long	0x37f
	.uleb128 0x3
	.long	0x4a
	.uleb128 0x10
	.long	.LASF66
	.value	0x1de
	.byte	0x22
	.long	0x2b3
	.uleb128 0xf
	.long	0x38e
	.uleb128 0x10
	.long	.LASF67
	.value	0x1ea
	.byte	0xd
	.long	0x66
	.uleb128 0x1f
	.byte	0x8
	.byte	0x6
	.value	0x205
	.byte	0x9
	.long	0x3d0
	.uleb128 0x6
	.long	.LASF68
	.value	0x207
	.byte	0xc
	.long	0x39f
	.byte	0
	.uleb128 0x6
	.long	.LASF69
	.value	0x208
	.byte	0xc
	.long	0x39f
	.byte	0x4
	.byte	0
	.uleb128 0x10
	.long	.LASF70
	.value	0x209
	.byte	0x3
	.long	0x3ab
	.uleb128 0x16
	.long	.LASF71
	.byte	0x24
	.byte	0xe
	.long	0x8c
	.uleb128 0x16
	.long	.LASF72
	.byte	0x32
	.byte	0xc
	.long	0x66
	.uleb128 0x3
	.long	0xa2
	.uleb128 0xa
	.long	0x3f2
	.uleb128 0x13
	.long	.LASF73
	.byte	0x30
	.byte	0x8
	.byte	0x6
	.byte	0x10
	.long	0x471
	.uleb128 0x1
	.long	.LASF74
	.byte	0x8
	.byte	0x8
	.byte	0xb
	.long	0x8c
	.byte	0
	.uleb128 0x4
	.string	"e"
	.byte	0x9
	.long	0x66
	.byte	0x8
	.uleb128 0x4
	.string	"i"
	.byte	0xc
	.long	0x66
	.byte	0xc
	.uleb128 0x4
	.string	"v"
	.byte	0xf
	.long	0x66
	.byte	0x10
	.uleb128 0x4
	.string	"c"
	.byte	0x12
	.long	0x66
	.byte	0x14
	.uleb128 0x4
	.string	"l"
	.byte	0x15
	.long	0x66
	.byte	0x18
	.uleb128 0x4
	.string	"n"
	.byte	0x18
	.long	0x66
	.byte	0x1c
	.uleb128 0x4
	.string	"h"
	.byte	0x1b
	.long	0x66
	.byte	0x20
	.uleb128 0x4
	.string	"s"
	.byte	0x1e
	.long	0x66
	.byte	0x24
	.uleb128 0x4
	.string	"f"
	.byte	0x21
	.long	0x66
	.byte	0x28
	.uleb128 0x4
	.string	"o"
	.byte	0x24
	.long	0x66
	.byte	0x2c
	.byte	0
	.uleb128 0x8
	.long	.LASF73
	.byte	0x8
	.byte	0xa
	.byte	0x2
	.long	0x3fc
	.uleb128 0xc
	.long	.LASF75
	.byte	0x6
	.value	0x2a3
	.byte	0xc
	.long	0x66
	.long	0x49e
	.uleb128 0x2
	.long	0x4a3
	.uleb128 0x2
	.long	0x3f7
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x3
	.long	0x38e
	.uleb128 0xa
	.long	0x49e
	.uleb128 0xc
	.long	.LASF76
	.byte	0x9
	.value	0x26a
	.byte	0xc
	.long	0x66
	.long	0x4bf
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x17
	.long	.LASF77
	.byte	0x9
	.byte	0xb8
	.long	0x66
	.long	0x4d4
	.uleb128 0x2
	.long	0x28a
	.byte	0
	.uleb128 0x18
	.long	.LASF83
	.byte	0xa
	.value	0x2af
	.long	0x4e6
	.uleb128 0x2
	.long	0x48
	.byte	0
	.uleb128 0xc
	.long	.LASF78
	.byte	0x9
	.value	0x28e
	.byte	0xe
	.long	0x8c
	.long	0x507
	.uleb128 0x2
	.long	0x91
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x28f
	.byte	0
	.uleb128 0xc
	.long	.LASF79
	.byte	0x6
	.value	0x2a7
	.byte	0xc
	.long	0x66
	.long	0x532
	.uleb128 0x2
	.long	0x537
	.uleb128 0x2
	.long	0x3f7
	.uleb128 0x2
	.long	0x2e
	.uleb128 0x2
	.long	0x541
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x3
	.long	0x39a
	.uleb128 0xa
	.long	0x532
	.uleb128 0x3
	.long	0x3d0
	.uleb128 0xa
	.long	0x53c
	.uleb128 0xc
	.long	.LASF80
	.byte	0x9
	.value	0x108
	.byte	0xe
	.long	0x28a
	.long	0x562
	.uleb128 0x2
	.long	0x3f7
	.uleb128 0x2
	.long	0x3f7
	.byte	0
	.uleb128 0x17
	.long	.LASF81
	.byte	0x7
	.byte	0x5b
	.long	0x66
	.long	0x581
	.uleb128 0x2
	.long	0x66
	.uleb128 0x2
	.long	0x581
	.uleb128 0x2
	.long	0x3f2
	.byte	0
	.uleb128 0x3
	.long	0x96
	.uleb128 0x20
	.long	.LASF82
	.byte	0xa
	.value	0x2f4
	.byte	0xd
	.long	0x599
	.uleb128 0x2
	.long	0x66
	.byte	0
	.uleb128 0x18
	.long	.LASF84
	.byte	0x9
	.value	0x36e
	.long	0x5ab
	.uleb128 0x2
	.long	0x3f2
	.byte	0
	.uleb128 0x11
	.long	.LASF89
	.byte	0x64
	.quad	.LFB3
	.quad	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.long	0x631
	.uleb128 0x7
	.long	.LASF85
	.byte	0x64
	.byte	0x14
	.long	0x471
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x7
	.long	.LASF86
	.byte	0x64
	.byte	0x22
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -132
	.uleb128 0x7
	.long	.LASF87
	.byte	0x64
	.byte	0x2f
	.long	0x631
	.uleb128 0x3
	.byte	0x91
	.sleb128 -144
	.uleb128 0xe
	.string	"reg"
	.byte	0x67
	.byte	0xd
	.long	0x38e
	.uleb128 0x3
	.byte	0x91
	.sleb128 -112
	.uleb128 0xb
	.long	.LASF88
	.byte	0x68
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -116
	.uleb128 0x12
	.quad	.LBB4
	.quad	.LBE4-.LBB4
	.uleb128 0xe
	.string	"i"
	.byte	0x6b
	.byte	0x12
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.byte	0
	.byte	0
	.uleb128 0x3
	.long	0x8c
	.uleb128 0x11
	.long	.LASF90
	.byte	0x5a
	.quad	.LFB2
	.quad	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.long	0x68b
	.uleb128 0x7
	.long	.LASF91
	.byte	0x5a
	.byte	0x14
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x19
	.string	"n"
	.byte	0x5a
	.byte	0x1e
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x12
	.quad	.LBB3
	.quad	.LBE3-.LBB3
	.uleb128 0xe
	.string	"i"
	.byte	0x5b
	.byte	0xe
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.byte	0
	.byte	0
	.uleb128 0x11
	.long	.LASF92
	.byte	0x3e
	.quad	.LFB1
	.quad	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.long	0x71a
	.uleb128 0x7
	.long	.LASF85
	.byte	0x3e
	.byte	0x13
	.long	0x471
	.uleb128 0x2
	.byte	0x91
	.sleb128 0
	.uleb128 0x7
	.long	.LASF93
	.byte	0x3e
	.byte	0x23
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -56
	.uleb128 0x19
	.string	"reg"
	.byte	0x3e
	.byte	0x32
	.long	0x49e
	.uleb128 0x2
	.byte	0x91
	.sleb128 -64
	.uleb128 0xe
	.string	"f"
	.byte	0x3f
	.byte	0xb
	.long	0x28a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -32
	.uleb128 0xb
	.long	.LASF91
	.byte	0x47
	.byte	0xb
	.long	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0xb
	.long	.LASF94
	.byte	0x48
	.byte	0x9
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x12
	.quad	.LBB2
	.quad	.LBE2-.LBB2
	.uleb128 0xb
	.long	.LASF88
	.byte	0x4b
	.byte	0x11
	.long	0x66
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.byte	0
	.byte	0
	.uleb128 0x21
	.long	.LASF95
	.byte	0x1
	.byte	0x9
	.byte	0x7
	.long	0x471
	.quad	.LFB0
	.quad	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x7
	.long	.LASF96
	.byte	0x9
	.byte	0x12
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -108
	.uleb128 0x7
	.long	.LASF87
	.byte	0x9
	.byte	0x1f
	.long	0x631
	.uleb128 0x3
	.byte	0x91
	.sleb128 -120
	.uleb128 0xb
	.long	.LASF85
	.byte	0xa
	.byte	0xb
	.long	0x471
	.uleb128 0x3
	.byte	0x91
	.sleb128 -80
	.uleb128 0xb
	.long	.LASF97
	.byte	0xb
	.byte	0x9
	.long	0x66
	.uleb128 0x3
	.byte	0x91
	.sleb128 -84
	.byte	0
	.byte	0
	.section	.debug_abbrev,"",@progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x5
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 8
	.uleb128 0x3b
	.uleb128 0x21
	.sleb128 9
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0xd
	.uleb128 0xb
	.uleb128 0x6b
	.uleb128 0x5
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x37
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x13
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 6
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 7
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 12
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0x21
	.sleb128 13
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0x21
	.sleb128 1
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x1f
	.uleb128 0x1b
	.uleb128 0x1f
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x1e
	.uleb128 0x13
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1f
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x20
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x87
	.uleb128 0x19
	.uleb128 0x3c
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x21
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x39
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x7
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x7c
	.uleb128 0x19
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",@progbits
	.long	0x2c
	.value	0x2
	.long	.Ldebug_info0
	.byte	0x8
	.byte	0
	.value	0
	.value	0
	.quad	.Ltext0
	.quad	.Letext0-.Ltext0
	.quad	0
	.quad	0
	.section	.debug_line,"",@progbits
.Ldebug_line0:
	.section	.debug_str,"MS",@progbits,1
.LASF10:
	.string	"__off_t"
.LASF14:
	.string	"_IO_read_ptr"
.LASF26:
	.string	"_chain"
.LASF55:
	.string	"__fastmap"
.LASF9:
	.string	"size_t"
.LASF32:
	.string	"_shortbuf"
.LASF51:
	.string	"__buffer"
.LASF93:
	.string	"path"
.LASF20:
	.string	"_IO_buf_base"
.LASF92:
	.string	"reader"
.LASF83:
	.string	"free"
.LASF35:
	.string	"_codecvt"
.LASF58:
	.string	"__can_be_null"
.LASF46:
	.string	"long long int"
.LASF6:
	.string	"signed char"
.LASF61:
	.string	"__no_sub"
.LASF52:
	.string	"__allocated"
.LASF27:
	.string	"_fileno"
.LASF15:
	.string	"_IO_read_end"
.LASF64:
	.string	"__newline_anchor"
.LASF8:
	.string	"long int"
.LASF13:
	.string	"_flags"
.LASF21:
	.string	"_IO_buf_end"
.LASF30:
	.string	"_cur_column"
.LASF76:
	.string	"putchar"
.LASF44:
	.string	"_IO_codecvt"
.LASF54:
	.string	"__syntax"
.LASF29:
	.string	"_old_offset"
.LASF34:
	.string	"_offset"
.LASF66:
	.string	"regex_t"
.LASF53:
	.string	"__used"
.LASF91:
	.string	"line"
.LASF59:
	.string	"__regs_allocated"
.LASF43:
	.string	"_IO_marker"
.LASF3:
	.string	"unsigned int"
.LASF38:
	.string	"_freeres_buf"
.LASF2:
	.string	"long unsigned int"
.LASF98:
	.string	"GNU C11 13.2.0 -mtune=generic -march=x86-64 -g -std=c11 -fasynchronous-unwind-tables -fstack-protector-strong -fstack-clash-protection -fcf-protection"
.LASF85:
	.string	"argument"
.LASF18:
	.string	"_IO_write_ptr"
.LASF62:
	.string	"__not_bol"
.LASF5:
	.string	"short unsigned int"
.LASF97:
	.string	"arguments"
.LASF22:
	.string	"_IO_save_base"
.LASF48:
	.string	"reg_syntax_t"
.LASF33:
	.string	"_lock"
.LASF28:
	.string	"_flags2"
.LASF40:
	.string	"_mode"
.LASF78:
	.string	"fgets"
.LASF95:
	.string	"parser"
.LASF84:
	.string	"perror"
.LASF89:
	.string	"output"
.LASF79:
	.string	"regexec"
.LASF71:
	.string	"optarg"
.LASF72:
	.string	"optind"
.LASF19:
	.string	"_IO_write_end"
.LASF99:
	.string	"_IO_lock_t"
.LASF49:
	.string	"_IO_FILE"
.LASF68:
	.string	"rm_so"
.LASF80:
	.string	"fopen"
.LASF25:
	.string	"_markers"
.LASF4:
	.string	"unsigned char"
.LASF56:
	.string	"__translate"
.LASF7:
	.string	"short int"
.LASF67:
	.string	"regoff_t"
.LASF45:
	.string	"_IO_wide_data"
.LASF60:
	.string	"__fastmap_accurate"
.LASF31:
	.string	"_vtable_offset"
.LASF42:
	.string	"FILE"
.LASF82:
	.string	"exit"
.LASF69:
	.string	"rm_eo"
.LASF12:
	.string	"char"
.LASF65:
	.string	"re_dfa_t"
.LASF50:
	.string	"re_pattern_buffer"
.LASF86:
	.string	"argc"
.LASF77:
	.string	"fclose"
.LASF70:
	.string	"regmatch_t"
.LASF11:
	.string	"__off64_t"
.LASF16:
	.string	"_IO_read_base"
.LASF24:
	.string	"_IO_save_end"
.LASF63:
	.string	"__not_eol"
.LASF39:
	.string	"__pad5"
.LASF41:
	.string	"_unused2"
.LASF90:
	.string	"outline"
.LASF23:
	.string	"_IO_backup_base"
.LASF47:
	.string	"__re_long_size_t"
.LASF73:
	.string	"flags"
.LASF74:
	.string	"reg_pattern"
.LASF94:
	.string	"read"
.LASF75:
	.string	"regcomp"
.LASF81:
	.string	"getopt"
.LASF37:
	.string	"_freeres_list"
.LASF36:
	.string	"_wide_data"
.LASF96:
	.string	"args"
.LASF87:
	.string	"argv"
.LASF17:
	.string	"_IO_write_base"
.LASF88:
	.string	"result"
.LASF57:
	.string	"re_nsub"
	.section	.debug_line_str,"MS",@progbits,1
.LASF1:
	.string	"/home/mylendad/Projects/C3_SimpleBashUtils-1/src/grep"
.LASF0:
	.string	"grep.c"
	.ident	"GCC: (Ubuntu 13.2.0-23ubuntu4) 13.2.0"
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
