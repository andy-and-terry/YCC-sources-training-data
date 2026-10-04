program complex_numbers_demo
    implicit none
    complex :: z1, z2, z3
    real, parameter :: pi = 3.14159265

    z1 = (3.0, 4.0)
    z2 = cmplx(1.0, -2.0)
    z3 = z1 * z2

    print *, 'sum:', z1 + z2
    print *, 'product:', z3
    print *, 'quotient:', z1 / z2
    print *, 'abs(z1):', abs(z1)
    print *, 'conjg(z1):', conjg(z1)
    print *, 'real, imag:', real(z3), aimag(z3)
    print *, 'arg(z1) in degrees:', atan2(aimag(z1), real(z1)) * 180.0 / pi
    print *, 'sqrt(-1):', sqrt(cmplx(-1.0, 0.0))
    print *, 'exp(i*pi):', exp(cmplx(0.0, pi))
end program complex_numbers_demo
