program ordinal_suffix
  implicit none
  integer :: nums(10) = [1, 2, 3, 4, 11, 12, 13, 21, 101, 111], i
  do i = 1, 10
    write (*, '(a,1x)', advance='no') ordinal(nums(i))
  end do
  print *
contains
  function ordinal(n) result(s)
    integer, intent(in) :: n
    character(len=12) :: s
    character(len=2) :: suffix
    integer :: r100
    r100 = mod(n, 100)
    if (r100 >= 11 .and. r100 <= 13) then
      suffix = 'th'
    else
      select case (mod(n, 10))
      case (1); suffix = 'st'
      case (2); suffix = 'nd'
      case (3); suffix = 'rd'
      case default; suffix = 'th'
      end select
    end if
    write (s, '(i0,a)') n, suffix
  end function ordinal
end program ordinal_suffix
