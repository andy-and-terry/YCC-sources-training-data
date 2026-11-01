! Positive n expressible as a*a + b*b with a, b >= 0.
program sum_of_two_squares
  implicit none
  integer :: n
  do n = 1, 30
    if (representable(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  logical function representable(k)
    integer, intent(in) :: k
    integer :: a, b
    representable = .false.
    do a = 0, k
      if (a * a > k) exit
      do b = a, k
        if (a * a + b * b > k) exit
        if (a * a + b * b == k) representable = .true.
      end do
    end do
  end function representable
end program sum_of_two_squares
