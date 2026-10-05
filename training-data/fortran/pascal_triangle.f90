program pascal_triangle
    implicit none
    integer, parameter :: rows = 6
    integer :: tri(rows, rows)
    integer :: i, j

    tri = 0
    do i = 1, rows
        tri(i, 1) = 1
        tri(i, i) = 1
        do j = 2, i - 1
            tri(i, j) = tri(i - 1, j - 1) + tri(i - 1, j)
        end do
    end do

    do i = 1, rows
        print '(*(i4))', tri(i, 1:i)
    end do
end program pascal_triangle
