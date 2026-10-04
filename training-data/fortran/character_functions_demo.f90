program character_functions_demo
    implicit none
    character(len=20) :: text
    character(len=:), allocatable :: copy
    integer :: i

    text = '  Fortran Strings'
    print *, '[', trim(text), ']'
    print *, '[', trim(adjustl(text)), ']'
    print *, len(text), len_trim(text)
    print *, index(text, 'Str'), index(text, 'z')
    print *, scan(text, 'aeiou'), verify(text, ' ')
    print *, repeat('ab', 3)

    copy = adjustl(text)
    do i = 1, len_trim(copy)
        if (copy(i:i) >= 'a' .and. copy(i:i) <= 'z') then
            copy(i:i) = achar(iachar(copy(i:i)) - 32)
        end if
    end do
    print *, copy
    print *, lge('b', 'a'), llt('apple', 'banana')
    print *, ichar('A'), char(98)
end program character_functions_demo
