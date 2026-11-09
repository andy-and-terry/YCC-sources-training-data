program string_ops_trim
  implicit none
  character(len=20) :: s = "  fortran  "
  print *, "[" // trim(adjustl(s)) // "]"
  print *, len_trim(s), index(s, "tran")
end program string_ops_trim
