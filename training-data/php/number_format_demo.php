<?php

echo number_format(1234567.891), "\n";
echo number_format(1234567.891, 2), "\n";
echo number_format(1234567.891, 2, ',', '.'), "\n";
echo number_format(0.5), "\n";

echo round(3.14159, 2), " ", round(1234.5678, -2), " ", round(2.5), " ", round(-2.5), "\n";
echo floor(-1.5), " ", ceil(-1.5), " ", intdiv(17, 5), " ", 17 % 5, " ", fmod(17.5, 5), "\n";
echo 10 ** 3, " ", 2 ** -1, " ", sqrt(144), " ", abs(-7), "\n";

echo base_convert('ff', 16, 2), " ", bindec('1010'), " ", dechex(255), " ", octdec('17'), "\n";

printf("%08.3f|%+d|%x|%b|%e\n", 3.14159, 5, 255, 5, 12345.678);
printf("[%'*10s] [%-10s] [%5.1f%%]\n", 'pad', 'left', 45.678);

var_dump(0.1 + 0.2 == 0.3);
var_dump(abs((0.1 + 0.2) - 0.3) < PHP_FLOAT_EPSILON);
var_dump(PHP_INT_MAX + 1);
var_dump(is_numeric('1e5'), is_numeric('abc'), (int) '12abc');
