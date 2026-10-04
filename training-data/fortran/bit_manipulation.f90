program bit_manipulation
    implicit none
    integer :: x

    x = int(b'10110100')
    print '(A, B8.8)', "x        = ", x
    print *, "popcnt   =", popcnt(x)
    print *, "leadz    =", leadz(x), " trailz =", trailz(x)
    print '(A, B8.8)', "and 0F   = ", iand(x, 15)
    print '(A, B8.8)', "or 01    = ", ior(x, 1)
    print '(A, B8.8)', "xor FF   = ", ieor(x, 255)
    print '(A, B8.8)', "shift l1 = ", ishft(x, 1)
    print '(A, B8.8)', "shift r2 = ", ishft(x, -2)
    print *, "bit 2 set?", btest(x, 2), " bit 4 set?", btest(x, 4)
    print '(A, B8.8)', "set 0    = ", ibset(x, 0)
    print '(A, B8.8)', "clear 7  = ", ibclr(x, 7)
end program bit_manipulation
