program array_intrinsics_whole_array
    implicit none
    integer :: a(6) = [5, 3, 8, 1, 9, 2]
    integer :: m(2, 3)
    m = reshape([1, 2, 3, 4, 5, 6], [2, 3])
    print *, sum(a), product(a), maxval(a), minval(a), maxloc(a), minloc(a)
    print *, a(2:4), a(::2), a(6:1:-1)
    print *, pack(a, a > 4), count(a > 4), any(a > 8), all(a > 0)
    print *, sum(m, dim=1), sum(m, dim=2), shape(m), size(m), transpose(m)
    print *, matmul(m, transpose(m))
    where (a > 5) a = 0
    print *, a
    print *, cshift(a, 1), eoshift(a, -1), merge(1, 0, a > 2)
    print *, dot_product([1, 2, 3], [4, 5, 6]), norm2([3.0, 4.0])
    print *, [(i * i, i = 1, 5)], sum([(real(i), i = 1, 4)]) / 4.0
end program array_intrinsics_whole_array
