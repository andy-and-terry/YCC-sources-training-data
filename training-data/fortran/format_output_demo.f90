program format_output_demo
    implicit none
    integer :: i
    real :: x = 3.14159

    do i = 1, 3
        write(*, '(A, I3, A, F6.2)') 'Item ', i, ': ', x * i
    end do
end program format_output_demo
