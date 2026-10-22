program hamming_numbers
  implicit none
  ! Hamming numbers (5-smooth): only prime factors 2, 3 and 5
  integer :: found(20), count, n

  count = 0
  n = 1
  do while (count < 20)
     if (is_hamming(n)) then
        count = count + 1
        found(count) = n
     end if
     n = n + 1
  end do
  print '(20(I0,1X))', found

contains

  logical function is_hamming(start)
    integer, intent(in) :: start
    integer :: m, k, primes(3)
    primes = [2, 3, 5]
    m = start
    do k = 1, 3
       do while (mod(m, primes(k)) == 0)
          m = m / primes(k)
       end do
    end do
    is_hamming = (m == 1)
  end function is_hamming

end program hamming_numbers
