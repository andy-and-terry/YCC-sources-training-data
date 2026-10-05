program flood_fill
    implicit none
    integer :: img(3, 3)
    integer :: r

    img = transpose(reshape([1, 1, 0, &
                             1, 0, 0, &
                             1, 1, 1], [3, 3]))
    call fill(img, 1, 1, 7)

    do r = 1, 3
        print '(3i3)', img(r, :)
    end do

contains

    recursive subroutine fill(grid, r, c, color)
        integer, intent(inout) :: grid(:, :)
        integer, intent(in) :: r, c, color
        integer :: original

        if (r < 1 .or. r > size(grid, 1)) return
        if (c < 1 .or. c > size(grid, 2)) return
        original = grid(r, c)
        if (original == color .or. original /= 1) return

        grid(r, c) = color
        call fill(grid, r + 1, c, color)
        call fill(grid, r - 1, c, color)
        call fill(grid, r, c + 1, color)
        call fill(grid, r, c - 1, color)
    end subroutine fill

end program flood_fill
