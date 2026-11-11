! Square pyramidal numbers n(n+1)(2n+1)/6
program SquarePyramidalNumbers
  implicit none
  integer :: n

  do n = 0, 9
     write (*, '(I0, 1X)', advance='no') ((n * (n + 1)) * ((2 * n) + 1))/6
  end do
  print *
end program SquarePyramidalNumbers
