! Moser-de Bruijn sequence: binary digits of n read in base 4.
program moser_de_bruijn
  implicit none
  integer :: n
  do n = 0, 11
    write (*, '(I0,1X)', advance='no') moser(n)
  end do
  print *
contains
  integer function moser(n_in)
    integer, intent(in) :: n_in
    integer :: n, place
    n = n_in
    place = 1
    moser = 0
    do while (n > 0)
      if (iand(n, 1) == 1) moser = moser + place
      n = ishft(n, -1)
      place = place * 4
    end do
  end function moser
end program moser_de_bruijn
