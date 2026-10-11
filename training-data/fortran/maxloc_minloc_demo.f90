program maxloc_minloc_demo
    implicit none
    integer :: a(7) = [4, 9, 2, 9, 1, 7, 3]
    integer :: grid(2, 3)

    print *, 'max at', maxloc(a, dim=1), 'value', maxval(a)
    print *, 'min at', minloc(a, dim=1), 'value', minval(a)
    print *, 'max among odd values at', maxloc(a, mask=mod(a, 2) == 1, dim=1)
    grid = reshape([5, 1, 8, 2, 3, 9], [2, 3])
    print *, maxloc(grid)
end program maxloc_minloc_demo
