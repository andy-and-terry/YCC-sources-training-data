<?php
$s = "The quick brown fox";
echo ucwords(strtolower($s)), '|', str_pad('7', 3, '0', STR_PAD_LEFT), '|', wordwrap($s, 10, "\n", true), PHP_EOL;
echo substr_count($s, 'o'), strpos($s, 'quick'), str_contains($s, 'fox') ? 'Y' : 'N', PHP_EOL;
echo sprintf('%08.3f|%-5s|%05d|%b|%X', 3.14159, 'ab', 42, 5, 255), PHP_EOL;
echo strrev('abc'), similar_text('World', 'Word'), levenshtein('kitten', 'sitting'), PHP_EOL;
echo mb_strlen('héllo'), strlen('héllo'), mb_strtoupper('héllo'), PHP_EOL;
echo number_format(1234567.891, 2), ' ', number_format(1234567.891, 2, ',', '.'), PHP_EOL;
