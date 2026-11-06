! Repunits: numbers made only of the digit 1.
program repunit_numbers
  implicit none
  integer(8) :: r
  integer :: i
  r = 0
  do i = 1, 5
    r = r * 10 + 1
    write (*, '(I0,1X)', advance='no') r
  end do
  print *
end program repunit_numbers
