<?php

$text = 'Héllo Wörld ñ';

echo strlen($text) . "\n";
echo mb_strlen($text, 'UTF-8') . "\n";
echo mb_strtoupper($text, 'UTF-8') . "\n";
echo mb_substr($text, 1, 4, 'UTF-8') . "\n";
echo mb_strpos($text, 'W', 0, 'UTF-8') . "\n";
print_r(mb_str_split('añb'));
