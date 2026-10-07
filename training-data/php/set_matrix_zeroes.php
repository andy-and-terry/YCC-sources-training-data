<?php

function setZeroes(array $m): array
{
    $rows = $cols = [];
    foreach ($m as $r => $row) {
        foreach ($row as $c => $v) {
            if ($v === 0) {
                $rows[$r] = $cols[$c] = true;
            }
        }
    }
    foreach ($m as $r => &$row) {
        foreach ($row as $c => &$v) {
            if (isset($rows[$r]) || isset($cols[$c])) {
                $v = 0;
            }
        }
        unset($v);
    }
    unset($row);
    return $m;
}

foreach (setZeroes([[0, 1, 2, 0], [3, 4, 5, 2], [1, 3, 1, 5]]) as $row) {
    echo implode(' ', $row), PHP_EOL;
}
