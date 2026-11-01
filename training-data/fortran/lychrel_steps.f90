! Reverse-and-add until a palindrome; count the steps.
program lychrel_steps
  implicit none
  integer(8) :: starts(5) = [56_8, 57_8, 59_8, 79_8, 89_8]
  integer :: i
  do i = 1, 5
    write (*, '(I0,1X)', advance='no') steps(starts(i))
  end do
  print *
contains
  integer(8) function reverse_digits(v)
    integer(8), intent(in) :: v
    integer(8) :: m
    m = v
    reverse_digits = 0
    do while (m > 0)
      reverse_digits = reverse_digits * 10 + mod(m, 10_8)
      m = m / 10
    end do
  end function reverse_digits

  integer function steps(start)
    integer(8), intent(in) :: start
    integer(8) :: m
    integer :: count
    m = start
    steps = -1
    do count = 0, 49
      if (count > 0 .and. m == reverse_digits(m)) then
        steps = count
        return
      end if
      m = m + reverse_digits(m)
    end do
  end function steps
end program lychrel_steps
