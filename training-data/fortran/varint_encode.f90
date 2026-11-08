program varint_encode
  implicit none
  integer :: n
  n = 300
  do while (n >= 128)
     write (*, '(z2.2,a)', advance='no') ior(mod(n, 128), 128), ' '
     n = n / 128
  end do
  write (*, '(z2.2)') n
end program varint_encode
