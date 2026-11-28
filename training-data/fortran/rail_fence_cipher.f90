program rail_fence_cipher
  implicit none
  character(len=15) :: text = "WEAREDISCOVERED", out
  integer, parameter :: rails = 3
  integer :: row, i, r, step, k
  k = 1
  do row = 0, rails - 1
    r = 0
    step = 1
    do i = 1, len(text)
      if (r == row) then
        out(k:k) = text(i:i)
        k = k + 1
      end if
      if (r == 0) step = 1
      if (r == rails - 1) step = -1
      r = r + step
    end do
  end do
  print '(A)', out
end program rail_fence_cipher
