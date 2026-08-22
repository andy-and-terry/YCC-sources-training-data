program gcd_demo
    implicit none
    print *, gcd(48, 18)
    print *, gcd(100, 75)

contains

    recursive function gcd(a, b) result(res)
        integer, intent(in) :: a, b
        integer :: res
        if (b == 0) then
            res = a
        else
            res = gcd(b, mod(a, b))
        end if
    end function gcd

end program gcd_demo
