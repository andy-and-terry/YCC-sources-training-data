! Squarefree numbers up to 100; expect 61.
program squarefree_numbers
  implicit none
  integer :: c, p, n

  c = 0
  do n = 1, 100
    if (squarefree(n)) c = c + 1
  end do
  print '(I0)', c
contains
  logical function squarefree(n)
    integer, intent(in) :: n
    integer :: d
    squarefree = .true.
    d = 2
    do while (d * d <= n)
      if (mod(n, d * d) == 0) squarefree = .false.
      d = d + 1
    end do
  end function squarefree
end program squarefree_numbers
