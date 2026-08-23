module n_queens_mod
    implicit none
contains
    recursive function count_solutions(queens, placed, n) result(count)
        integer, intent(in) :: queens(:), placed, n
        integer :: count, col, i
        logical :: safe

        if (placed == n) then
            count = 1
            return
        end if

        count = 0
        do col = 0, n - 1
            safe = .true.
            do i = 1, placed
                if (queens(i) == col .or. abs(queens(i) - col) == placed - i + 1) then
                    safe = .false.
                    exit
                end if
            end do
            if (safe) then
                block
                    integer :: new_queens(n)
                    new_queens(1:placed) = queens(1:placed)
                    new_queens(placed + 1) = col
                    count = count + count_solutions(new_queens, placed + 1, n)
                end block
            end if
        end do
    end function count_solutions
end module n_queens_mod

program main
    use n_queens_mod
    implicit none
    integer :: queens(6)
    print *, count_solutions(queens, 0, 6)
end program main
