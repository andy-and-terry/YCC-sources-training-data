program character_functions_demo
    implicit none
    character(len=20) :: s
    character(len=:), allocatable :: t

    s = '  Fortran strings'
    print '(3a)', '[', s, ']'
    print '(3a)', '[', trim(s), ']'
    print '(3a)', '[', trim(adjustl(s)), ']'
    print *, 'len / len_trim: ', len(s), len_trim(s)
    print *, 'index of "str": ', index(s, 'str')
    print *, 'scan vowels: ', scan(s, 'aeiou')
    print *, 'verify letters: ', verify(trim(adjustl(s)), 'abcdefghijklmnopqrstuvwxyzFS ')

    t = 'abc' // 'def'
    print *, t, len(t)
    print *, t(2:4)
    print *, repeat('=-', 5)
    print *, iachar('A'), achar(98)
    print *, lge('apple', 'banana'), llt('apple', 'banana')
end program character_functions_demo
