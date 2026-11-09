program matrix_multiply_matmul
  implicit none
  real :: a(2,2), b(2,2), c(2,2)
  a = reshape([1., 2., 3., 4.], [2, 2])
  b = reshape([0., 1., 1., 0.], [2, 2])
  c = matmul(a, b)
  print *, c
end program matrix_multiply_matmul
