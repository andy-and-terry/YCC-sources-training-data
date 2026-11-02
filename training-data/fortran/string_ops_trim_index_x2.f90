program strs
  implicit none
  character(len=20) :: s = "  fortran  "
  print *, "[", trim(adjustl(s)), "]"
  print *, index("hello world", "wor"), len_trim(s)
end program
