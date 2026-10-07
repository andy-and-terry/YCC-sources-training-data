program reshape_matmul_demo
    implicit none
    integer :: a(2, 3), b(3, 2), c(2, 2)
    integer :: i

    a = reshape([1, 2, 3, 4, 5, 6], [2, 3])
    b = transpose(a)
    c = matmul(a, b)

    print *, 'a:'
    do i = 1, 2
        print '(3i4)', a(i, :)
    end do
    print *, 'a * a^T:'
    do i = 1, 2
        print '(2i4)', c(i, :)
    end do

    print *, 'sum by column:', sum(a, dim=1)
    print *, 'sum by row:   ', sum(a, dim=2)
    print *, 'maxloc:', maxloc(a)
    print *, 'dot product:', dot_product([1, 2, 3], [4, 5, 6])
    print *, 'spread:', spread([1, 2, 3], dim=1, ncopies=2)
end program reshape_matmul_demo
