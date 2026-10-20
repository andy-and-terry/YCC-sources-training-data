program allocatable_dynamic_arrays
    implicit none
    integer, allocatable :: v(:)
    real, allocatable :: grid(:, :)
    integer :: n, i
    n = 5
    allocate (v(n))
    v = [(i * 10, i = 1, n)]
    print *, v, size(v), allocated(v)
    v = [v, 99]
    print *, size(v), v(size(v))
    allocate (grid(2, 3), source=1.5)
    grid(2, 3) = 9.0
    print *, grid
    deallocate (grid)
    print *, allocated(grid)
contains
    subroutine dummy()
    end subroutine dummy
end program allocatable_dynamic_arrays
