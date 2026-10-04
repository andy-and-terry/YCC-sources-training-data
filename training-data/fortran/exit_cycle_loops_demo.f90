program exit_cycle_loops_demo
    implicit none
    integer :: i, j, total

    total = 0
    do i = 1, 20
        if (mod(i, 2) == 0) cycle
        if (i > 11) exit
        total = total + i
    end do
    print *, 'sum of odd numbers up to 11:', total

    outer: do i = 1, 5
        inner: do j = 1, 5
            if (j > i) cycle outer
            if (i * j == 12) exit outer
            write (*, '(I0, A)', advance='no') i * j, ' '
        end do inner
    end do outer
    print *
    print *, 'stopped at', i, j

    i = 0
    do
        i = i + 1
        if (i**2 > 50) exit
    end do
    print *, 'first i with i^2 > 50:', i
end program exit_cycle_loops_demo
