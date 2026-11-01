! Leyland numbers: x^y + y^x for x >= y >= 2.
program leyland_numbers
  implicit none
  integer :: x, y
  do x = 2, 4
    do y = 2, x
      write (*, '(I0,1X)', advance='no') x**y + y**x
    end do
  end do
  print *
end program leyland_numbers
