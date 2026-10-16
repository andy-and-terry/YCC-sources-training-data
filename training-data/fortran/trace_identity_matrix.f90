program trace_identity_matrix
    implicit none
    integer, parameter :: n = 4
    real :: a(n, n), id(n, n)
    integer :: i, j

    id = 0.0
    do i = 1, n
        id(i, i) = 1.0
    end do
    forall (i = 1:n, j = 1:n) a(i, j) = real(i * j)

    print *, 'trace(a)  =', sum([(a(i, i), i = 1, n)])
    print *, 'trace(id) =', sum([(id(i, i), i = 1, n)])
    print *, 'a*id == a :', all(matmul(a, id) == a)
end program trace_identity_matrix
