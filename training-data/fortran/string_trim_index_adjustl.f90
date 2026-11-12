program strs
  implicit none
  character(len=20) :: s = '   padded text'
  print *, trim(adjustl(s)), index(s, 'text'), len_trim(s)
  print *, repeat('ab', 3)
end program strs
