<?php

const RUN = 8;

function insertionSort(array &$a, int $lo, int $hi): void
{
    for ($i = $lo + 1; $i <= $hi; $i++) {
        $x = $a[$i];
        $j = $i - 1;
        while ($j >= $lo && $a[$j] > $x) {
            $a[$j + 1] = $a[$j--];
        }
        $a[$j + 1] = $x;
    }
}

function mergeRuns(array &$a, int $lo, int $mid, int $hi): void
{
    $left = array_slice($a, $lo, $mid - $lo + 1);
    $right = array_slice($a, $mid + 1, $hi - $mid);
    [$i, $j, $k] = [0, 0, $lo];
    while ($i < count($left) && $j < count($right)) {
        $a[$k++] = $left[$i] <= $right[$j] ? $left[$i++] : $right[$j++];
    }
    while ($i < count($left)) {
        $a[$k++] = $left[$i++];
    }
    while ($j < count($right)) {
        $a[$k++] = $right[$j++];
    }
}

function timSort(array $a): array
{
    $n = count($a);
    for ($lo = 0; $lo < $n; $lo += RUN) {
        insertionSort($a, $lo, min($lo + RUN - 1, $n - 1));
    }
    for ($size = RUN; $size < $n; $size *= 2) {
        for ($lo = 0; $lo < $n; $lo += 2 * $size) {
            $mid = $lo + $size - 1;
            $hi = min($lo + 2 * $size - 1, $n - 1);
            if ($mid < $hi) {
                mergeRuns($a, $lo, $mid, $hi);
            }
        }
    }
    return $a;
}

mt_srand(7);
$data = array_map(fn () => mt_rand(0, 99), range(1, 30));
$sorted = timSort($data);
$expected = $data;
sort($expected);
echo implode(' ', $sorted), PHP_EOL, 'matches sort(): ', var_export($sorted === $expected, true), PHP_EOL;
