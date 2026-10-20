program numeric_kinds_precision_intrinsics
    use, intrinsic :: iso_fortran_env, only: int32, int64, real32, real64
    implicit none
    integer(int32) :: a = huge(1_int32)
    integer(int64) :: b
    real(real32) :: s = 1.0_real32 / 3.0_real32
    real(real64) :: d = 1.0_real64 / 3.0_real64
    b = int(a, int64) + 1
    print *, a, b, huge(b)
    print *, s, d
    print *, epsilon(s), epsilon(d), tiny(d), digits(d), precision(d), range(d)
    print *, floor(-2.5), ceiling(-2.5), nint(2.5), nint(-2.5), int(-2.7), aint(2.7)
    print *, mod(-7, 3), modulo(-7, 3), 7 / 2, -7 / 2, 7.0 / 2.0, 2**10, 2.0**0.5
    print *, abs(-3.5), sign(3.0, -1.0), max(1, 5, 3), min(2.5, 1.5), sqrt(2.0_real64)
    print *, sin(0.0), cos(0.0), atan2(1.0, 1.0) * 4, exp(1.0), log(10.0), log10(1000.0)
    print *, iand(12, 10), ior(12, 10), ieor(12, 10), ishft(1, 4), popcnt(255), btest(5, 2)
    print *, cmplx(1.0, 2.0) * cmplx(3.0, -1.0), abs(cmplx(3.0, 4.0)), conjg((1.0, 2.0))
    print *, d == 0.3333333333333333_real64, abs(d - 1.0_real64 / 3.0_real64) < epsilon(d)
end program numeric_kinds_precision_intrinsics
