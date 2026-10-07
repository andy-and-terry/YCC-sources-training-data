program random_number_demo
    implicit none
    integer, allocatable :: seed(:)
    integer :: n, i, k
    real :: r(5), inside, x, y

    call random_seed(size=n)
    allocate(seed(n))
    seed = 12345
    call random_seed(put=seed)

    call random_number(r)
    print '(A, *(F6.3, 1X))', "uniform: ", r
    print '(A, *(I0, 1X))', "dice:    ", (1 + int(r(i) * 6), i = 1, 5)

    ! Monte Carlo estimate of pi
    k = 0
    do i = 1, 100000
        call random_number(x)
        call random_number(y)
        if (x * x + y * y <= 1.0) k = k + 1
    end do
    inside = real(k) / 100000.0
    print '(A, F6.2)', "pi estimate (approx): ", 4.0 * inside
end program random_number_demo
