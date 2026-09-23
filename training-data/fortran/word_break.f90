program word_break
    implicit none
    integer, parameter :: slen = 9
    character(len=slen) :: s = 'catsandog'
    character(len=4) :: dict(5) = [character(len=4) :: 'cats', 'dog', 'sand', 'and', 'cat']
    logical :: dp(0:slen)
    integer :: i, j

    dp = .false.
    dp(0) = .true.
    do i = 1, slen
        do j = 0, i - 1
            if (dp(j)) then
                if (matches(s(j+1:i), dict)) dp(i) = .true.
            end if
        end do
    end do

    print *, dp(slen)

contains
    logical function matches(word, dictionary)
        character(len=*), intent(in) :: word
        character(len=*), intent(in) :: dictionary(:)
        integer :: k
        matches = .false.
        do k = 1, size(dictionary)
            if (trim(dictionary(k)) == word) then
                matches = .true.
                return
            end if
        end do
    end function matches
end program word_break
