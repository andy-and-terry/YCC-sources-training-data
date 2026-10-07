<?php

echo number_format(1234567.891) . "\n";
echo number_format(1234567.891, 2) . "\n";
echo number_format(1234567.891, 2, ',', '.') . "\n";
echo number_format(0.5) . "\n";

printf("[%5d] [%-5d] [%05d]\n", 42, 42, 42);
printf("[%8.3f] [%'*10s] [%+d]\n", 3.14159, 'pad', 7);
printf("%b %o %X %e\n", 10, 64, 255, 12345.678);
printf("%2\$s %1\$s\n", 'world', 'hello');
printf("%05.1f%%\n", 45.678);

echo str_pad('7', 3, '0', STR_PAD_LEFT) . "\n";
echo str_pad('ab', 6, '-', STR_PAD_BOTH) . "\n";
echo round(2.5) . ' ' . round(-2.5) . ' ' . round(1.955, 2) . "\n";
echo intdiv(17, 5) . ' ' . 17 % 5 . ' ' . fmod(17.5, 5) . "\n";
