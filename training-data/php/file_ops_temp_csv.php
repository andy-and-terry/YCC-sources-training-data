<?php
$f = tempnam(sys_get_temp_dir(), 'csv');
$h = fopen($f, 'w');
fputcsv($h, ['name', 'note']);
fputcsv($h, ['Ada', 'likes "quotes", commas']);
fclose($h);
$h = fopen($f, 'r');
while (($row = fgetcsv($h)) !== false) echo implode('|', $row), PHP_EOL;
fclose($h);
echo filesize($f) > 0 ? 'nonempty' : 'empty', PHP_EOL;
file_put_contents($f, "x\ny\n", FILE_APPEND);
echo count(file($f)), PHP_EOL;
unlink($f);
