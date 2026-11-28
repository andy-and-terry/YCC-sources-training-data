program stern_diatomic
  implicit none
  integer :: seq(0:14), i

  seq(0) = 0
  seq(1) = 1
  do i = 2, 14
     if (mod(i, 2) == 0) then
        seq(i) = seq(i / 2)
     else
        seq(i) = seq(i / 2) + seq(i / 2 + 1)
     end if
  end do
  print '(15(I0,1X))', seq  ! 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
end program stern_diatomic
