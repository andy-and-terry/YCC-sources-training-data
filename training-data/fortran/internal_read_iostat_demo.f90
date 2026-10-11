program internal_read_iostat_demo
    implicit none
    character(len=8) :: texts(3) = [character(len=8) :: '42', 'abc', '3.5']
    integer :: i, n, ios

    do i = 1, 3
        read (texts(i), *, iostat=ios) n
        if (ios == 0) then
            print *, trim(texts(i)), ' -> integer ', n
        else
            print *, trim(texts(i)), ' -> not an integer, iostat =', ios /= 0
        end if
    end do
end program internal_read_iostat_demo
