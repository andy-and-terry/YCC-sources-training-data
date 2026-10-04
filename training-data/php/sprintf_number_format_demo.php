<?php
echo sprintf("%05d|%-8s|%8.3f|%x|%b", 42, "ab", 3.14159, 255, 5), "\n";
echo number_format(1234567.891, 2), "\n";
echo number_format(1234567.891, 2, ',', '.'), "\n";
echo str_pad("7", 3, "0", STR_PAD_LEFT), "\n";
printf("%s has %d items (%.1f%%)\n", "cart", 3, 42.5);
echo ucwords("hello big world"), " ", strrev("abc"), "\n";
