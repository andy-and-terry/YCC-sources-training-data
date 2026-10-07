program allocatable_array_demo
    implicit none
    integer, allocatable :: a(:)
    integer :: i, n

    n = 5
    allocate(a(n))
    a = [(i * i, i = 1, n)]
    print '(A, *(I0, 1X))', "squares:", a
    print '(A, L1)', "allocated: ", allocated(a)

    call move_alloc_demo()
    deallocate(a)
    print '(A, L1)', "allocated after deallocate: ", allocated(a)

contains

    subroutine move_alloc_demo()
        integer, allocatable :: old(:), new(:)
        allocate(old(3))
        old = [10, 20, 30]
        allocate(new(5))
        new = 0
        new(1:3) = old
        call move_alloc(new, old)
        print '(A, *(I0, 1X))', "grown:", old
        print '(A, L1)', "source still allocated: ", allocated(new)
    end subroutine move_alloc_demo

end program allocatable_array_demo
