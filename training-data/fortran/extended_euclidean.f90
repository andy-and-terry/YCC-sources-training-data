recursive subroutine ext_gcd(a, b, g, x, y)
    integer, intent(in) :: a, b
    integer, intent(out) :: g, x, y
    integer :: x1, y1
    if (b == 0) then
        g = a
        x = 1
        y = 0
    else
        call ext_gcd(b, mod(a, b), g, x1, y1)
        x = y1
        y = x1 - (a / b) * y1
    end if
end subroutine ext_gcd

program main
    implicit none
    integer :: g, x, y

    call ext_gcd(30, 20, g, x, y)
    print *, g, x, y
    call ext_gcd(35, 15, g, x, y)
    print *, g, x, y
end program main
