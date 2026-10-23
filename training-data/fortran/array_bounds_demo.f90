program array_bounds_demo
    implicit none
    integer :: a(-2:2)
    integer :: m(0:1, 3:5)
    integer :: i

    do i = lbound(a, 1), ubound(a, 1)
        a(i) = i * i
    end do

    print *, a
    print *, lbound(a), ubound(a), size(a)
    print *, lbound(m, 1), ubound(m, 1)
    print *, lbound(m, 2), ubound(m, 2)
    print *, shape(m)
    print *, a(-2:0)
end program array_bounds_demo
