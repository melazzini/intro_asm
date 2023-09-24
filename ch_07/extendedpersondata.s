.section .data
.global people, numpeople, PERSON_RECORD_SIZE

numpeople:
    .quad (endpeople-people)/PERSON_RECORD_SIZE

people:
     # array of people
     .quad 200,10, BROWN_HAIR_CODE, 74, 20
     .quad 280,12, BROWN_HAIR_CODE, 72, 44
     .quad 150,8, 1, 78, 30
     .quad 250,14, 3, 75, 24
     .quad 250,10, BROWN_HAIR_CODE, 70, 11
     .quad 180,11, 5, 69, 65
endpeople:# marks the end of people

# We put this here just to demonstrate that we can put the definitions of constants
# basically anywhere, as long as we make them global
.global  EXIT_SYSCALL_CODE, EXIT_CODE_OK, WEIGHT_OFFSET, SHOESIZE_OFFSET, HAIR_OFFSET, HEIGHT_OFFSET, AGE_OFFSET, PERSON_RECORD_SIZE, BROWN_HAIR_CODE
.equ PERSON_RECORD_SIZE, 40
.equ WEIGHT_OFFSET, 0
.equ SHOESIZE_OFFSET, WEIGHT_OFFSET + 8
.equ HAIR_OFFSET, SHOESIZE_OFFSET + 8
.equ HEIGHT_OFFSET, HAIR_OFFSET + 8
.equ AGE_OFFSET, HEIGHT_OFFSET + 8
.equ BROWN_HAIR_CODE, 2
# The assembler can handle simple assembly-time calculations: add, subtract, mul and div
