function binary_to_decimal(str) result(res)
    character(len=*), intent(in) :: str
    integer :: res, i

    res = 0
    do i = 1, len_trim(str)
        res = res * 2 + (ichar(str(i:i)) - ichar('0'))
    end do
end function binary_to_decimal

program main
    implicit none
    integer :: binary_to_decimal
    print *, binary_to_decimal('1011')
end program main
