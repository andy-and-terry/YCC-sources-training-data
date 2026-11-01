program allocatable_matrix_ex
  implicit none
  real, allocatable :: m(:,:)
  integer :: i
  allocate(m(3,3))
  m = 0.0
  do i = 1, 3
     m(i,i) = 1.0
  end do
  print '(3f5.1)', transpose(m * 2.0)
  print *, shape(m), size(m)
  deallocate(m)
end program allocatable_matrix_ex
