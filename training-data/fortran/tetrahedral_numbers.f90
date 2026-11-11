! Tetrahedral numbers n(n+1)(n+2)/6
program TetrahedralNumbers
  implicit none
  integer :: n

  do n = 0, 9
     write (*, '(I0, 1X)', advance='no') ((n * (n + 1)) * (n + 2))/6
  end do
  print *
end program TetrahedralNumbers
