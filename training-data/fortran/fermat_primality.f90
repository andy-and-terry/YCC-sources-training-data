! Fermat primality test; Carmichael number 561 fools it.
program fermat_primality
  implicit none
  integer(8), parameter :: tests(3) = [97_8, 91_8, 561_8]
  integer :: i
  do i = 1, 3
    print '(I0,1X,L1)', tests(i), probably_prime(tests(i))
  end do
contains
  integer(8) function powmod(b0, e0, m)
    integer(8), intent(in) :: b0, e0, m
    integer(8) :: b, e
    b = mod(b0, m)
    e = e0
    powmod = 1
    do while (e > 0)
      if (mod(e, 2_8) == 1) powmod = mod(powmod * b, m)
      b = mod(b * b, m)
      e = e / 2
    end do
  end function powmod

  logical function probably_prime(n)
    integer(8), intent(in) :: n
    probably_prime = n > 2 .and. powmod(2_8, n - 1, n) == 1
  end function probably_prime
end program fermat_primality
