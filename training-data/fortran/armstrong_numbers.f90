program armstrong_numbers
  implicit none
  integer :: n

  do n = 1, 999
     if (is_armstrong(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *  ! 1..9 153 370 371 407

contains

  logical function is_armstrong(x)
    integer, intent(in) :: x
    integer :: m, len, total
    len = 0
    m = x
    do while (m > 0)
       len = len + 1
       m = m / 10
    end do
    total = 0
    m = x
    do while (m > 0)
       total = total + mod(m, 10)**len
       m = m / 10
    end do
    is_armstrong = (total == x)
  end function is_armstrong
end program armstrong_numbers
