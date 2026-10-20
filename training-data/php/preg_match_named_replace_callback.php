<?php
preg_match('/(?<y>\d{4})-(?<m>\d{2})/', 'on 2024-07-15', $m);
echo $m['y'], $m['m'], PHP_EOL;
echo preg_replace_callback('/\d+/', fn($x) => $x[0] * 2, 'a1 b22 c3'), PHP_EOL;
preg_match_all('/\b(\w)(\w*)\b/', 'hello big world', $all, PREG_SET_ORDER);
echo count($all), $all[1][1], PHP_EOL;
print_r(preg_split('/[\s,]+/', 'a, b  c,d'));
echo preg_quote('a.b*c'), PHP_EOL;
