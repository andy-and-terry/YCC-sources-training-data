program save_attribute_counter
    implicit none
    integer :: i

    do i = 1, 4
        call tick()
    end do

contains

    subroutine tick()
        integer, save :: calls = 0
        calls = calls + 1
        print *, 'tick called', calls, 'time(s)'
    end subroutine tick

end program save_attribute_counter
