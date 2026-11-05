program array_intrinsics_sum_maxval
    implicit none
    integer :: a(5) = [4, 9, 1, 7, 3]
    print *, sum(a), maxval(a), minval(a), maxloc(a)
    print *, count(a > 3), any(a == 7), all(a > 0)
end program array_intrinsics_sum_maxval
