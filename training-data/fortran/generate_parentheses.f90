module generate_parentheses_mod
    implicit none
contains
    recursive subroutine backtrack(current, open_count, close_count, max_n)
        character(len=*), intent(in) :: current
        integer, intent(in) :: open_count, close_count, max_n
        if (len_trim(current) == max_n * 2) then
            print *, trim(current)
            return
        end if
        if (open_count < max_n) then
            call backtrack(trim(current) // "(", open_count + 1, close_count, max_n)
        end if
        if (close_count < open_count) then
            call backtrack(trim(current) // ")", open_count, close_count + 1, max_n)
        end if
    end subroutine backtrack
end module generate_parentheses_mod

program main
    use generate_parentheses_mod
    implicit none
    call backtrack("", 0, 0, 3)
end program main
