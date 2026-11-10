program moser_de_bruijn
  implicit none
  integer :: i
  do i = 0, 9
    write (*, '(I0,1X)', advance='no') moser(i)
  end do
  print *  ! 0 1 4 5 16 17 20 21 64 65
contains
  ! Read the binary digits of k as base-4 digits.
  integer function moser(k)
    integer, intent(in) :: k
    integer :: x, power
    x = k
    power = 1
    moser = 0
    do while (x > 0)
      if (iand(x, 1) == 1) moser = moser + power
      power = power * 4
      x = ishft(x, -1)
    end do
  end function
end program moser_de_bruijn
