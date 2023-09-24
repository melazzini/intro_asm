.globl _start

.section .data

arraysize:
    .quad 7

myarray:
    .quad 13,21,31,80,52,10,1

.section .text

_start:
    movq $3, %rbx
    movq $2, %rcx
    movq myarray(%rcx,%rbx, 2), %rdi
    incq %rbx
    addq $8, %rbx 
    # rbx now is 12
  
    # now we move the quad at index 3 to rdi
    movq myarray(,%rbx, 2), %rdi
    
exit:
    movq $60, %rax
    syscall
