! Unsigned Lah numbers L(n, k) = C(n-1, k-1) * n! / k!  (row n = 5).
program lah_numbers
  implicit none
  integer, parameter :: n = 5
  integer :: k
  do k = 1, n
    write (*, '(I0,1X)', advance='no') comb(n - 1, k - 1) * fact(n) / fact(k)
  end do
  print *
contains
  integer(8) function fact(m)
    integer, intent(in) :: m
    integer :: i
    fact = 1
    do i = 2, m
      fact = fact * i
    end do
  end function fact

  integer(8) function comb(m, j)
    integer, intent(in) :: m, j
    comb = fact(m) / (fact(j) * fact(m - j))
  end function comb
end program lah_numbers
