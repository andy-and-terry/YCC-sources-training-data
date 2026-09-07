recursive function mod_pow(base, exp, modulus) result(res)
    integer, intent(in) :: base, exp, modulus
    integer :: res, half
    if (exp == 0) then
        res = 1
    else if (mod(exp, 2) == 0) then
        half = mod_pow(base, exp / 2, modulus)
        res = mod(half * half, modulus)
    else
        res = mod(base * mod_pow(base, exp - 1, modulus), modulus)
    end if
end function mod_pow

program main
    implicit none
    integer :: mod_pow
    print *, mod_pow(2, 10, 1000)
    print *, mod_pow(7, 128, 13)
end program main
