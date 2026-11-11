! Narayana's cows N(n)=N(n-1)+N(n-3)
program NarayanaCows
  implicit none
  integer :: v(0:9) = 0
  integer :: i

  v(0) = 1
  v(1) = 1
  v(2) = 1
  do i = 3, 9
     v(i) = v(i - 1) + v(i - 3)
  end do
  print '(10(I0, 1X))', v
end program NarayanaCows
