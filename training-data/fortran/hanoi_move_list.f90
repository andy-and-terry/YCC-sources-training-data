program hanoi_move_list
  implicit none
  integer :: count
  count = 0
  call hanoi(3, 'A', 'B', 'C')
  print *
  print '(i0,a)', count, ' moves'
contains
  recursive subroutine hanoi(n, a, b, c)
    integer, intent(in) :: n
    character, intent(in) :: a, b, c
    if (n == 0) return
    call hanoi(n - 1, a, c, b)
    write (*, '(3a)', advance='no') a, '->', c
    write (*, '(a)', advance='no') ' '
    count = count + 1
    call hanoi(n - 1, b, a, c)
  end subroutine hanoi
end program hanoi_move_list
