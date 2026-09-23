program command_line_args
    implicit none
    integer :: nargs, i, length, status
    character(len=100) :: arg

    nargs = command_argument_count()
    print *, 'argument count:', nargs

    do i = 1, nargs
        call get_command_argument(i, arg, length, status)
        if (status == 0) then
            print *, i, trim(arg)
        end if
    end do
end program command_line_args
