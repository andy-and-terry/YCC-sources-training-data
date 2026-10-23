program internal_file_conversion
  implicit none
  character(len=16) :: buf
  integer :: n
  real :: x

  buf = '42'
  read (buf, *) n
  print *, n + 1

  write (buf, '(F6.2)') 3.14159
  print *, trim(adjustl(buf))

  buf = '2.5'
  read (buf, *) x
  print *, x * 2.0
end program internal_file_conversion
