<?php
$s = "The year 2024 and 1999";
preg_match_all('/\b(\d{4})\b/', $s, $m);
echo implode(",", $m[1]), "\n";
echo preg_replace_callback('/\d{4}/', fn($x) => $x[0] + 1, $s), "\n";
printf("%05.1f|%-5s|%5s|%b|%'*8d\n", 3.14159, 'ab', 'cd', 5, 42);
echo str_pad("7", 3, "0", STR_PAD_LEFT), " ", ucwords("hello big world"), " ", wordwrap("a long sentence here", 10, "\n", true), "\n";
echo str_contains("haystack", "st") ? "yes" : "no", " ", substr_count("banana", "an"), "\n";
