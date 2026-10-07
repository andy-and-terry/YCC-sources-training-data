program collatz_sequence
    implicit none
    integer :: start

    do start = 1, 10
        write (*, '(A, I0, A, I0)') "steps for ", start, ": ", collatz_steps(start)
    end do

contains

    integer function collatz_steps(n) result(steps)
        integer, intent(in) :: n
        integer(kind=8) :: x
        x = n
        steps = 0
        do while (x /= 1)
            if (mod(x, 2_8) == 0) then
                x = x / 2
            else
                x = 3 * x + 1
            end if
            steps = steps + 1
        end do
    end function collatz_steps

end program collatz_sequence
