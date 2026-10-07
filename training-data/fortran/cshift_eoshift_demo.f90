program cshift_eoshift_demo
    implicit none
    integer :: v(6) = [1, 2, 3, 4, 5, 6]
    integer :: m(3, 3), shifted(3, 3), mt(3, 3), i

    print *, 'cshift +2:', cshift(v, 2)
    print *, 'cshift -1:', cshift(v, -1)
    print *, 'eoshift +2:', eoshift(v, 2)
    print *, 'eoshift -2 (fill 9):', eoshift(v, -2, boundary=9)

    m = reshape([(i, i = 1, 9)], [3, 3])
    shifted = cshift(m, 1, dim=1)
    print *, 'matrix rows rotated:'
    do i = 1, 3
        print '(3I3)', shifted(i, :)
    end do
    print *, 'reversed:', v(size(v):1:-1)
    mt = transpose(m)
    print *, 'transposed first row:', mt(1, :)
end program cshift_eoshift_demo
