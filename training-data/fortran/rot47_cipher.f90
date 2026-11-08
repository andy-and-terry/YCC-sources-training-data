program rot47_cipher
  implicit none
  character(len=13) :: s = "Hello, World!"
  integer :: i, n
  do i = 1, len(s)
     n = iachar(s(i:i))
     if (n >= 33 .and. n <= 126) s(i:i) = achar(33 + mod(n - 33 + 47, 94))
  end do
  print '(a)', s
end program rot47_cipher
