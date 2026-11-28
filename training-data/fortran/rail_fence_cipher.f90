program rail_fence_cipher
  implicit none
  character(len=15) :: text = 'WEAREDISCOVERED', out
  integer, parameter :: k = 3, cycle = 4
  integer :: r, i, p, rail
  p = 1
  do r = 0, k - 1
    do i = 0, len(text) - 1
      rail = mod(i, cycle)
      if (rail >= k) rail = cycle - rail
      if (rail == r) then
        out(p:p) = text(i+1:i+1)
        p = p + 1
      end if
    end do
  end do
  print *, out
end program rail_fence_cipher
