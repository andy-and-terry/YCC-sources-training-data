program twin_primes
  implicit none
  integer, parameter :: n = 50
  logical :: composite(n) = .false.
  integer :: i, j, p
  do i = 2, int(sqrt(real(n)))
    if (.not. composite(i)) then
      do j = i * i, n, i
        composite(j) = .true.
      end do
    end if
  end do
  do p = 3, n - 2
    if (.not. composite(p) .and. .not. composite(p + 2)) print '(A,I0,A,I0,A)', '(', p, ', ', p + 2, ')'
  end do
end program twin_primes
