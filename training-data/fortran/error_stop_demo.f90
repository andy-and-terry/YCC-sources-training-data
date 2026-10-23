program error_stop_demo
    implicit none
    integer :: i
    integer, parameter :: vals(5) = [4, 8, 15, 16, 23]

    ! A pure function cannot STOP, but ordinary procedures can use ERROR STOP
    do i = 1, size(vals)
        call check_positive(vals(i), i)
    end do
    print *, 'all values positive'

    print *, 'safe sqrt:', safe_sqrt(16.0)
    ! error stop with a message and nonzero exit code
    print *, 'about to fail'
    print *, safe_sqrt(-1.0)
    print *, 'never printed'

contains

    subroutine check_positive(v, idx)
        integer, intent(in) :: v, idx
        if (v <= 0) error stop 'non-positive value found'
        if (idx < 0) stop 2
    end subroutine check_positive

    function safe_sqrt(x) result(r)
        real, intent(in) :: x
        real :: r
        if (x < 0.0) error stop 'sqrt of negative number'
        r = sqrt(x)
    end function safe_sqrt

end program error_stop_demo
