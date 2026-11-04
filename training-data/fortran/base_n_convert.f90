program base_n_convert
  implicit none
  integer :: bases(4) = [2, 8, 16, 36], i
  do i = 1, 4
    print '(a,i0,a,a)', '255 in base ', bases(i), ' = ', to_base(255, bases(i))
  end do
contains
  function to_base(n, base) result(s)
    integer, intent(in) :: n, base
    character(len=32) :: s
    character(len=36), parameter :: digits = '0123456789abcdefghijklmnopqrstuvwxyz'
    integer :: m, d
    s = ''
    m = n
    if (m == 0) then
      s = '0'; return
    end if
    do while (m > 0)
      d = mod(m, base)
      s = digits(d+1:d+1) // trim(s)
      m = m / base
    end do
  end function to_base
end program base_n_convert
