program twin_primes
  implicit none
  integer, parameter :: limit = 80
  logical :: composite(limit + 2)
  integer :: i, j, p
  composite = .false.
  do i = 2, int(sqrt(real(limit)))
    if (.not. composite(i)) then
      do j = i * i, limit, i
        composite(j) = .true.
      end do
    end if
  end do
  do p = 3, limit - 2
    if (.not. composite(p) .and. .not. composite(p + 2)) write (*, '("(",I0,",",I0,") ")', advance='no') p, p + 2
  end do
  print *  ! (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
end program twin_primes
