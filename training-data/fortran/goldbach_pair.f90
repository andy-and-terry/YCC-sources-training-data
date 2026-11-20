! Goldbach pair.
program goldbach_pair
  implicit none
  integer :: n = 28, p
  do p = 2, n / 2
    if (is_prime(p) .and. is_prime(n - p)) then
      print '(I0," + ",I0)', p, n - p
      exit
    end if
  end do
contains
  logical function is_prime(k)
    integer, intent(in) :: k
    integer :: d
    is_prime = k > 1
    do d = 2, int(sqrt(real(k)))
      if (mod(k, d) == 0) then
        is_prime = .false.
        return
      end if
    end do
  end function is_prime
end program goldbach_pair
