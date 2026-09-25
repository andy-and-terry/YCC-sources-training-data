<?php

function canPartition(array $nums): ?array
{
    $total = array_sum($nums);
    if ($total % 2 !== 0) {
        return null;
    }
    $target = intdiv($total, 2);
    $from = [0 => -1]; // sum => index of item that reached it
    foreach ($nums as $i => $x) {
        foreach (array_keys($from) as $s) {
            $ns = $s + $x;
            if ($ns <= $target && !isset($from[$ns])) {
                $from[$ns] = $i;
            }
        }
    }
    if (!isset($from[$target])) {
        return null;
    }
    $subset = [];
    for ($s = $target; $s > 0; $s -= $nums[$from[$s]]) {
        $subset[] = $nums[$from[$s]];
    }
    return $subset;
}

foreach ([[1, 5, 11, 5], [1, 2, 3, 5], [3, 1, 1, 2, 2, 1]] as $a) {
    $r = canPartition($a);
    echo json_encode($a), ' -> ', $r === null ? 'no' : json_encode($r), PHP_EOL;
}
