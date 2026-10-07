program kind_precision_demo
    use, intrinsic :: iso_fortran_env, only: int32, int64, real32, real64
    implicit none
    real(real32) :: single
    real(real64) :: double
    integer(int32) :: small
    integer(int64) :: big

    single = 1.0_real32 / 3.0_real32
    double = 1.0_real64 / 3.0_real64
    small = huge(small)
    big = huge(big)

    print '(A, F20.15)', "single: ", single
    print '(A, F20.15)', "double: ", double
    print '(A, I0)', "int32 max: ", small
    print '(A, I0)', "int64 max: ", big
    print '(A, I0, A, I0)', "digits: ", precision(single), " vs ", precision(double)
    print '(A, ES10.3)', "epsilon(double): ", epsilon(double)
end program kind_precision_demo
