! Centered square numbers 2n(n+1)+1
program CenteredSquareNumbers
  implicit none
  integer :: n

  do n = 0, 9
     write (*, '(I0, 1X)', advance='no') ((2 * n) * (n + 1)) + 1
  end do
  print *
end program CenteredSquareNumbers
