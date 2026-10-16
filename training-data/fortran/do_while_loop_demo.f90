program do_while_loop_demo
    implicit none
    integer :: n, steps

    n = 27
    steps = 0
    do while (n /= 1)
        if (mod(n, 2) == 0) then
            n = n / 2
        else
            n = 3 * n + 1
        end if
        steps = steps + 1
    end do
    print *, 'steps to reach 1:', steps
end program do_while_loop_demo
