program deficient_numbers
  implicit none
  integer :: n, d, s
  do n = 1, 20
    s = 0
    do d = 1, n
      if (mod(n, d) == 0) s = s + d
    end do
    if (s < 2 * n) write (*, '(I0,1X)', advance='no') n
  end do
  print *
end program deficient_numbers
