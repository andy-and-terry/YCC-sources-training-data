! Count bouncy numbers (neither increasing nor decreasing digits) below 1000.
program bouncy_numbers
  implicit none
  integer :: n, count
  count = 0
  do n = 1, 999
    if (is_bouncy(n)) count = count + 1
  end do
  print '(I0)', count
contains
  logical function is_bouncy(n)
    integer, intent(in) :: n
    integer :: m, prev, d
    logical :: inc, dec
    inc = .true.
    dec = .true.
    prev = mod(n, 10)
    m = n / 10
    do while (m > 0)
      d = mod(m, 10)
      if (d > prev) inc = .false.
      if (d < prev) dec = .false.
      prev = d
      m = m / 10
    end do
    is_bouncy = (.not. inc) .and. (.not. dec)
  end function is_bouncy
end program bouncy_numbers
