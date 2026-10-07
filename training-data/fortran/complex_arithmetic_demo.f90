program complex_arithmetic_demo
    implicit none
    complex :: z1, z2, w
    real, parameter :: pi = 3.14159265

    z1 = (3.0, 4.0)
    z2 = cmplx(1.0, -2.0)
    w = z1 * z2

    print *, "z1 + z2 =", z1 + z2
    print *, "z1 * z2 =", w
    print *, "|z1|    =", abs(z1)
    print *, "conj    =", conjg(z1)
    print *, "re, im  =", real(w), aimag(w)
    print *, "arg     =", atan2(aimag(z1), real(z1))
    print *, "exp(i*pi) =", exp(cmplx(0.0, pi))
    print *, "sqrt(-4)  =", sqrt(cmplx(-4.0, 0.0))
end program complex_arithmetic_demo
