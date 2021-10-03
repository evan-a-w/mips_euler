    .text
# $a0 and $a1 make up high value bytes and low value bytes of first int
# $a2 and $t0 make up same for second
# returns int64 in $v0 and $v1
add64:
    li $v0, 0
    li $v1, 0
    addu $v0, $a0, $a2
    addu $v0
    addu $v1, $a1, $t0 # add lower u32s
    blt $v1, $a1, overflow 
    blt $v1, $t0, overflow 
    j no_overflow
overflow:
    addu $v0, $v0, 1 
no_overflow:
    jr $ra

num_facs:
    

main:
    li $t0, 0xe589eac7
    li $t1, 0x8b
