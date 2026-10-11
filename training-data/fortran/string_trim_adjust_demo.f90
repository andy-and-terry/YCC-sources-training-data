program string_trim_adjust_demo
    implicit none
    character(len=20) :: s

    s = '   padded text'
    print *, '[', s, ']'
    print *, '[', adjustl(s), ']'
    print *, '[', trim(adjustl(s)), ']'
    print *, '[', adjustr(trim(s)), ']'
    print *, len(s), len_trim(s), len_trim(adjustl(s))
end program string_trim_adjust_demo
