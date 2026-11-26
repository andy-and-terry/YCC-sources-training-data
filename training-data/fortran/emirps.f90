! Emirps below 200; expect 15.
program emirps
  implicit none
  integer :: c, p, n

  c = 0
  do n = 2, 199
    if (rev(n) /= n .and. is_prime(n) .and. is_prime(rev(n))) c = c + 1
  end do
  print '(I0)', c
contains
  logical function is_prime(n)
    integer, intent(in) :: n
    integer :: d
    is_prime = .false.
    if (n < 2) return
    is_prime = .true.
    d = 2
    do while (d * d <= n)
      if (mod(n, d) == 0) then
        is_prime = .false.
        return
      end if
      d = d + 1
    end do
  end function is_prime

  integer function rev(n)
    integer, intent(in) :: n
    integer :: m
    rev = 0
    m = n
    do while (m > 0)
      rev = rev * 10 + mod(m, 10)
      m = m / 10
    end do
  end function rev
end program emirps
