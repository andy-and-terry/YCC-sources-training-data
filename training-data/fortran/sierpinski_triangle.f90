program sierpinski_triangle
  implicit none
  integer, parameter :: n = 8
  integer :: r, c
  do r = 0, n - 1
     write (*, '(a)', advance='no') repeat(' ', n - r - 1)
     do c = 0, r
        if (iand(r, c) == c) then
           write (*, '(a)', advance='no') '* '
        else
           write (*, '(a)', advance='no') '  '
        end if
     end do
     write (*, *)
  end do
end program sierpinski_triangle
