! Perrin sequence P(n)=P(n-2)+P(n-3)
program PerrinSequence
  implicit none
  integer :: v(0:9) = 0
  integer :: i

  v(0) = 3
  v(1) = 0
  v(2) = 2
  do i = 3, 9
     v(i) = v(i - 2) + v(i - 3)
  end do
  print '(10(I0, 1X))', v
end program PerrinSequence
