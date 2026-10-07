program forall_masked_demo
    implicit none
    integer :: a(5, 5), i, j
    integer :: diag(5)

    a = 0
    forall (i = 1:5, j = 1:5, i == j) a(i, j) = 1
    forall (i = 1:5, j = 1:5, j > i) a(i, j) = i + j

    do i = 1, 5
        print '(5I3)', a(i, :)
    end do

    forall (i = 1:5) diag(i) = a(i, i) * i
    print *, diag
    print *, 'upper sum:', sum(a, mask=a > 1)
    print *, 'count nonzero:', count(a /= 0)
end program forall_masked_demo
