program gcd_of_array
  implicit none
  print *, gcd_all([12, 18, 24])
  print *, gcd_all([7, 13])
contains
  integer function gcd(a, b)
    integer, intent(in) :: a, b
    integer :: x, y, t
    x = abs(a); y = abs(b)
    do while (y /= 0)
      t = mod(x, y); x = y; y = t
    end do
    gcd = x
  end function gcd

  integer function gcd_all(v)
    integer, intent(in) :: v(:)
    integer :: i
    gcd_all = 0
    do i = 1, size(v)
      gcd_all = gcd(gcd_all, v(i))
    end do
  end function gcd_all
end program gcd_of_array
