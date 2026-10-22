<?php
declare(strict_types=1);

function delannoy(int $size): array
{
    $d = array_fill(0, $size, array_fill(0, $size, 1));
    for ($m = 1; $m < $size; $m++) {
        for ($n = 1; $n < $size; $n++) {
            $d[$m][$n] = $d[$m - 1][$n] + $d[$m][$n - 1] + $d[$m - 1][$n - 1];
        }
    }
    return $d;
}

$table = delannoy(10);
$central = [];
for ($i = 0; $i < 10; $i++) {
    $central[] = $table[$i][$i];
}
echo implode(' ', $central), PHP_EOL;
