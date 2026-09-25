<?php
declare(strict_types=1);

function spiral(int $n): array
{
    $g = array_fill(0, $n, array_fill(0, $n, 0));
    [$top, $left, $bottom, $right, $k] = [0, 0, $n - 1, $n - 1, 1];
    while ($top <= $bottom && $left <= $right) {
        for ($c = $left; $c <= $right; $c++) $g[$top][$c] = $k++;
        $top++;
        for ($r = $top; $r <= $bottom; $r++) $g[$r][$right] = $k++;
        $right--;
        if ($top <= $bottom) { for ($c = $right; $c >= $left; $c--) $g[$bottom][$c] = $k++; $bottom--; }
        if ($left <= $right) { for ($r = $bottom; $r >= $top; $r--) $g[$r][$left] = $k++; $left++; }
    }
    return $g;
}

foreach (spiral(4) as $row) {
    echo implode(' ', array_map(fn($v) => str_pad((string) $v, 2, ' ', STR_PAD_LEFT), $row)), PHP_EOL;
}
