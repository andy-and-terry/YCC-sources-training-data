program character_functions_demo
    implicit none
    character(len=20) :: s
    s = "  Hello, Fortran  "

    print '(A, I0)', "len: ", len(s)
    print '(A, I0)', "len_trim: ", len_trim(s)
    print '(A, A, A)', "[", trim(adjustl(s)), "]"
    print '(A, I0)', "index of Fortran: ", index(s, "Fortran")
    print '(A, I0)', "scan for vowels: ", scan(s, "aeiou")
    print '(A, I0)', "verify (first non-blank): ", verify(s, " ")
    print '(A, I0)', "iachar('A'): ", iachar("A")
    print '(A, A)', "achar(97): ", achar(97)
    print '(A, L1)', "lexical compare: ", llt("apple", "banana")
end program character_functions_demo
