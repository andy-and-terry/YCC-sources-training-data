function is_valid(str) result(valid)
    character(len=*), intent(in) :: str
    logical :: valid
    character :: stack(100)
    integer :: top, i
    character :: c

    top = 0
    valid = .true.
    do i = 1, len(str)
        c = str(i:i)
        select case (c)
        case ('(', '[', '{')
            top = top + 1
            stack(top) = c
        case (')')
            if (top == 0) then
                valid = .false.
                return
            end if
            if (stack(top) /= '(') then
                valid = .false.
                return
            end if
            top = top - 1
        case (']')
            if (top == 0) then
                valid = .false.
                return
            end if
            if (stack(top) /= '[') then
                valid = .false.
                return
            end if
            top = top - 1
        case ('}')
            if (top == 0) then
                valid = .false.
                return
            end if
            if (stack(top) /= '{') then
                valid = .false.
                return
            end if
            top = top - 1
        end select
    end do
    if (top /= 0) valid = .false.
end function is_valid

program main
    implicit none
    logical :: is_valid
    print *, is_valid('{[()]}')
    print *, is_valid('{[(])}')
end program main
