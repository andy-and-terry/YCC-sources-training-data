elemental function square(x) result(res)
    integer, intent(in) :: x
    integer :: res
    res = x * x
end function square

program main
    implicit none
    integer :: square
    integer :: arr(5) = [1, 2, 3, 4, 5]
    print *, square(arr)
end program main
