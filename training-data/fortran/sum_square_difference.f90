! Square of the sum minus sum of squares for 1..10 (expect 2640)
program SumSquareDifference
  implicit none
  integer :: i, total, squares

  total = 0
  squares = 0
  do i = 1, 10
     total = total + i
     squares = squares + i * i
  end do
  print '(I0)', total * total - squares
end program SumSquareDifference
