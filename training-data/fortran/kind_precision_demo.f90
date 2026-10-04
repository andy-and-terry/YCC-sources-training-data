program kind_precision_demo
    use, intrinsic :: iso_fortran_env, only: int8, int32, int64, real32, real64
    implicit none
    integer, parameter :: dp = selected_real_kind(15, 307)
    integer, parameter :: i9 = selected_int_kind(9)
    real(real32) :: s = 1.0_real32 / 3.0_real32
    real(dp) :: d = 1.0_dp / 3.0_dp
    integer(int8) :: small = 127_int8
    integer(int64) :: big = huge(1_int64)

    print *, 'single:', s
    print *, 'double:', d
    print *, 'epsilon single/double:', epsilon(s), epsilon(d)
    print *, 'huge int8 / int32    :', huge(small), huge(1_int32)
    print *, 'big int64            :', big
    print *, 'digits               :', digits(s), digits(d)
    print *, 'range                :', range(s), range(d)
    print *, 'kind of dp, i9       :', kind(d), kind(1_i9)
end program kind_precision_demo
