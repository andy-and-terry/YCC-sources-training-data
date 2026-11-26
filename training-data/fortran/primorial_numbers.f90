! Primorials up to 1e6, including 1; expect 8.
program primorial_numbers
  implicit none
  integer :: c, p
  integer(8) :: acc

  acc = 1
  c = 1
  p = 2
  do
    if (is_prime(p)) then
      acc = acc * p
      if (acc > 1000000_8) exit
      c = c + 1
      print '(I0)', acc
    end if
    p = p + 1
  end do
  print '(A,I0)', 'count: ', c
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
end program primorial_numbers
