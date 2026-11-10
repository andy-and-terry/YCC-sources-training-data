program delannoy_numbers
  implicit none
  integer, parameter :: m = 5
  integer(8) :: g(0:m, 0:m)
  integer :: i, j
  g(0, :) = 1
  g(:, 0) = 1
  do i = 1, m
    do j = 1, m
      g(i, j) = g(i - 1, j) + g(i, j - 1) + g(i - 1, j - 1)
    end do
  end do
  write (*, '(*(I0,1X))') (g(i, i), i = 0, m)  ! 1 3 13 63 321 1683
end program delannoy_numbers
