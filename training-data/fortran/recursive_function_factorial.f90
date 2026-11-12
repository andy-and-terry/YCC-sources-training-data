program fact
  implicit none
  print *, f(10)
contains
  recursive function f(n) result(r)
    integer, intent(in) :: n
    integer :: r
    if (n <= 1) then
       r = 1
    else
       r = n * f(n - 1)
    end if
  end function f
end program fact
