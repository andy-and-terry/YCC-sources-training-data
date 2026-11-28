program affine_cipher
  implicit none
  character(len=6) :: msg = 'AFFINE', out
  integer :: i, x
  do i = 1, len(msg)
    x = iachar(msg(i:i)) - iachar('A')
    out(i:i) = achar(mod(5 * x + 8, 26) + iachar('A'))
  end do
  print *, out
end program affine_cipher
