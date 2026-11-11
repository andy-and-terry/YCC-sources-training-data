! Lazy caterer sequence: max pieces from n cuts
program LazyCaterer
  implicit none
  integer :: n

  do n = 0, 9
     write (*, '(I0, 1X)', advance='no') ((n * (n + 1))/2) + 1
  end do
  print *
end program LazyCaterer
