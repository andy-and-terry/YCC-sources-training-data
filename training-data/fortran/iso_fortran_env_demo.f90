program iso_fortran_env_demo
    use, intrinsic :: iso_fortran_env, only: int8, int16, int32, int64, real32, real64, output_unit
    implicit none
    integer(int8)  :: a
    integer(int16) :: b
    integer(int64) :: c
    real(real32)   :: x
    real(real64)   :: y

    a = huge(a)
    b = huge(b)
    c = huge(c)
    x = 1.0_real32 / 3.0_real32
    y = 1.0_real64 / 3.0_real64

    write (output_unit, '(A, I0)') 'int8 max:  ', a
    write (output_unit, '(A, I0)') 'int16 max: ', b
    write (output_unit, '(A, I0)') 'int64 max: ', c
    write (output_unit, '(A, F12.9)') 'real32: ', x
    write (output_unit, '(A, F20.17)') 'real64: ', y
end program iso_fortran_env_demo
