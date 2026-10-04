program intent_inout_swap_demo
    implicit none
    integer :: a, b
    real :: data(4)

    a = 3
    b = 9
    call swap(a, b)
    print *, 'a =', a, 'b =', b

    data = [4.0, 8.0, 15.0, 16.0]
    call scale_in_place(data, 0.5)
    print *, data

    call stats(data, a, b)
    print *, 'idx of min/max:', a, b

contains

    subroutine swap(x, y)
        integer, intent(inout) :: x, y
        integer :: tmp
        tmp = x
        x = y
        y = tmp
    end subroutine swap

    subroutine scale_in_place(arr, factor)
        real, intent(inout) :: arr(:)
        real, intent(in) :: factor
        arr = arr * factor
    end subroutine scale_in_place

    subroutine stats(arr, imin, imax)
        real, intent(in) :: arr(:)
        integer, intent(out) :: imin, imax
        imin = minloc(arr, 1)
        imax = maxloc(arr, 1)
    end subroutine stats
end program intent_inout_swap_demo
