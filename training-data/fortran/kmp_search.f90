function build_lps(pattern) result(lps)
    character(len=*), intent(in) :: pattern
    integer :: lps(len(pattern))
    integer :: m, i, len_prefix

    m = len(pattern)
    lps(1) = 0
    len_prefix = 0
    i = 2
    do while (i <= m)
        if (pattern(i:i) == pattern(len_prefix + 1:len_prefix + 1)) then
            len_prefix = len_prefix + 1
            lps(i) = len_prefix
            i = i + 1
        else if (len_prefix /= 0) then
            len_prefix = lps(len_prefix)
        else
            lps(i) = 0
            i = i + 1
        end if
    end do
end function build_lps

function kmp_search(text, pattern) result(idx)
    character(len=*), intent(in) :: text, pattern
    integer :: idx
    integer :: lps(len(pattern))
    integer :: build_lps
    integer :: n, m, i, j

    lps = build_lps(pattern)
    n = len(text)
    m = len(pattern)
    i = 1
    j = 1
    idx = -1
    do while (i <= n)
        if (text(i:i) == pattern(j:j)) then
            i = i + 1
            j = j + 1
            if (j > m) then
                idx = i - j
                return
            end if
        else if (j > 1) then
            j = lps(j - 1) + 1
        else
            i = i + 1
        end if
    end do
end function kmp_search

program main
    implicit none
    integer :: kmp_search
    print *, kmp_search('abxabcabcaby', 'abcaby')
end program main
