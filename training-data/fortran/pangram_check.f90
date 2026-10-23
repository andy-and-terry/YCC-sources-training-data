program pangram_check
    implicit none

    call report("The quick brown fox jumps over the lazy dog")
    call report("Pack my box with five dozen liquor jugs")
    call report("Hello, Fortran")

contains

    logical function is_pangram(text)
        character(len=*), intent(in) :: text
        logical :: seen(26)
        integer :: i, idx

        seen = .false.
        do i = 1, len_trim(text)
            idx = iachar(to_lower(text(i:i))) - iachar("a") + 1
            if (idx >= 1 .and. idx <= 26) seen(idx) = .true.
        end do
        is_pangram = all(seen)
    end function is_pangram

    character function to_lower(ch)
        character, intent(in) :: ch

        if (ch >= "A" .and. ch <= "Z") then
            to_lower = achar(iachar(ch) + 32)
        else
            to_lower = ch
        end if
    end function to_lower

    subroutine report(text)
        character(len=*), intent(in) :: text

        if (is_pangram(text)) then
            print '(A, A, A)', '"', trim(text), '" is a pangram'
        else
            print '(A, A, A)', '"', trim(text), '" is not a pangram'
        end if
    end subroutine report

end program pangram_check
