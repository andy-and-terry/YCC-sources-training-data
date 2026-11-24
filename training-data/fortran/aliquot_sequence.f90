! Aliquot sequence: replace n by the sum of its proper divisors.
program aliquot_sequence
  implicit none
  integer :: n, count
  n = 12
  count = 0
  write (*, '(I0)', advance='no') n
  do while (n > 1 .and. count < 19)
    n = aliquot_sum(n)
    write (*, '(1X,I0)', advance='no') n
    count = count + 1
  end do
  print *
contains
  integer function aliquot_sum(m)
    integer, intent(in) :: m
    integer :: d
    aliquot_sum = 0
    do d = 1, m / 2
      if (mod(m, d) == 0) aliquot_sum = aliquot_sum + d
    end do
  end function aliquot_sum
end program aliquot_sequence
