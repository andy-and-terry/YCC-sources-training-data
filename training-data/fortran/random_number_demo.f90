program random_number_demo
    implicit none
    integer :: seed_size, i
    integer, allocatable :: seed(:)
    real :: r(3), x
    integer :: dice(5)

    call random_seed(size=seed_size)
    allocate (seed(seed_size))
    seed = [(42 + i, i = 1, seed_size)]
    call random_seed(put=seed)

    call random_number(x)
    print *, 'in [0,1):', x >= 0.0 .and. x < 1.0

    call random_number(r)
    print *, 'all in range:', all(r >= 0.0 .and. r < 1.0)

    do i = 1, 5
        call random_number(x)
        dice(i) = 1 + int(x * 6.0)
    end do
    print *, 'dice valid:', all(dice >= 1 .and. dice <= 6)
end program random_number_demo
