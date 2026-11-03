program digit_square_sum
  implicit none
  print '(i0)', compute(123)
  print '(i0)', compute(-99)

contains

  integer function compute(n)
    integer, intent(in) :: n
    integer :: m
    m = abs(n)
    compute = 0
    do while (m > 0)
       compute = compute + mod(m, 10)**2
       m = m / 10
    end do
  end function compute

end program digit_square_sum
