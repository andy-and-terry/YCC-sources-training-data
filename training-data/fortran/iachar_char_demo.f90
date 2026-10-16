program iachar_char_demo
    implicit none
    character(len=1) :: c
    integer :: i

    print *, iachar('A'), iachar('a'), iachar('0')
    print *, achar(72), achar(105)
    do i = 0, 4
        c = achar(iachar('a') + i)
        write (*, '(a)', advance='no') c
    end do
    print *
    print *, char(ichar('z') - 25)
    print *, lge('b', 'a'), llt('a', 'B')
end program iachar_char_demo
