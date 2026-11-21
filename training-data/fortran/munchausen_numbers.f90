! Munchausen numbers: sum of digit^digit equals n (0^0 counted as 0).
program munchausen_numbers
  implicit none
  integer :: n
  do n = 1, 4999
    if (is_munchausen(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  logical function is_munchausen(n)
    integer, intent(in) :: n
    integer :: m, d, total
    total = 0
    m = n
    do while (m > 0)
      d = mod(m, 10)
      if (d > 0) total = total + d**d
      m = m / 10
    end do
    is_munchausen = (total == n)
  end function is_munchausen
end program munchausen_numbers
