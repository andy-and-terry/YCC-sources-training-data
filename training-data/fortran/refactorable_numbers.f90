program refactorable_numbers
  implicit none
  integer :: n
  do n = 1, 59
    if (mod(n, tau(n)) == 0) write (*, '(I0,1X)', advance='no') n
  end do
  print *  ! 1 2 8 9 12 18 24 36 40 56
contains
  integer function tau(k)
    integer, intent(in) :: k
    integer :: d
    tau = 0
    do d = 1, k
      if (mod(k, d) == 0) tau = tau + 1
    end do
  end function
end program refactorable_numbers
