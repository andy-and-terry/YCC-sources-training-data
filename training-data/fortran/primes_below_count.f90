program primes_below_count
  implicit none
  integer, parameter :: n = 100
  logical :: composite(n)
  integer :: i, j, count

  composite = .false.
  count = 0
  do i = 2, n - 1
     if (composite(i)) cycle
     count = count + 1
     do j = i * i, n - 1, i
        composite(j) = .true.
     end do
  end do
  print '(i0)', count
end program primes_below_count
