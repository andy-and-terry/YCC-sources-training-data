<?php

$n = 1234567.891;
echo number_format($n), "\n";
echo number_format($n, 2), "\n";
echo number_format($n, 2, ',', '.'), "\n";
printf("[%8.2f] [%-8s] [%08d] [%+d]\n", 3.14159, 'ab', 42, 7);
printf("%b %o %X %e\n", 10, 64, 255, 12345.678);
echo str_pad('7', 3, '0', STR_PAD_LEFT), "\n";
echo round(2.5), " ", round(-2.5), " ", round(1.955, 2), " ", floor(-1.5), " ", intdiv(7, 2), "\n";
echo 7 % 3, " ", fmod(7.5, 2), " ", 2 ** 10, "\n";
