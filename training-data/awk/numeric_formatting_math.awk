#!/usr/bin/awk -f
BEGIN {
    print 7 / 2, int(7 / 2), 7 % 3, -7 % 3, 2 ^ 10
    print sqrt(144), exp(0), log(exp(2)), sin(0), cos(0), atan2(0, -1)
    printf "%d %5.2f %e %o %x %X %5s|%-5s|\n", 42.9, 3.14159, 12345.678, 8, 255, 255, "ab", "ab"
    printf "%08.3f %+d % d %c%c\n", 3.14159, 5, 5, 72, "ello"
    print 0.1 + 0.2 == 0.3 ? "equal" : "not equal"
    print 1e3, 1e-3, 100000 * 100000, 2 ^ 53 + 1
    print "10" + 5, "3x" + 1, "abc" + 1, 10 "" 5
    print (1 < 2) (2 < 1), !0, !1, !"", !"a"
    srand(42); r = int(rand() * 6) + 1; print (r >= 1 && r <= 6) ? "die ok" : "die bad"
    print length(12345), substr(123456, 2, 3), index(12345, 34)
    x = 5; x += 3; x *= 2; x -= 1; x /= 3; x %= 4; x ^= 2; print x
    print x++ + ++x, x--, --x
}
