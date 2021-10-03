    .text

# arr in $a0, n in $a1
bcd_print:
    move $t0, $a0
    move $t1, $a1
    add $t2, $t0, $t1
    sub $t2, $t2, 1
bcd_print_loop:
    lb $a0, 0($t2)
    li $v0, 1 
    syscall
    sub $t2, $t2, 1
    bge $t2, $t0, bcd_print_loop

    jr $ra

# $a0: x, $a1: xn, $a2: y, $a3: yn, $t2: i, $t3: carry, $t4: curr
bcd_add:
    add $t0, $a0, $a1
    add $t1, $a2, $a3

    li $t2, 0
    li $t3, 0

iltxn:
    lb $t4, 0($a0)
    add $t4, $t4, $t2
    bge $a2, $t1, noy
    lb $t9, 0($a2)
    add $t4, $t4, $t9
noy:
    ble $t4, 9, set
    li, $t3, 1
    sub $t4, $t4, 10
set:
    # res->bcd[i] = curr
    

main:
    la $a0, arr
    li $a1, 3
    jal bcd_print 
    li $a0, '\n'
    li $v0, 11
    syscall

    li $a0, 0
    li $v0, 17
    syscall

    .data
arr: .byte 1, 2, 3
arr2: .byte 4, 5, 6
bigarr: .space 30
bn: .byte 0
