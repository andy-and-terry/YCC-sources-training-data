program fletcher16_checksum
  implicit none
  character(len=5) :: s = "abcde"
  integer :: s1 = 0, s2 = 0, i
  do i = 1, len(s)
    s1 = mod(s1 + iachar(s(i:i)), 255)
    s2 = mod(s2 + s1, 255)
  end do
  print '(Z0)', ior(ishft(s2, 8), s1)
end program fletcher16_checksum
