program equivalence_demo
    implicit none
    ! EQUIVALENCE makes two names share the same storage
    integer :: whole(4)
    integer :: a, b, c, d
    real :: r
    integer :: bits
    equivalence (whole(1), a), (whole(2), b), (whole(3), c), (whole(4), d)
    equivalence (r, bits)

    whole = [10, 20, 30, 40]
    print *, a, b, c, d

    b = 99
    print *, whole

    ! Overlay a real and an integer to inspect the bit pattern
    r = 1.0
    print '(Z8.8)', bits
end program equivalence_demo
