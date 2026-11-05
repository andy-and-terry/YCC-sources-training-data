program allocatable_array_resize
    implicit none
    integer, allocatable :: v(:), tmp(:)
    allocate(v(3))
    v = [1, 2, 3]
    allocate(tmp(5))
    tmp(1:3) = v
    tmp(4:5) = [4, 5]
    call move_alloc(tmp, v)
    print *, v, size(v)
end program allocatable_array_resize
