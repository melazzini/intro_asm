############################
#                                                                    #
#      Count number of brown hair people      #
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

    movq 'a',%rdi

    # Set the counter of people with brown hair
    movq $0, %rdi

#### CHECK PRECONDITIONS #########

    # if there are no records finish
    cmp $0, %rcx
    jz theexit


#### MAIN LOOP  #########

mainloop:
    cmpq $BROWN_HAIR_CODE, HAIR_OFFSET(%rbx)
    jne loopcontrol
    incq %rdi

loopcontrol:
    addq $PERSON_RECORD_SIZE, %rbx
    loopq mainloop

theexit:
    movq $EXIT_SYSCALL_CODE, %rax
    syscall
    