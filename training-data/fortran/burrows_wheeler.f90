program burrows_wheeler
  implicit none
  character(len=7) :: s = "banana$"
  character(len=7) :: rots(7), tmp
  character(len=7) :: out
  integer :: i, j, n
  n = len(s)
  do i = 1, n
     rots(i) = s(i:) // s(:i-1)
  end do
  do i = 2, n
     tmp = rots(i)
     j = i - 1
     do while (j >= 1)
        if (rots(j) <= tmp) exit
        rots(j + 1) = rots(j)
        j = j - 1
     end do
     rots(j + 1) = tmp
  end do
  do i = 1, n
     out(i:i) = rots(i)(n:n)
  end do
  print '(a)', out
end program burrows_wheeler
