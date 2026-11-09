program recursive_factorial
  implicit none
  print *, fact(10)
contains
  recursive function fact(n) result(r)
    integer, intent(in) :: n
    integer :: r
    if (n <= 1) then
       r = 1
    else
       r = n * fact(n - 1)
    end if
  end function fact
end program recursive_factorial
