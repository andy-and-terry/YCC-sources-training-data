! Wilson's theorem primality test.
program wilson_prime_check
  implicit none
  integer :: n
  do n = 2, 19
    if (wilson(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  logical function wilson(k)
    integer, intent(in) :: k
    integer(8) :: f
    integer :: i
    f = 1
    do i = 2, k - 1
      f = mod(f * i, int(k, 8))
    end do
    wilson = f == k - 1
  end function wilson
end program wilson_prime_check
