program reshape_spread_demo
    implicit none
    integer :: m(2, 3), t(3, 2), s(2, 3), i
    integer :: v(3) = [10, 20, 30]

    m = reshape([1, 2, 3, 4, 5, 6], [2, 3])
    t = transpose(m)

    print *, 'm by rows:'
    do i = 1, 2
        print '(3I4)', m(i, :)
    end do

    print *, 't by rows:'
    do i = 1, 3
        print '(2I4)', t(i, :)
    end do

    print *, 'shape(m) =', shape(m)
    s = spread(v, dim=1, ncopies=2)
    print *, 'spread rows:'
    do i = 1, 2
        print '(3I4)', s(i, :)
    end do

    print *, 'column sums =', sum(m, dim=1)
    print *, 'row maxes   =', maxval(m, dim=2)
    print *, 'cshift      =', cshift(v, 1)
    print *, 'eoshift     =', eoshift(v, -1, boundary=0)
end program reshape_spread_demo
