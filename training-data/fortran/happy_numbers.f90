program happy_numbers
  implicit none
  integer :: n, count

  count = 0
  n = 1
  do while (count < 8)
     if (is_happy(n)) then
        write (*, '(I0,1X)', advance='no') n
        count = count + 1
     end if
     n = n + 1
  end do
  print *  ! 1 7 10 13 19 23 28 31

contains

  integer function digit_square_sum(x)
    integer, intent(in) :: x
    integer :: m
    m = x
    digit_square_sum = 0
    do while (m > 0)
       digit_square_sum = digit_square_sum + mod(m, 10)**2
       m = m / 10
    end do
  end function digit_square_sum

  logical function is_happy(x)
    integer, intent(in) :: x
    integer :: m, i
    m = x
    do i = 1, 20
       if (m == 1) exit
       m = digit_square_sum(m)
    end do
    is_happy = (m == 1)
  end function is_happy
end program happy_numbers
