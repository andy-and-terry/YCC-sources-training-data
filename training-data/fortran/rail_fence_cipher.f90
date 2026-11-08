program rail_fence_cipher
  implicit none
  character(len=15) :: s = "WEAREDISCOVERED"
  integer :: rail(15), i, r, d, k
  r = 0
  d = 1
  do i = 1, 15
     rail(i) = r
     if (r == 0) d = 1
     if (r == 2) d = -1
     r = r + d
  end do
  do k = 0, 2
     do i = 1, 15
        if (rail(i) == k) write (*, '(a)', advance='no') s(i:i)
     end do
  end do
  print *
end program rail_fence_cipher
