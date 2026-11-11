! Population count (number of set bits) for 0..15
program PopcountTable
  implicit none
  integer :: n

  do n = 0, 15
     write (*, '(I0, 1X)', advance='no') popcnt(n)
  end do
  print *
end program PopcountTable
