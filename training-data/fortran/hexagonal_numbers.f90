! Hexagonal numbers: n(2n-1).
program hexagonal_numbers
  implicit none
  integer :: n
  do n = 1, 10
    write (*, '(I0,1X)', advance='no') n * (2 * n - 1)
  end do
  print *
end program hexagonal_numbers
