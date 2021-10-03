    .text
main:
    li $t0, 0
    li $t1, 3
    li $t2, 1000
loop:
    rem $t3, $t1, 3
    beq $t3, $0, add
    rem $t3, $t1, 5
    beq $t3, $0, add
    j inc
add:
    add $t0, $t0, $t1
inc:
    add $t1, $t1, 1
    blt $t1, $t2, loop

    move $a0, $t0
    li $v0, 1
    syscall
    li $a0, '\n'
    li $v0, 11
    syscall

    jr $ra
