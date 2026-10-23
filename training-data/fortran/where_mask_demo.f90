program where_mask_demo
  implicit none
  integer :: a(6) = [3, -1, 4, -1, 5, -9]
  integer :: b(6)

  where (a < 0)
    b = 0
  elsewhere
    b = a * 2
  end where

  print *, b
  print *, count(a < 0)
end program where_mask_demo
