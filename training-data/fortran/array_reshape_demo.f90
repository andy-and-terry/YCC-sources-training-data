program array_reshape_demo
    implicit none
    integer :: a(2, 3), b(3, 2), c(2, 2), i

    a = reshape([1, 2, 3, 4, 5, 6], [2, 3])
    b = transpose(a)
    c = matmul(a, b)

    do i = 1, 2
        print '(3I4)', a(i, :)
    end do
    print *, "shape of b:", shape(b)
    print *, "matmul:", c
    print *, "sum by column:", sum(a, dim=1)
    print *, "max by row:", maxval(a, dim=2)
    print *, "spread:", spread([1, 2], dim=1, ncopies=2)
end program array_reshape_demo
