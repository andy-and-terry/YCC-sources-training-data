! Pronic numbers n(n+1)
program PronicNumbers
  implicit none
  integer :: n

  do n = 0, 9
     write (*, '(I0, 1X)', advance='no') n * (n + 1)
  end do
  print *
end program PronicNumbers
