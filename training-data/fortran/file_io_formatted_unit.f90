program file_io_formatted_unit
    implicit none
    integer :: u, ios, i, k
    real :: x
    character(len=40) :: line
    open (newunit=u, file="f90_demo.txt", status="replace", action="write")
    do i = 1, 3
        write (u, '(i3, f8.2, 2x, a)') i, i * 1.5, "row"
    end do
    close (u)
    open (newunit=u, file="f90_demo.txt", status="old", action="read")
    do
        read (u, '(a)', iostat=ios) line
        if (ios /= 0) exit
        print *, trim(line)
    end do
    rewind (u)
    read (u, *) k, x
    print *, k, x
    close (u, status="delete")
    open (newunit=u, status="scratch")
    write (u, *) 3, 4.5
    rewind (u)
    read (u, *) k, x
    print *, k + 1, x * 2
    close (u)
    print '(a, es12.4, 1x, i0, 1x, 3(f5.1, ","))', "sci ", 12345.678, 42, 1.0, 2.0, 3.0
end program file_io_formatted_unit
