program bit_intrinsics_demo
    implicit none
    integer :: x

    x = 44
    print '(A, B8.8)', "x       = ", x
    print '(A, I0)', "popcnt  = ", popcnt(x)
    print '(A, I0)', "leadz   = ", leadz(x)
    print '(A, I0)', "trailz  = ", trailz(x)
    print '(A, I0)', "shift l = ", ishft(x, 2)
    print '(A, I0)', "shift r = ", ishft(x, -2)
    print '(A, I0)', "and     = ", iand(x, 15)
    print '(A, I0)', "or      = ", ior(x, 1)
    print '(A, I0)', "xor     = ", ieor(x, 255)
    print '(A, L1)', "btest 2 = ", btest(x, 2)
    print '(A, I0)', "ibset 0 = ", ibset(x, 0)
    print '(A, I0)', "ibclr 2 = ", ibclr(x, 2)
end program bit_intrinsics_demo
