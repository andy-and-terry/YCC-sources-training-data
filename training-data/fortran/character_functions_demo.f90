program character_functions_demo
    implicit none
    character(len=20) :: s = "  Fortran Rocks"
    character(len=:), allocatable :: t

    t = trim(adjustl(s))
    print *, "[", t, "]"
    print *, "len:", len(t), " len_trim(s):", len_trim(s)
    print *, "index of 'Rocks':", index(t, "Rocks")
    print *, "scan vowels:", scan(t, "aeiou")
    print *, "verify digits:", verify(t, "0123456789")
    print *, "repeat:", repeat("ab", 3)
    print *, "iachar('A'):", iachar("A"), " achar(98):", achar(98)
    print *, "compare:", lgt("b", "a"), llt("b", "a")
    print *, t(1:7)
end program character_functions_demo
