program random_number_demo
    implicit none
    integer, allocatable :: seed(:)
    integer :: n, i, inside
    real :: u(5), x, y

    call random_seed(size=n)
    allocate (seed(n))
    seed = 12345
    call random_seed(put=seed)

    call random_number(u)
    print *, 'all in [0,1):', all(u >= 0.0 .and. u < 1.0)

    print *, 'dice rolls:'
    do i = 1, 5
        call random_number(x)
        write (*, '(I2)', advance='no') 1 + int(x * 6)
    end do
    print *

    ! Monte Carlo estimate of pi
    inside = 0
    do i = 1, 100000
        call random_number(x)
        call random_number(y)
        if (x * x + y * y <= 1.0) inside = inside + 1
    end do
    print '(A, F5.2)', 'pi is about ', 4.0 * real(inside) / 100000.0
end program random_number_demo
