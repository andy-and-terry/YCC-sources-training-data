program select_case_character_demo
    implicit none
    character(len=1) :: ch
    character(len=7) :: text = 'a1 Z?_x'
    integer :: i

    do i = 1, len(text)
        ch = text(i:i)
        select case (ch)
        case ('a':'z')
            print *, ch, ' lowercase'
        case ('A':'Z')
            print *, ch, ' uppercase'
        case ('0':'9')
            print *, ch, ' digit'
        case (' ')
            print *, '(space)'
        case default
            print *, ch, ' other'
        end select
    end do
end program select_case_character_demo
