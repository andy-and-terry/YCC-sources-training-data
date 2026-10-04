program pascal_triangle
    implicit none
    integer, parameter :: n = 6
    integer :: row(n + 1), i

    row = 0
    row(1) = 1
    do i = 1, n
        print '(*(I4))', row(1:i)
        row(2:i + 1) = row(2:i + 1) + row(1:i)
        row(1) = 1
    end do
end program pascal_triangle
