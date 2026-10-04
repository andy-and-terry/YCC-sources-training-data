program random_number_demo
    implicit none
    integer, allocatable :: seed(:)
    integer :: n, i, hits
    real :: x, y, estimate

    call random_seed(size=n)
    allocate(seed(n))
    seed = 12345
    call random_seed(put=seed)

    call random_number(x)
    print *, 'in range [0,1):', x >= 0.0 .and. x < 1.0

    hits = 0
    do i = 1, 100000
        call random_number(x)
        call random_number(y)
        if (x*x + y*y <= 1.0) hits = hits + 1
    end do
    estimate = 4.0 * real(hits) / 100000.0
    print *, 'pi estimate close:', abs(estimate - 3.14159) < 0.05

    block
        real :: r(5)
        call random_number(r)
        print *, 'all in range:', all(r >= 0.0 .and. r < 1.0)
        print *, 'dice:', 1 + int(r * 6.0)
    end block
end program random_number_demo
