program automorphic_numbers
  implicit none
  integer :: n

  do n = 0, 999
     if (is_automorphic(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *  ! 0 1 5 6 25 76 376 625

contains

  logical function is_automorphic(x)
    integer, intent(in) :: x
    integer(8) :: modulus
    integer :: m
    modulus = 10
    m = x
    do while (m >= 10)
       modulus = modulus * 10
       m = m / 10
    end do
    is_automorphic = (mod(int(x, 8) * x, modulus) == x)
  end function is_automorphic
end program automorphic_numbers
