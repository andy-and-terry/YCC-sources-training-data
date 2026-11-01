program string_ops_ex
  implicit none
  character(len=20) :: s
  s = 'Fortran'
  print *, trim(s)//' rocks', len_trim(s)
  print *, index(s, 'tra'), s(1:3)
  print '(a,i0,a,f6.2)', 'n=', 42, ' x=', 3.14159
end program string_ops_ex
