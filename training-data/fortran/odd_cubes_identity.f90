program odd_cubes_identity
    implicit none
    integer :: n
    do n = 1, 5
        print '(I0, 1X, I0, 1X, L1)', n, cube_from_odds(n), cube_from_odds(n) == n**3
    end do
contains
    integer function cube_from_odds(n)
        integer, intent(in) :: n
        integer :: i, start
        start = n * n - n + 1
        cube_from_odds = 0
        do i = 0, n - 1
            cube_from_odds = cube_from_odds + start + 2 * i
        end do
    end function cube_from_odds
end program odd_cubes_identity
