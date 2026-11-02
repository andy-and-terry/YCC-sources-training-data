program dc
  implicit none
  integer :: i
  real :: a(5)
  do concurrent (i = 1:5)
    a(i) = real(i)**2
  end do
  print *, a
end program
