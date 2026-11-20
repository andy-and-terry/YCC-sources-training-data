! Remove consecutive duplicate characters.
program dedupe_adjacent
  implicit none
  character(len=*), parameter :: s = 'aabbbcdd'
  character(len=len(s)) :: out
  integer :: i, k
  k = 0
  do i = 1, len(s)
    if (i == 1) then
      k = 1; out(1:1) = s(1:1)
    else if (s(i:i) /= s(i - 1:i - 1)) then
      k = k + 1; out(k:k) = s(i:i)
    end if
  end do
  print '(A)', out(1:k)
end program dedupe_adjacent
