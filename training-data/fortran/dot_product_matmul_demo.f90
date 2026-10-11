program dot_product_matmul_demo
    implicit none
    real :: a(3) = [1.0, 2.0, 3.0]
    real :: b(3) = [4.0, 5.0, 6.0]
    real :: m(2, 3), v(2)

    m = reshape([1.0, 0.0, 0.0, 1.0, 1.0, 1.0], [2, 3])
    print *, 'dot =', dot_product(a, b)
    v = matmul(m, a)
    print *, 'm*a =', v
    print *, 'norm =', sqrt(dot_product(a, a))
end program dot_product_matmul_demo
