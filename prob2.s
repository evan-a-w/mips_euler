    .text
main:
    li $t0, 0
    li $t1, 0
    li $t2, 1
    li $t5, 4000000

loop:
    add $t3, $t1, $t2
    and $t4, $t3, 1
    bne $t4, $0, skip
    add $t0, $t0, $t3
skip:
    move $t1, $t2
    move $t2, $t3
    blt $t2, $t5, loop

    move $a0, $t0
    li $v0, 1
    syscall
    li $a0, '\n'
    li $v0, 11
    syscall

    jr $ra
