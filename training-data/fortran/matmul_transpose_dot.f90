program mat_demo
  implicit none
  real :: a(2,2) = reshape([1., 2., 3., 4.], [2, 2])
  real :: b(2,2)
  b = matmul(a, transpose(a))
  print *, b
  print *, dot_product(a(:,1), a(:,2))
end program mat_demo
