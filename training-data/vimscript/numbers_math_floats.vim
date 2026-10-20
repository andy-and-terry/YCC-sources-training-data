echo 7 / 2 7 % 3 -7 / 2 -7 % 3 2 * 3 + 1
echo 7.0 / 2 float2nr(3.99) round(2.5) floor(-2.5) ceil(2.1) abs(-5) sqrt(16.0)
echo pow(2, 10) pow(2.0, 0.5) exp(0) log10(1000.0) sin(0.0) atan2(1.0, 1.0) * 4
echo 0x1F 0b101 017 1.0e3 1.5e-2
echo and(12, 10) or(12, 10) xor(12, 10) invert(0)
echo printf('%d %s %.3f %e', 255, 0x10, 3.14159, 12345.678)
echo str2nr('101', 2) printf('%b', 10) printf('%o', 8) printf('%X', 255)
echo 10 > 9 '10' > '9' 10 == '10' 'abc' == 0
echo range(5) range(2, 10, 3) range(5, 1, -2)
echo min([3, 1, 2]) max([3, 1, 2]) len(range(100))
echo (1 + 2) * 3 - 4 / 2
echo isnan(0.0 / 0.0) isinf(1.0 / 0.0) 0.1 + 0.2 == 0.3
echo localtime() > 0 strftime('%Y', 0) reltimestr(reltime()) != ''
echo (rand() >= 0) (len(srand(1)) >= 0)
