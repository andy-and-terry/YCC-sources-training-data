program floor_ceiling_nint_demo
    implicit none
    real :: v(4) = [2.5, -2.5, 3.49, -0.2]
    integer :: i

    do i = 1, 4
        print '(f6.2, 4i4)', v(i), floor(v(i)), ceiling(v(i)), nint(v(i)), int(v(i))
    end do
end program floor_ceiling_nint_demo
