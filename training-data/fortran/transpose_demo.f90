program transpose_demo
    implicit none
    integer :: a(2, 3), t(3, 2)
    integer :: i

    a = reshape([1, 2, 3, 4, 5, 6], [2, 3])
    t = transpose(a)
    do i = 1, 2
        print '(3i4)', a(i, :)
    end do
    print *
    do i = 1, 3
        print '(2i4)', t(i, :)
    end do
end program transpose_demo
