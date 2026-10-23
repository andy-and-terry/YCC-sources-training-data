program ieee_arithmetic_demo
    use, intrinsic :: ieee_arithmetic
    implicit none
    real :: x, y, nan_val, inf_val

    x = 1.0
    y = 0.0
    inf_val = ieee_value(x, ieee_positive_inf)
    nan_val = ieee_value(x, ieee_quiet_nan)

    print *, ieee_is_nan(nan_val), ieee_is_nan(x)
    print *, ieee_is_finite(inf_val), ieee_is_finite(x)
    print *, inf_val > huge(x)
    print *, ieee_class(y) == ieee_positive_zero
    print *, ieee_copy_sign(3.0, -1.0)
    print *, ieee_support_nan(x)
end program ieee_arithmetic_demo
