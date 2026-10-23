program sign_abs_intrinsics_demo
    implicit none
    integer :: i

    print *, abs(-7), abs(3)
    print *, abs(-2.5)
    print *, sign(5, -1), sign(5, 1)
    print *, sign(2.5, -0.1)
    print *, max(3, 9, 4), min(3, 9, 4)
    print *, mod(-7, 3), modulo(-7, 3)

    do i = -2, 2
        print '(I3, A, I2)', i, ' -> sign ', int(sign(1.0, real(i)))
    end do
end program sign_abs_intrinsics_demo
