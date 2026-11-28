program palindromic_primes
  implicit none
  integer :: n

  do n = 2, 199
     if (is_palindrome(n) .and. is_prime(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *  ! 2 3 5 7 11 101 131 151 181 191

contains

  logical function is_prime(x)
    integer, intent(in) :: x
    integer :: i
    is_prime = x >= 2
    i = 2
    do while (is_prime .and. i * i <= x)
       if (mod(x, i) == 0) is_prime = .false.
       i = i + 1
    end do
  end function is_prime

  logical function is_palindrome(x)
    integer, intent(in) :: x
    integer :: m, r
    m = x
    r = 0
    do while (m > 0)
       r = r * 10 + mod(m, 10)
       m = m / 10
    end do
    is_palindrome = (r == x)
  end function is_palindrome
end program palindromic_primes
