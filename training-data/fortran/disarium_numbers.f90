! Disarium numbers: digits raised to their 1-based positions sum to n.
program disarium_numbers
  implicit none
  integer :: n
  do n = 1, 999
    if (is_disarium(n)) write (*, '(I0,1X)', advance='no') n
  end do
  print *
contains
  logical function is_disarium(n)
    integer, intent(in) :: n
    character(len=12) :: s
    integer :: i, total
    write (s, '(I0)') n
    total = 0
    do i = 1, len_trim(s)
      total = total + (iachar(s(i:i)) - iachar('0'))**i
    end do
    is_disarium = (total == n)
  end function is_disarium
end program disarium_numbers
