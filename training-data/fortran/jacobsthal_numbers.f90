! Jacobsthal numbers: J0=0, J1=1, Jn = J(n-1) + 2*J(n-2)
program jacobsthal_numbers
  implicit none
  integer :: i, a, b, t

  a = 0
  b = 1
  do i = 0, 14
     write (*, '(I0,1X)', advance='no') a
     t = b + 2 * a
     a = b
     b = t
  end do
  print *
end program jacobsthal_numbers
