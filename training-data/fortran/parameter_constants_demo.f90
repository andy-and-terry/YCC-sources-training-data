program parameter_constants_demo
    use, intrinsic :: iso_fortran_env, only: int32, int64, real32, real64
    implicit none

    real(real64), parameter :: pi = 3.14159265358979323846_real64
    integer, parameter :: n = 4
    integer, parameter :: primes(n) = [2, 3, 5, 7]
    character(len=*), parameter :: label = 'constants'
    integer(int64), parameter :: big = 2_int64**40

    print *, label
    print *, 'pi =', pi
    print *, 'pi (single) =', real(pi, real32)
    print *, 'sum of primes =', sum(primes)
    print *, 'big =', big
    print *, 'huge int32 =', huge(1_int32)
    print *, 'epsilon double =', epsilon(1.0_real64)
    print *, 'tiny real32 =', tiny(1.0_real32)
    print *, 'digits:', digits(1_int32), digits(1.0_real64)
end program parameter_constants_demo
