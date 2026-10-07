program string_search_demo
    implicit none
    character(len=40) :: text = '  the quick brown fox jumps  '
    character(len=:), allocatable :: trimmed

    trimmed = trim(adjustl(text))
    print *, '[', trimmed, ']', len(trimmed), len_trim(text)

    print *, 'index of "quick"  :', index(trimmed, 'quick')
    print *, 'last "o"          :', index(trimmed, 'o', back=.true.)
    print *, 'scan vowels       :', scan(trimmed, 'aeiou')
    print *, 'verify letters    :', verify(trimmed, 'abcdefghijklmnopqrstuvwxyz ')
    print *, 'upper first char  :', achar(iachar(trimmed(1:1)) - 32)
    print *, 'repeat            :', repeat('ab', 3)
    print *, 'compare           :', 'apple' < 'banana', lge('b', 'a')

    if (trimmed(5:9) == 'quick') print *, 'substring match'
    print *, 'replace: ', trimmed(1:4) // 'slow' // trimmed(10:)
end program string_search_demo
