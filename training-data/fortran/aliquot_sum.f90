! Aliquot sum classification.
program aliquot_sum
  implicit none
  integer :: vals(4) = [6, 12, 15, 28], i, d, a
  do i = 1, 4
    a = 0
    do d = 1, vals(i) - 1
      if (mod(vals(i), d) == 0) a = a + d
    end do
    if (a == vals(i)) then
      print '(I0,1X,I0," perfect")', vals(i), a
    else if (a > vals(i)) then
      print '(I0,1X,I0," abundant")', vals(i), a
    else
      print '(I0,1X,I0," deficient")', vals(i), a
    end if
  end do
end program aliquot_sum
