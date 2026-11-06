! Integer (1..3999) to Roman numeral using a greedy table.
program int_to_roman
  implicit none
  print '(A,1X,A)', trim(to_roman(1994)), trim(to_roman(58))
contains
  function to_roman(number) result(out)
    integer, intent(in) :: number
    character(len=32) :: out
    integer, parameter :: values(13) = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1]
    character(len=2), parameter :: symbols(13) = [character(len=2) :: 'M', 'CM', 'D', 'CD', 'C', 'XC', &
         'L', 'XL', 'X', 'IX', 'V', 'IV', 'I']
    integer :: n, i
    n = number
    out = ''
    do i = 1, 13
      do while (n >= values(i))
        out = trim(out) // trim(symbols(i))
        n = n - values(i)
      end do
    end do
  end function to_roman
end program int_to_roman
