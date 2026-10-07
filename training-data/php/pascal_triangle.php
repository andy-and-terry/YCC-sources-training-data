<?php

function pascal(int $rows): array
{
    $tri = [];
    for ($r = 0; $r < $rows; $r++) {
        $row = array_fill(0, $r + 1, 1);
        for ($c = 1; $c < $r; $c++) {
            $row[$c] = $tri[$r - 1][$c - 1] + $tri[$r - 1][$c];
        }
        $tri[] = $row;
    }
    return $tri;
}

foreach (pascal(6) as $row) {
    echo implode(' ', $row), "\n";
}
