<?php

function gnomeSort(array $a, ?callable $cmp = null): array
{
    $cmp ??= fn ($x, $y) => $x <=> $y;
    $i = 0;
    while ($i < count($a)) {
        if ($i === 0 || $cmp($a[$i - 1], $a[$i]) <= 0) {
            $i++;
        } else {
            [$a[$i - 1], $a[$i]] = [$a[$i], $a[$i - 1]];
            $i--;
        }
    }
    return $a;
}

echo implode(' ', gnomeSort([34, 2, 10, -9, 7])), PHP_EOL;
echo implode(' ', gnomeSort(['Delta', 'alpha', 'Charlie', 'bravo'], 'strcasecmp')), PHP_EOL;
