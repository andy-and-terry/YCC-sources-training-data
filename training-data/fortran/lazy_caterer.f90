program lazy_caterer
  implicit none
  integer :: n
  do n = 0, 9
    write (*, '(I0,1X)', advance='no') (n * n + n + 2) / 2
  end do
  print *  ! 1 2 4 7 11 16 22 29 37 46
end program lazy_caterer
