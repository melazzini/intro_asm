##############################
#                                                                          #
#      Count lowercase letters in string                 #
#      using ror/rol to "improve speed"                 #
#                (not measured yet)                           #
#                                                                          #
##############################

.equ EXIT_SYSCALL_CODE, 60
.equ EXIT_CODE_OK, 0
.equ NULL_CHARACTER_CODE, 0
.equ LOWERCASE_LETTERS_BEG, 97
.equ LOWERCASE_LETTERS_END, 122
.global _start

.section .data

.equ TEXT_SIZE, (endmymessage-mymessage)

mymessage:
    .ascii "Hola queridisima!!!!!!\0"
endmymessage:

.section .text

_start:

    # counter of lowercase letters
    movq $0, %rdi

    # offset of the quadword that goes into rax
    movq $0, %r11

mainloop:
    # rax points to the beg of the array
    movq mymessage(%r11), %rax
    addq $8, %r11

    # counter of the interloop
    movq $4, %rcx
interloop:

lowbyte:

    # look for the null character to terminate loop
    cmpb $0, %al
    je theexit

    # IF letter not in [beg, end] goto loopcontrol
    cmpb $LOWERCASE_LETTERS_BEG, %al
    jb highbyte
    cmpb $LOWERCASE_LETTERS_END, %al
    ja highbyte

    # else increment counter of lowercase letters
    incq %rdi

highbyte: # same as lowbyte, but we jum to the loopcontrol if not lowercase letter

    cmpb $0, %ah
    je theexit
    
    cmpb $LOWERCASE_LETTERS_BEG, %ah
    jb loopcontrol
    cmpb $LOWERCASE_LETTERS_END, %ah
    ja loopcontrol

    incq %rdi

loopcontrol:
    ror $16, %rax
    loopq interloop

    jmp mainloop


theexit:
    movq $EXIT_SYSCALL_CODE, %rax
    syscall

