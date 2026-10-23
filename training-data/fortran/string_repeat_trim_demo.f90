program string_repeat_trim_demo
    implicit none
    character(len=10) :: word
    character(len=20) :: line

    word = 'abc'
    print '(A)', repeat('=', 12)
    print '(A, I0)', 'len = ', len(word)
    print '(A, I0)', 'len_trim = ', len_trim(word)
    print '(3A)', '[', trim(word), ']'
    print '(3A)', '[', word, ']'

    line = repeat('ab', 3)
    print '(A)', trim(line)
    print '(A)', trim(adjustl('   padded'))
end program string_repeat_trim_demo
