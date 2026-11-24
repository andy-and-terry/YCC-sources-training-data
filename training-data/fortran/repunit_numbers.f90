! Repunits: R_n = 11...1 (n ones), built as R_{n-1}*10 + 1.
program repunit_numbers
  implicit none
  integer(kind=8) :: r
  integer :: n
  r = 0
  do n = 1, 8
    r = r * 10 + 1
    if (mod(r, 3_8) == 0) then
      print '(I0,A)', r, '  (divisible by 3)'
    else
      print '(I0)', r
    end if
  end do
end program repunit_numbers
