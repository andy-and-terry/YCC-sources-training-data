recursive function digit_sum(n) result(res)
    integer, intent(in) :: n
    integer :: res
    if (n < 10) then
        res = n
    else
        res = mod(n, 10) + digit_sum(n / 10)
    end if
end function digit_sum

program main
    implicit none
    integer :: digit_sum
    print *, digit_sum(12345)
end program main
