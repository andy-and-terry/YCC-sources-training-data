! Pentagonal numbers: n(3n-1)/2.
program pentagonal_numbers
  implicit none
  integer :: n
  do n = 1, 10
    write (*, '(I0,1X)', advance='no') n * (3 * n - 1) / 2
  end do
  print *
end program pentagonal_numbers
