<?php
declare(strict_types=1);

function maxProduct(array $nums): int
{
    $best = $hi = $lo = $nums[0];
    foreach (array_slice($nums, 1) as $x) {
        if ($x < 0) [$hi, $lo] = [$lo, $hi];
        $hi = max($x, $hi * $x);
        $lo = min($x, $lo * $x);
        $best = max($best, $hi);
    }
    return $best;
}

echo maxProduct([2, 3, -2, 4]), ' ', maxProduct([-2, 0, -1]), ' ', maxProduct([-2, 3, -4]), PHP_EOL;
