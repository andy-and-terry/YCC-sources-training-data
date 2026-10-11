program character_array_demo
    implicit none
    character(len=6) :: days(7)
    integer :: i

    days = [character(len=6) :: 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']
    do i = 1, 7
        if (days(i)(1:1) == 'T' .or. days(i)(1:1) == 'S') then
            print *, trim(days(i)), ' starts with T or S'
        end if
    end do
    print *, 'longest trimmed:', maxval(len_trim(days))
end program character_array_demo
