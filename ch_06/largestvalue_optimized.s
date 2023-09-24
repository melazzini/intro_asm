.globl _start

.section .data

arraysize:
    .quad 7
myarray:
    .quad 13,21,31,80,52,81,1

counter:
    .quad 0

.section .text

_start:
    # start the counter
    movq arraysize, %rcx

    # clear rdi
    movq $0, %rdi

mainloop:
    leaq myarray-8(,%rcx, 8), %rax
    cmp (%rax), %rdi
    ja couning_part 
    movq (%rax), %rdi

couning_part:
    loopq mainloop
    
exit:
    movq $60, %rax
    syscall
