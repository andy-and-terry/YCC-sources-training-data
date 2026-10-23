program kind_selected_precision_demo
    implicit none
    integer, parameter :: sp = selected_real_kind(6, 37)
    integer, parameter :: dp = selected_real_kind(15, 307)
    integer, parameter :: i4 = selected_int_kind(9)
    integer, parameter :: i8 = selected_int_kind(18)
    real(sp) :: a
    real(dp) :: b
    integer(i4) :: m
    integer(i8) :: n

    a = 1.0_sp / 3.0_sp
    b = 1.0_dp / 3.0_dp
    m = huge(m)
    n = huge(n)

    print *, a
    print *, b
    print *, m, n
    print *, precision(a), precision(b)
    print *, range(m), range(n)
    print *, kind(a), kind(b)
end program kind_selected_precision_demo
