program reshape_demo
    implicit none
    integer :: m(2, 3), i

    m = reshape([1, 2, 3, 4, 5, 6], [2, 3])

    do i = 1, 2
        print '(*(I3))', m(i, :)
    end do
    print '(A, *(I0, 1X))', "col sums: ", sum(m, dim=1)
    print '(A, *(I0, 1X))', "row sums: ", sum(m, dim=2)
    print '(A, *(I0, 1X))', "shape:    ", shape(m)
    print '(A, *(I0, 1X))', "flatten:  ", reshape(m, [6])
    print '(A, *(I0, 1X))', "first row:  ", m(1, :)
end program reshape_demo
