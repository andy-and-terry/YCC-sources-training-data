program pure_recursive_function
  implicit none
  print *, fact(10)
  print *, sum_digits(98765)

contains

  pure recursive function fact(n) result(r)
    integer, intent(in) :: n
    integer :: r
    if (n <= 1) then
      r = 1
    else
      r = n * fact(n - 1)
    end if
  end function fact

  pure recursive function sum_digits(n) result(r)
    integer, intent(in) :: n
    integer :: r
    if (n < 10) then
      r = n
    else
      r = mod(n, 10) + sum_digits(n / 10)
    end if
  end function sum_digits

end program pure_recursive_function
