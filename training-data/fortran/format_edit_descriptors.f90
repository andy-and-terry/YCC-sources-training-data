program fmt
  implicit none
  print '(i5, f10.3, es12.4)', 42, 3.14159, 12345.678
  print '(a, 1x, l1)', 'flag', .true.
  write (*, '(3(i3))') 1, 2, 3
end program fmt
