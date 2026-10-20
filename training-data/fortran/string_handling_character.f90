program string_handling_character
    implicit none
    character(len=20) :: s
    character(len=:), allocatable :: t
    s = "Hello, World"
    print *, len(s), len_trim(s), trim(s) // "!", index(s, "World"), s(1:5), s(8:)
    t = adjustl("   padded") // "|"
    print *, t, len(t)
    print *, scan("hello", "aeiou"), verify("12a3", "0123456789"), repeat("ab", 3)
    print *, iachar("A"), achar(98), ichar("a"), lge("b", "a"), llt("a", "b")
    print '(a, i0, a, f0.2, a, l1)', "n=", 42, " x=", 3.14159, " ok=", .true.
    write (s, '(i5.5, a, f6.2)') 42, "/", 2.5
    print *, trim(s)
    print *, to_upper("shout")
contains
    function to_upper(str) result(r)
        character(len=*), intent(in) :: str
        character(len=len(str)) :: r
        integer :: i
        do i = 1, len(str)
            if (str(i:i) >= "a" .and. str(i:i) <= "z") then
                r(i:i) = achar(iachar(str(i:i)) - 32)
            else
                r(i:i) = str(i:i)
            end if
        end do
    end function to_upper
end program string_handling_character
