.equ EXIT_SYSCALL, 60
.equ EXIT_OK, 0

.section .data

value:
    .quad 5


.globl _start
.section .text

_start:
    # Push in the sentinel value
    pushq $0

    # Grab the value
    movq value, %rax

    # Push all the values from 1 to the current value to the stack
pushvalues:
    pushq %rax
    decq %rax
    jnz pushvalues

    # Prepare for multiplying
    movq $1, %rax

multiply:
    # Get the next value from the stack
    popq %rcx

    # If it's the sentinel, we are done
    cmpq $0, %rcx
    je theexit

    # Multiply by what we have accumulated so far
    mulq %rcx

    # Do it again
    jmp multiply

theexit:
    movq %rax, %rdi
    movq $EXIT_SYSCALL, %rax
    syscall
