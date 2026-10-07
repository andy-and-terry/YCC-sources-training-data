program cycle_exit_demo
    implicit none
    integer :: i, j, found_i, found_j

    ! Skip multiples of 3 and stop above 14
    do i = 1, 100
        if (mod(i, 3) == 0) cycle
        if (i > 14) exit
        write (*, '(I3)', advance='no') i
    end do
    print *

    ! Named loops: find first pair with product 42 where j > i
    found_i = 0
    found_j = 0
    outer: do i = 1, 10
        inner: do j = i + 1, 10
            if (i * j == 42) then
                found_i = i
                found_j = j
                exit outer
            end if
            if (j > 8) cycle outer
        end do inner
    end do outer
    print *, 'pair:', found_i, found_j

    ! do while
    i = 1
    do while (i < 200)
        i = i * 3
    end do
    print *, 'first power of 3 >= 200:', i
end program cycle_exit_demo
