.globl _start

.section .data

arraysize:
    .quad 7
myarray:
    .quad 13,21,31,80,52,90,1

counter:
    .quad 0

.section .text

_start:
    # start the counter
    movq arraysize, %rcx

    movq $0, %rbx

    # clear rdi
    movq $0, %rdi

mainloop:
    cmp myarray(,%rbx, 8), %rdi
    ja couning_part 
    movq myarray(,%rbx, 8), %rdi

couning_part:
    incq %rbx
    loopq mainloop
    
exit:
    movq $60, %rax
    syscall
