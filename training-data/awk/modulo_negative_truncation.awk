#!/usr/bin/awk -f
# % keeps the sign of the dividend and int() truncates toward zero,
# so negative operands do not behave like floor division.
BEGIN {
    printf "%d %% %d = %d\n",  7,  3,  7 % 3      # 1
    printf "%d %% %d = %d\n", -7,  3, -7 % 3      # -1
    printf "%d %% %d = %d\n",  7, -3,  7 % -3     # 1
    print "int(-7/3) =", int(-7 / 3)              # -2
    print "int(7/3)  =", int(7 / 3)               # 2
    print "5.5 % 2   =", 5.5 % 2                  # 1.5

    # Always-positive modulo
    a = -7; m = 3
    print "positive mod:", ((a % m) + m) % m      # 2
}
