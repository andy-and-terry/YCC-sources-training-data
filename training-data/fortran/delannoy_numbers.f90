program delannoy_numbers
  implicit none
  integer, parameter :: n = 7
  integer :: d(0:n, 0:n), i, j
  d(0, :) = 1
  d(:, 0) = 1
  do i = 1, n
    do j = 1, n
      d(i, j) = d(i - 1, j) + d(i, j - 1) + d(i - 1, j - 1)
    end do
  end do
  print '(8I7)', (d(i, i), i = 0, n)
end program delannoy_numbers
