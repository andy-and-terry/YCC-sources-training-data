program triangular_numbers
  implicit none
  integer :: n, total

  total = 0
  do n = 1, 10
     total = total + n
     write (*, '(i0, 1x)', advance='no') total
  end do
  print *
end program triangular_numbers
