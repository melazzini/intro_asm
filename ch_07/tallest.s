############################
#                                                                    #
#       Return the age of the tallest person     #
#                                                                    #
############################

.equ EXIT_SYSCALL_CODE, 60
.equ EXIT_CODE_OK, 0
.global _start

.section .text

_start:

#### INITIALIZE REGS #########

    # pointer to first record
    leaq people, %rbx

    # record count
    movq numpeople, %rcx

    # tallest value found
    movq $0, %rdi

#### CHECK PRECONDITIONS #########

    # if there are no records finish
    cmp $0, %rcx
    jz theexit


#### MAIN LOOP  #########

mainloop:
    movq HEIGHT_OFFSET(%rbx), %rax
    cmpq  %rdi, %rax
    jbe loopcontrol
    movq %rbx, %r11
    movq %rax, %rdi

loopcontrol:
    addq $PERSON_RECORD_SIZE, %rbx
    loopq mainloop

theexit:
    movq AGE_OFFSET(%r11), %rdi
    movq $EXIT_SYSCALL_CODE, %rax
    syscall
    