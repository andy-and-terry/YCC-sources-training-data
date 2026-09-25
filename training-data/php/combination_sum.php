<?php

/** @return list<list<int>> */
function combinationSum(array $candidates, int $target): array
{
    $c = array_values(array_unique($candidates));
    sort($c);
    $out = [];
    $path = [];
    $backtrack = function (int $start, int $remaining) use (&$backtrack, &$out, &$path, $c): void {
        if ($remaining === 0) {
            $out[] = $path;
            return;
        }
        for ($i = $start; $i < count($c) && $c[$i] <= $remaining; $i++) {
            $path[] = $c[$i];
            $backtrack($i, $remaining - $c[$i]);
            array_pop($path);
        }
    };
    $backtrack(0, $target);
    return $out;
}

foreach ([[[2, 3, 6, 7], 7], [[2, 3, 5], 8]] as [$cands, $t]) {
    echo implode(' ', array_map(fn ($x) => '[' . implode(',', $x) . ']', combinationSum($cands, $t))), PHP_EOL;
}
