program string_reverse
    implicit none
    character(len=11) :: s = "hello world"
    integer :: i, n

    n = len_trim(s)
    do i = 1, n / 2
        call swap_chars(s, i, n - i + 1)
    end do
    print *, s

contains

    subroutine swap_chars(str, i, j)
        character(len=*), intent(inout) :: str
        integer, intent(in) :: i, j
        character :: temp

        temp = str(i:i)
        str(i:i) = str(j:j)
        str(j:j) = temp
    end subroutine swap_chars

end program string_reverse
