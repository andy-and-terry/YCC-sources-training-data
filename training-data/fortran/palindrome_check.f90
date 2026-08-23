function is_palindrome(str) result(res)
    character(len=*), intent(in) :: str
    logical :: res
    integer :: i, n

    n = len_trim(str)
    res = .true.
    do i = 1, n / 2
        if (str(i:i) /= str(n - i + 1:n - i + 1)) then
            res = .false.
            return
        end if
    end do
end function is_palindrome

program main
    implicit none
    logical :: is_palindrome
    print *, is_palindrome('racecar')
    print *, is_palindrome('hello')
end program main
