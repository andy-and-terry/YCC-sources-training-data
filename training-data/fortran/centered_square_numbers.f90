! Centered square numbers: n^2 + (n+1)^2.
program centered_square_numbers
  implicit none
  integer :: n
  do n = 0, 9
    write (*, '(I0,1X)', advance='no') n * n + (n + 1) * (n + 1)
  end do
  print *
end program centered_square_numbers
