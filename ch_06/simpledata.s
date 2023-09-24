.globl _start

.section .data

first_value:
    .quad 4

second_value:
    .quad 18

final_result:
    .quad 0

my_numbers:
    .quad 1,2,3,4,5,6,7,8,9,10

.section .text

_start:
    
    # Load values into regs
    movq first_value, %rbx
    movq second_value, %rcx

    # Perform calculations
    addq %rbx, %rcx

    # Store results into memory
    movq %rcx, final_result


exit:
    movq $60, %rax
    movq final_result, %rdi
    syscall
