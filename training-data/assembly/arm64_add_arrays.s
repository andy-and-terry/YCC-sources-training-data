// AArch64: c[i] = a[i] + b[i]; x0=a, x1=b, x2=c, x3=n
    .global add_arrays
add_arrays:
    cbz     x3, 2f
1:  ldr     w4, [x0], #4
    ldr     w5, [x1], #4
    add     w4, w4, w5
    str     w4, [x2], #4
    subs    x3, x3, #1
    b.ne    1b
2:  ret
