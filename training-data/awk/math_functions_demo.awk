#!/usr/bin/awk -f
# Numeric built-ins: sqrt, exp, log, sin, cos, atan2, int, and ^ / ** powers.
BEGIN {
    pi = atan2(0, -1)
    printf "pi        = %.6f\n", pi
    printf "sqrt(144) = %d\n", sqrt(144)
    printf "exp(1)    = %.6f\n", exp(1)
    printf "log(100)  = %.6f\n", log(100)
    printf "log10(1000) = %.1f\n", log(1000) / log(10)
    printf "sin(pi/2) = %.3f\n", sin(pi / 2)
    printf "cos(pi)   = %.3f\n", cos(pi)
    printf "2^10      = %d\n", 2 ^ 10

    # int() truncates toward zero, it does not round or floor.
    printf "int(3.9)=%d int(-3.9)=%d\n", int(3.9), int(-3.9)
    printf "round(2.5)=%d round(-2.5)=%d\n", int(2.5 + 0.5), -int(2.5 + 0.5)

    # Degrees to radians and back.
    deg = 30
    rad = deg * pi / 180
    printf "sin(30 deg) = %.3f\n", sin(rad)
    printf "asin-ish via atan2: %.1f degrees\n", atan2(sin(rad), cos(rad)) * 180 / pi
}
