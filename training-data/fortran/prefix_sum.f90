program prefix_sum
    implicit none
    integer, parameter :: n = 8
    integer :: a(n), p(0:n), i, l, r

    a = [3, 1, 4, 1, 5, 9, 2, 6]
    p(0) = 0
    do i = 1, n
        p(i) = p(i - 1) + a(i)
    end do

    print '(A, *(I0, 1X))', "prefix:", p
    l = 3
    r = 6
    print '(A, I0, A, I0, A, I0)', "sum a(", l, "..", r, ") = ", p(r) - p(l - 1)
end program prefix_sum
