program kind_precision_demo
    use, intrinsic :: iso_fortran_env, only: int32, int64, real32, real64
    implicit none
    real(real32) :: a = 1.0_real32 / 3.0_real32
    real(real64) :: b = 1.0_real64 / 3.0_real64
    integer(int32) :: small = huge(1_int32)
    integer(int64) :: big

    big = int(small, int64) + 1_int64
    print *, "single:", a
    print *, "double:", b
    print *, "eps single/double:", epsilon(a), epsilon(b)
    print *, "huge int32:", small, " +1 as int64:", big
    print *, "digits:", precision(a), precision(b)
    print *, "selected_real_kind(15):", selected_real_kind(15)
    print *, "tiny:", tiny(b)
end program kind_precision_demo
