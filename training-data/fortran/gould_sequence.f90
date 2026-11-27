program gould_sequence
  implicit none
  integer :: n
  do n = 0, 15
    write (*, '(I4)', advance='no') ishft(1, popcnt(n))
  end do
  print *
end program gould_sequence
