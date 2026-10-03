module rabin_karp_mod
    implicit none
    integer, parameter :: prime_mod = 101
contains
    integer function compute_hash(s, len)
        character(len=*), intent(in) :: s
        integer, intent(in) :: len
        integer :: i
        compute_hash = 0
        do i = 1, len
            compute_hash = mod(compute_hash * 256 + ichar(s(i:i)), prime_mod)
        end do
    end function compute_hash

    integer function rabin_karp_search(text, tlen, pattern, plen)
        character(len=*), intent(in) :: text, pattern
        integer, intent(in) :: tlen, plen
        integer :: phash, thash, i
        rabin_karp_search = -1
        phash = compute_hash(pattern, plen)
        do i = 1, tlen - plen + 1
            thash = compute_hash(text(i:i + plen - 1), plen)
            if (thash == phash) then
                if (text(i:i + plen - 1) == pattern) then
                    rabin_karp_search = i - 1
                    return
                end if
            end if
        end do
    end function rabin_karp_search
end module rabin_karp_mod

program main
    use rabin_karp_mod
    implicit none
    print *, rabin_karp_search("XXABXX", 6, "AB", 2)
    print *, rabin_karp_search("ABCDEF", 6, "XYZ", 3)
end program main
