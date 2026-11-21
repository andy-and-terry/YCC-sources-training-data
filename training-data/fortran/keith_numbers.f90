! Keith numbers: n appears in the Fibonacci-like sequence seeded by its digits.
program keith_numbers
  implicit none
  integer :: n
  do n = 10, 1199
    if (is_keith(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  logical function is_keith(n)
    integer, intent(in) :: n
    integer :: seq(64), k, len, m, i, tmp(10), total
    k = 0
    m = n
    do while (m > 0)
      k = k + 1
      tmp(k) = mod(m, 10)
      m = m / 10
    end do
    do i = 1, k
      seq(i) = tmp(k + 1 - i)
    end do
    len = k
    do while (seq(len) < n)
      total = sum(seq(len - k + 1:len))
      len = len + 1
      seq(len) = total
    end do
    is_keith = (seq(len) == n)
  end function is_keith
end program keith_numbers
