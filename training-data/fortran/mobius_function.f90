! Moebius function: 0 if n has a squared prime factor, else (-1)^k.
program mobius_function
  implicit none
  integer :: n
  do n = 1, 30
    write (*, '(I0,1X)', advance='no') mobius(n)
  end do
  print *
contains
  integer function mobius(n_in)
    integer, intent(in) :: n_in
    integer :: n, p, res
    n = n_in
    res = 1
    p = 2
    do while (p * p <= n)
      if (mod(n, p) == 0) then
        n = n / p
        if (mod(n, p) == 0) then
          mobius = 0
          return
        end if
        res = -res
      end if
      p = p + 1
    end do
    if (n > 1) res = -res
    mobius = res
  end function mobius
end program mobius_function
