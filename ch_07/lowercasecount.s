############################
#                                                                    #
#      Count lowercase letters in strnig           #
#                                                                    #
############################

.equ EXIT_SYSCALL_CODE, 60
.equ EXIT_CODE_OK, 0
.equ NULL_CHARACTER_CODE, 0
.equ LOWERCASE_LETTERS_BEG, 97
.equ LOWERCASE_LETTERS_END, 122
.global _start

.section .data

mymessage:
    .ascii "Hello World!\0"

.section .text

_start:
    # counter of the loop
    movq $0, %rcx

    # counter of lowercase letters
    movq $0, %rdi

    # rax points to the beg of the array
    movq $mymessage, %rax

mainloop:
 
    # look for the null character to terminate loop
    cmpb $0, (%rax)
    je theexit

    # IF letter not in [beg, end] goto loopcontrol
    cmpb $LOWERCASE_LETTERS_BEG, (%rax)
    jb loopcontrol
    cmpb $LOWERCASE_LETTERS_END, (%rax)
    ja loopcontrol

    # else increment counter of lowercase letters
    incq %rdi

loopcontrol:
    incq %rax
    jmp mainloop


theexit:
    movq $EXIT_SYSCALL_CODE, %rax
    syscall

