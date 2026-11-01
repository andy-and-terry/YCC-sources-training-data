program do_concurrent_ex
  implicit none
  integer :: i
  real :: x(8)
  do concurrent (i = 1:8)
     x(i) = real(i)**2
  end do
  print '(8f6.1)', x
end program do_concurrent_ex
