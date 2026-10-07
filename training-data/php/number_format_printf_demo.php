<?php

echo number_format(1234567.891), "\n";
echo number_format(1234567.891, 2), "\n";
echo number_format(1234567.891, 2, ',', '.'), "\n";

printf("[%5d] [%-5d] [%05d]\n", 42, 42, 42);
printf("[%8.3f] [%'*10s] [%+d]\n", 3.14159, 'pad', 7);
printf("%b %o %X %e\n", 10, 10, 255, 12345.678);
echo sprintf('%2$s %1$s', 'world', 'hello'), "\n";
