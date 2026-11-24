! Fibbinary numbers: no two adjacent 1 bits.
program fibbinary_numbers
  implicit none
  integer :: n
  do n = 0, 49
    if (iand(n, ishft(n, -1)) == 0) write (*, '(I0,1X)', advance='no') n
  end do
  print *
end program fibbinary_numbers
