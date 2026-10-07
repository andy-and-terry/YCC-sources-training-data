<?php

/** Sorts in place with the minimum number of writes; returns the write count. */
function cycleSort(array &$a): int
{
    $writes = 0;
    $n = count($a);
    $position = function (int $item, int $start) use (&$a, $n): int {
        $pos = $start;
        for ($i = $start + 1; $i < $n; $i++) {
            if ($a[$i] < $item) {
                $pos++;
            }
        }
        return $pos;
    };
    for ($start = 0; $start < $n - 1; $start++) {
        $item = $a[$start];
        $pos = $position($item, $start);
        if ($pos === $start) {
            continue;
        }
        while ($item === $a[$pos]) {
            $pos++;
        }
        [$a[$pos], $item] = [$item, $a[$pos]];
        $writes++;
        while ($pos !== $start) {
            $pos = $position($item, $start);
            while ($item === $a[$pos]) {
                $pos++;
            }
            [$a[$pos], $item] = [$item, $a[$pos]];
            $writes++;
        }
    }
    return $writes;
}

$data = [1, 8, 3, 9, 10, 10, 2, 4];
$w = cycleSort($data);
echo implode(' ', $data), " writes=$w", PHP_EOL;
