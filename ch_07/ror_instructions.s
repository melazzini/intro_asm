#############################
#                                                                       #
#      Practicing with ror/rol instruction  (gdb)   #
#                                                                       #
#############################

.equ EXIT_SYSCALL_CODE, 60
.equ EXIT_CODE_OK, 0
.global _start

.section .data

mytext:
    .ascii "Hello World!\0"

.section .text

_start:

    movq mytext, %rax
    ror $8, %rax
    ror $8, %rax
    ror $16, %rax
    rol $8, %rax
    rol $8, %rax
    rol $16, %rax


theexit:
    movq $EXIT_CODE_OK, %rdi
    movq $EXIT_SYSCALL_CODE, %rax
    syscall
    