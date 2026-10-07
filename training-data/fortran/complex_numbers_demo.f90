program complex_numbers_demo
    implicit none
    complex :: a, b, c

    a = (3.0, 4.0)
    b = cmplx(1.0, -2.0)
    c = a * b

    print '(A, F6.2, F6.2)', "a*b      =", c
    print '(A, F6.2)', "abs(a)   =", abs(a)
    print '(A, F6.2, F6.2)', "conjg(a) =", conjg(a)
    print '(A, F6.2)', "real(c)  =", real(c)
    print '(A, F6.2)', "imag(c)  =", aimag(c)
    print '(A, F6.2)', "arg(a)   =", atan2(aimag(a), real(a))
    print '(A, F6.2, F6.2)', "sqrt(-4) =", sqrt(cmplx(-4.0, 0.0))
end program complex_numbers_demo
