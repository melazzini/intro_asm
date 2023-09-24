.globl _start

.section .data

arraysize:
    .quad 7

myarray:
    .quad 5,20,33,80,52,10,1

.section .text

_start:

    # Here is the counter
    movq arraysize, %rax

    # The address of the array is placed in rbx
    movq $myarray,  %rbx

    # The value of the first element of the array is placed in rdi
    # rdi will contain the greatest value in the array
    movq (%rbx), %rdi

# This is the main loop
theloop:

    # we decrement the counter and break the loop when reaching zero
    decq %rax
    jz exit

    # Increment the address of the array in rbx
    # so that rbx stores the next mem location of the array
    addq $8, %rbx

    # Compare: *rbx<r11
    cmp (%rbx), %rdi
    
    # if so go back to the mainloop
    ja theloop

    # else we set r11=rbx, and then jum to the mainloop
    movq (%rbx), %rdi
    jmp theloop

exit:
    movq $60, %rax
    syscall
