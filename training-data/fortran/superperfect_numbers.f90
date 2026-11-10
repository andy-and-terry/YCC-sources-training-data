program superperfect_numbers
  implicit none
  integer :: n
  do n = 1, 99
    if (sigma(sigma(n)) == 2 * n) write (*, '(I0,1X)', advance='no') n
  end do
  print *  ! 2 4 16 64
contains
  integer function sigma(k)
    integer, intent(in) :: k
    integer :: d
    sigma = 0
    do d = 1, k
      if (mod(k, d) == 0) sigma = sigma + d
    end do
  end function
end program superperfect_numbers
