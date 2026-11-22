! Lazy caterer's sequence: max pieces from n straight cuts, n(n+1)/2 + 1.
program lazy_caterer_numbers
  implicit none
  integer :: n
  do n = 0, 9
    write (*, '(I0,1X)', advance='no') n * (n + 1) / 2 + 1
  end do
  print *
end program lazy_caterer_numbers
