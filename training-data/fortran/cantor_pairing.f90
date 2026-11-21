! Cantor pairing function and its inverse.
program cantor_pairing
  implicit none
  integer :: x, y
  print '(I0)', pair(3, 4)
  call unpair(32, x, y)
  print '(I0,1X,I0)', x, y
contains
  integer function pair(a, b)
    integer, intent(in) :: a, b
    pair = (a + b) * (a + b + 1) / 2 + b
  end function pair

  subroutine unpair(z, a, b)
    integer, intent(in) :: z
    integer, intent(out) :: a, b
    integer :: w
    w = (int(sqrt(real(8 * z + 1))) - 1) / 2
    b = z - w * (w + 1) / 2
    a = w - b
  end subroutine unpair
end program cantor_pairing
