program allocatable_arrays_demo
    implicit none
    integer, allocatable :: a(:), b(:, :), moved(:)
    integer :: i, n

    n = 5
    allocate (a(n))
    a = [(i * i, i = 1, n)]
    print *, 'a =', a

    allocate (b(2, 3))
    b = reshape([1, 2, 3, 4, 5, 6], [2, 3])
    print *, 'shape(b) =', shape(b)
    print *, 'allocated(a):', allocated(a)

    a = [a, 100]
    print *, 'grown a =', a

    call move_alloc(a, moved)
    print *, 'allocated(a) after move:', allocated(a), size(moved)

    deallocate (b)
    print *, 'allocated(b):', allocated(b)

end program allocatable_arrays_demo
