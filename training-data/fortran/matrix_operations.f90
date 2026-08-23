program matrix_operations
    implicit none
    integer :: a(2, 2) = reshape([1, 3, 2, 4], [2, 2])
    integer :: b(2, 2) = reshape([5, 7, 6, 8], [2, 2])
    integer :: c(2, 2)

    c = matmul(a, b)
    print *, c(1, :)
    print *, c(2, :)
    print *, transpose(a)
end program matrix_operations
