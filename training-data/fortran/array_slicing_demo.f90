program array_slicing_demo
    implicit none
    integer :: arr(10) = [(i, i = 1, 10)]
    integer :: i

    print *, arr(2:5)
    print *, arr(::2)
    print *, arr(10:1:-1)
end program array_slicing_demo
