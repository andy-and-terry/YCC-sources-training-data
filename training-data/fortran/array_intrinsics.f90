program array_intrinsics
  implicit none
  integer :: a(5) = [4, 1, 7, 3, 9]
  print *, sum(a), maxval(a), minloc(a), count(a > 3)
  print *, pack(a, a > 3)
end program array_intrinsics
