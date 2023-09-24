############################
#                                                                    #
#      Checking endianess with gdb                #
#                                                                    #
############################

.equ EXIT_SYSCALL_CODE, 60
.equ EXIT_CODE_OK, 0
.global _start

.section .data

mytext:
    .ascii "Hello World!\0"

.section .text

_start:


mainloop:
    movq mytext, %rax


theexit:
    movq $EXIT_CODE_OK, %rdi
    movq $EXIT_SYSCALL_CODE, %rax
    syscall
    