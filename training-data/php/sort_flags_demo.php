<?php

$files = ['img12.png', 'img10.png', 'img2.png', 'IMG1.png'];

sort($files);
echo implode(' ', $files) . "\n";

sort($files, SORT_NATURAL | SORT_FLAG_CASE);
echo implode(' ', $files) . "\n";

natcasesort($files);
echo implode(' ', $files) . "\n";

$mixed = [10, '9', 'abc', 1.5];
sort($mixed, SORT_STRING);
echo implode(' ', $mixed) . "\n";

$byKey = ['b' => 1, 'a' => 2, 'c' => 0];
ksort($byKey);
echo implode(',', array_keys($byKey)) . "\n";
arsort($byKey);
echo implode(',', array_keys($byKey)) . "\n";
