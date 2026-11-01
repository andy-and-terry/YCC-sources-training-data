program array_intrinsics_ex
  implicit none
  integer :: a(6) = [4, 8, 1, 9, 3, 7]
  print *, sum(a), product(a(1:3)), maxval(a), minloc(a)
  print *, pack(a, a > 4)
  print *, a(6:1:-1)
  print *, any(a > 8), all(a > 0)
  where (a < 5) a = 0
  print *, a
end program array_intrinsics_ex
