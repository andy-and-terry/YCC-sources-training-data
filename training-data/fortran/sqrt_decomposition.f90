program sqrt_decomposition
  implicit none
  integer, parameter :: bs = 4
  integer :: a(0:11) = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5]
  integer :: blk(0:2), i, s, l, r
  blk = 0
  do i = 0, 11
     blk(i / bs) = blk(i / bs) + a(i)
  end do
  l = 2; r = 9; s = 0; i = l
  do while (i <= r)
     if (mod(i, bs) == 0 .and. i + bs - 1 <= r) then
        s = s + blk(i / bs)
        i = i + bs
     else
        s = s + a(i)
        i = i + 1
     end if
  end do
  print *, s
end program sqrt_decomposition
