# RISC-V: sum of array. a0=ptr, a1=count -> a0
    .globl sum
sum:
    li      t0, 0
1:  beqz    a1, 2f
    lw      t1, 0(a0)
    add     t0, t0, t1
    addi    a0, a0, 4
    addi    a1, a1, -1
    j       1b
2:  mv      a0, t0
    ret
