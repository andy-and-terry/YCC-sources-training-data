program game_of_life
    implicit none
    integer, parameter :: n = 6
    logical :: grid(n, n)
    integer :: gen

    grid = .false.
    grid(1, 2) = .true.
    grid(2, 3) = .true.
    grid(3, 1) = .true.
    grid(3, 2) = .true.
    grid(3, 3) = .true.

    do gen = 0, 3
        write (*, '(A, I0, A)') "Generation ", gen, ":"
        call show(grid)
        grid = next_generation(grid)
    end do

contains

    integer function live_neighbors(g, r, c) result(count)
        logical, intent(in) :: g(:, :)
        integer, intent(in) :: r, c
        integer :: dr, dc, rr, cc

        count = 0
        do dr = -1, 1
            do dc = -1, 1
                if (dr == 0 .and. dc == 0) cycle
                rr = modulo(r - 1 + dr, size(g, 1)) + 1
                cc = modulo(c - 1 + dc, size(g, 2)) + 1
                if (g(rr, cc)) count = count + 1
            end do
        end do
    end function live_neighbors

    function next_generation(g) result(h)
        logical, intent(in) :: g(:, :)
        logical :: h(size(g, 1), size(g, 2))
        integer :: r, c, k

        do r = 1, size(g, 1)
            do c = 1, size(g, 2)
                k = live_neighbors(g, r, c)
                h(r, c) = merge(k == 2 .or. k == 3, k == 3, g(r, c))
            end do
        end do
    end function next_generation

    subroutine show(g)
        logical, intent(in) :: g(:, :)
        integer :: r, c

        do r = 1, size(g, 1)
            write (*, '(*(A))') (merge("#", ".", g(r, c)), c = 1, size(g, 2))
        end do
    end subroutine show

end program game_of_life
