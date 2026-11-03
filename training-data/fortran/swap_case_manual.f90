program swap_case_manual
  implicit none
  character(len=14) :: s = "Hello World 42"
  integer :: i, c

  do i = 1, len_trim(s)
     c = iachar(s(i:i))
     if (c >= 65 .and. c <= 90) then
        s(i:i) = achar(c + 32)
     else if (c >= 97 .and. c <= 122) then
        s(i:i) = achar(c - 32)
     end if
  end do
  print '(a)', s
end program swap_case_manual
