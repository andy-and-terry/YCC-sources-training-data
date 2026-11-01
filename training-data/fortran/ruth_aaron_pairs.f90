! Consecutive n, n+1 with equal sums of prime factors (with multiplicity).
program ruth_aaron_pairs
  implicit none
  integer :: n
  do n = 2, 109
    if (sopfr(n) == sopfr(n + 1)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  integer function sopfr(start)
    integer, intent(in) :: start
    integer :: m, p
    m = start
    sopfr = 0
    p = 2
    do while (p * p <= m)
      do while (mod(m, p) == 0)
        sopfr = sopfr + p
        m = m / p
      end do
      p = p + 1
    end do
    if (m > 1) sopfr = sopfr + m
  end function sopfr
end program ruth_aaron_pairs
