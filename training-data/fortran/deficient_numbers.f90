! Deficient numbers below 100; expect 76.
program deficient_numbers
  implicit none
  integer :: c, p, n

  c = 0
  do n = 1, 99
    if (proper_sum(n) < n) c = c + 1
  end do
  print '(I0)', c
contains
  integer function proper_sum(n)
    integer, intent(in) :: n
    integer :: d
    proper_sum = 0
    do d = 1, n - 1
      if (mod(n, d) == 0) proper_sum = proper_sum + d
    end do
  end function proper_sum
end program deficient_numbers
