program named_loops_demo
    implicit none
    integer :: i, j

    outer: do i = 1, 5
        inner: do j = 1, 5
            if (j > i) cycle outer
            if (i * j > 8) exit outer
            write (*, '(i3)', advance='no') i * j
        end do inner
        print *
    end do outer
    print *
    print *, 'stopped at i, j =', i, j
end program named_loops_demo
