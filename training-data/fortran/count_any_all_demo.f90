program count_any_all_demo
    implicit none
    integer :: a(8) = [3, -1, 4, -1, 5, -9, 2, 6]

    print *, 'negatives:', count(a < 0)
    print *, 'any > 5:', any(a > 5)
    print *, 'all > -10:', all(a > -10)
    print *, 'all positive:', all(a > 0)
    print *, 'sum of positives:', sum(a, mask=a > 0)
    print *, 'product of abs:', product(abs(a))
end program count_any_all_demo
