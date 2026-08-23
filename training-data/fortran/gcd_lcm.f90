recursive function gcd(a, b) result(res)
    integer, intent(in) :: a, b
    integer :: res
    if (b == 0) then
        res = abs(a)
    else
        res = gcd(b, mod(a, b))
    end if
end function gcd

function lcm(a, b) result(res)
    integer, intent(in) :: a, b
    integer :: res, gcd
    res = abs(a * b) / gcd(a, b)
end function lcm

program main
    implicit none
    integer :: gcd, lcm
    print *, gcd(48, 18)
    print *, lcm(4, 6)
end program main
