subroutine to_roman(n)
    integer, intent(in) :: n
    integer :: values(13) = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    character(len=2) :: symbols(13) = [ &
        'M ', 'CM', 'D ', 'CD', 'C ', 'XC', 'L ', 'XL', 'X ', 'IX', 'V ', 'IV', 'I ']
    integer :: remaining, i
    character(len=20) :: result

    remaining = n
    result = ''
    do i = 1, 13
        do while (remaining >= values(i))
            result = trim(result) // trim(symbols(i))
            remaining = remaining - values(i)
        end do
    end do
    print *, trim(result)
end subroutine to_roman

program main
    implicit none
    call to_roman(1994)
end program main
