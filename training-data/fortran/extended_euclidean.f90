module extended_euclidean_mod
    implicit none
contains
    recursive subroutine extended_gcd(a, b, g, x, y)
        integer, intent(in) :: a, b
        integer, intent(out) :: g, x, y
        integer :: x1, y1
        if (b == 0) then
            g = a
            x = 1
            y = 0
            return
        end if
        call extended_gcd(b, mod(a, b), g, x1, y1)
        x = y1
        y = x1 - (a / b) * y1
    end subroutine extended_gcd
end module extended_euclidean_mod

program main
    use extended_euclidean_mod
    implicit none
    integer :: g, x, y

    call extended_gcd(35, 15, g, x, y)
    print *, g, x, y
end program main
