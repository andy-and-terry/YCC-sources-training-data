! Euler zigzag numbers via the Seidel-Entringer boustrophedon.
program euler_zigzag_numbers
  implicit none
  integer(8) :: row(0:15), next(0:15)
  integer :: i, j, len
  row = 0
  row(0) = 1
  len = 1
  write (*, '(I0,1X)', advance='no') 1_8
  do i = 1, 9
    next(0) = 0
    do j = 1, len
      next(j) = next(j - 1) + row(len - j)
    end do
    len = len + 1
    row = next
    write (*, '(I0,1X)', advance='no') row(len - 1)
  end do
  print *
end program euler_zigzag_numbers
