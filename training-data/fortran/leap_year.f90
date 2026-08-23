function is_leap_year(year) result(res)
    integer, intent(in) :: year
    logical :: res
    res = (mod(year, 4) == 0 .and. mod(year, 100) /= 0) .or. (mod(year, 400) == 0)
end function is_leap_year

program main
    implicit none
    logical :: is_leap_year
    print *, is_leap_year(2000)
    print *, is_leap_year(1900)
    print *, is_leap_year(2024)
end program main
