program move_alloc_demo
    implicit none
    integer, allocatable :: old(:), new(:)

    allocate (old(3))
    old = [1, 2, 3]

    allocate (new(5))
    new(1:3) = old
    new(4:5) = 0
    call move_alloc(new, old)

    print *, 'old now', old
    print *, 'new allocated?', allocated(new)
end program move_alloc_demo
