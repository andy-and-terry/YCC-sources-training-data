module word_break_mod
    implicit none
contains
    logical function can_segment(s, dictionary, dict_size)
        character(len=*), intent(in) :: s
        integer, intent(in) :: dict_size
        character(len=*), intent(in) :: dictionary(dict_size)
        logical :: dp(0:len(s))
        integer :: i, j, k
        dp = .false.
        dp(0) = .true.
        do i = 1, len(s)
            do j = 0, i - 1
                if (dp(j)) then
                    do k = 1, dict_size
                        if (trim(dictionary(k)) == s(j + 1:i)) then
                            dp(i) = .true.
                        end if
                    end do
                end if
            end do
        end do
        can_segment = dp(len(s))
    end function can_segment
end module word_break_mod

program main
    use word_break_mod
    implicit none
    character(len=4) :: dict(2) = ["leet", "code"]

    print *, can_segment("leetcode", dict, 2)
    print *, can_segment("leetcodex", dict, 2)
end program main
