<?php

function pascal(int $rows): array
{
    $tri = [[1]];
    for ($r = 1; $r < $rows; $r++) {
        $prev = $tri[$r - 1];
        $row = [1];
        for ($i = 1; $i < $r; $i++) {
            $row[] = $prev[$i - 1] + $prev[$i];
        }
        $row[] = 1;
        $tri[] = $row;
    }
    return $tri;
}

$tri = pascal(8);
$width = strlen(implode(' ', end($tri)));
foreach ($tri as $row) {
    echo str_pad(implode(' ', $row), $width, ' ', STR_PAD_BOTH), PHP_EOL;
}
