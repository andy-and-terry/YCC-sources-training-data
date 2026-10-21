! Tribonacci: T0=0, T1=0, T2=1, T(n) = T(n-1) + T(n-2) + T(n-3)
program tribonacci_numbers
    implicit none
    integer(8) :: t(0:14)
    integer :: i

    t(0) = 0
    t(1) = 0
    t(2) = 1
    do i = 3, 14
        t(i) = t(i-1) + t(i-2) + t(i-3)
    end do

    print '(a, 15(i0, 1x))', 'Tribonacci: ', t
end program tribonacci_numbers
