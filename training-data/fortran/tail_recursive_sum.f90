recursive function sum_range(a, b) result(res)
    integer, intent(in) :: a, b
    integer :: res
    if (a > b) then
        res = 0
    else
        res = a + sum_range(a + 1, b)
    end if
end function sum_range

program main
    implicit none
    integer :: sum_range
    print *, sum_range(1, 100)
end program main
