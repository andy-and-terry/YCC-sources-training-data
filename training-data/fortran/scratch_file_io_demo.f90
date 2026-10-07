program scratch_file_io_demo
    implicit none
    integer :: unit_id, i, value, ios
    integer :: total

    open(newunit=unit_id, status="scratch", action="readwrite")
    do i = 1, 5
        write (unit_id, '(I0)') i * 10
    end do
    rewind(unit_id)

    total = 0
    do
        read (unit_id, *, iostat=ios) value
        if (ios /= 0) exit
        total = total + value
    end do
    close(unit_id)

    print '(A, I0)', "sum read back: ", total
end program scratch_file_io_demo
