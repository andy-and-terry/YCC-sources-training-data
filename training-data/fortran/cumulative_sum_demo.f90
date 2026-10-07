module scan_utils
    implicit none
contains
    pure function cumsum(x) result(c)
        integer, intent(in) :: x(:)
        integer :: c(size(x)), i

        c(1) = x(1)
        do i = 2, size(x)
            c(i) = c(i - 1) + x(i)
        end do
    end function cumsum
end module scan_utils

program cumulative_sum_demo
    use scan_utils
    implicit none
    integer :: data(6) = [3, 1, 4, 1, 5, 9]
    integer :: k

    print *, "data:      ", data
    print *, "cumsum:    ", cumsum(data)
    print *, "diff:      ", data(2:) - data(:5)
    print *, "running max:", [(maxval(data(:k)), k = 1, 6)]
end program cumulative_sum_demo
