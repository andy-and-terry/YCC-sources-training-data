program rolling_hash
  implicit none
  character(len=6) :: s = "abcabc"
  integer, parameter :: k = 3, b = 31, m = 1000003
  integer :: i, pw, h
  pw = 1
  do i = 2, k
     pw = mod(pw * b, m)
  end do
  h = 0
  do i = 1, k
     h = mod(h * b + iachar(s(i:i)), m)
  end do
  print *, 0, h
  do i = 2, len(s) - k + 1
     h = mod(h - mod(iachar(s(i-1:i-1)) * pw, m) + m, m)
     h = mod(h * b + iachar(s(i+k-1:i+k-1)), m)
     print *, i - 1, h
  end do
end program rolling_hash
