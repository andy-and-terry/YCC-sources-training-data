program select_case_demo
    implicit none
    integer :: day
    character(len=9) :: name

    do day = 1, 7
        select case (day)
        case (1)
            name = "Monday"
        case (2)
            name = "Tuesday"
        case (3)
            name = "Wednesday"
        case (4)
            name = "Thursday"
        case (5)
            name = "Friday"
        case (6, 7)
            name = "Weekend"
        case default
            name = "Unknown"
        end select
        print *, day, trim(name)
    end do
end program select_case_demo
