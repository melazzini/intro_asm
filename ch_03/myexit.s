# My first program. This is a comment.

.globl _start
.section .text

_start:
    movq $60,%rax
    movq $1,%rdi
    ; syscall
