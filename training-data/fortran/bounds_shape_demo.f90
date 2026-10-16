program bounds_shape_demo
    implicit none
    real :: a(0:4, -2:2)
    integer :: s(2)

    print *, 'lbound', lbound(a)
    print *, 'ubound', ubound(a)
    s = shape(a)
    print *, 'shape ', s
    print *, 'size  ', size(a), size(a, 1), size(a, 2)
    print *, 'rank  ', rank(a)
end program bounds_shape_demo
