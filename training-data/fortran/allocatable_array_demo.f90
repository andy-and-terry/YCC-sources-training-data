program allocatable_array_demo
    implicit none
    integer, allocatable :: values(:)
    integer :: n, i

    n = 5
    allocate(values(n))
    values = [(i * i, i = 1, n)]
    print *, 'allocated:', allocated(values), 'size:', size(values)
    print *, values

    call move_alloc_demo(values)
    print *, 'after move_alloc, original allocated:', allocated(values)

    deallocate(values, stat=i)
    print *, 'dealloc stat when unallocated is nonzero:', i /= 0

contains

    subroutine move_alloc_demo(src)
        integer, allocatable, intent(inout) :: src(:)
        integer, allocatable :: dest(:)
        call move_alloc(src, dest)
        print *, 'moved:', dest
    end subroutine move_alloc_demo
end program allocatable_array_demo
