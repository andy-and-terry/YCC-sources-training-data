program kind_precision_demo
    use, intrinsic :: iso_fortran_env, only: int32, int64, real32, real64
    implicit none
    integer(int32) :: small
    integer(int64) :: big
    real(real32) :: single
    real(real64) :: double_p

    small = huge(small)
    big = huge(big)
    single = 1.0_real32 / 3.0_real32
    double_p = 1.0_real64 / 3.0_real64

    print *, 'int32 max:', small
    print *, 'int64 max:', big
    print *, 'single:', single
    print *, 'double:', double_p
    print *, 'eps single/double:', epsilon(single), epsilon(double_p)
    print *, 'digits:', precision(single), precision(double_p)
    print *, 'range:', range(small), range(big)
    print *, 'kind of 1.0d0:', kind(1.0d0), 'selected:', selected_real_kind(15, 300)
end program kind_precision_demo
