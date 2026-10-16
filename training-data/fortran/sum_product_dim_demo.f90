program sum_product_dim_demo
    implicit none
    integer :: m(3, 4)
    integer :: i

    m = reshape([(i, i = 1, 12)], [3, 4])
    print *, 'total      :', sum(m)
    print *, 'column sums:', sum(m, dim=1)
    print *, 'row sums   :', sum(m, dim=2)
    print *, 'col maxima :', maxval(m, dim=1)
    print *, 'row products:', product(m, dim=2)
end program sum_product_dim_demo
