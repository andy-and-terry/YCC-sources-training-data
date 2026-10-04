program bit_intrinsics_demo
    implicit none
    integer :: n = 180   ! 10110100
    integer :: i

    print *, 'popcnt  :', popcnt(n)
    print *, 'leadz   :', leadz(n)
    print *, 'trailz  :', trailz(n)
    print *, 'btest 2 :', btest(n, 2)
    print *, 'ibset 0 :', ibset(n, 0)
    print *, 'ibclr 2 :', ibclr(n, 2)
    print *, 'and/or/xor:', iand(n, 15), ior(n, 3), ieor(n, 255)
    print *, 'shifts  :', shiftl(n, 2), shiftr(n, 2)
    print *, 'not     :', not(n)

    write (*, '(A)', advance='no') 'bits: '
    do i = bit_size(n) - 24 - 1, 0, -1
        write (*, '(I1)', advance='no') merge(1, 0, btest(n, i))
    end do
    print *

    print *, 'ishftc  :', ishftc(1, 3, 8)
    print *, 'ibits   :', ibits(n, 4, 4)
end program bit_intrinsics_demo
