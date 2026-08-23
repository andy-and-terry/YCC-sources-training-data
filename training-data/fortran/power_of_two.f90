function is_power_of_two(n) result(res)
    integer, intent(in) :: n
    logical :: res
    res = (n > 0) .and. (iand(n, n - 1) == 0)
end function is_power_of_two

program main
    implicit none
    logical :: is_power_of_two
    print *, is_power_of_two(16)
    print *, is_power_of_two(18)
end program main
