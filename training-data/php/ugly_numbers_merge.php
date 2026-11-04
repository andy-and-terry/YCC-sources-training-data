<?php
function ugly(int $n): int {
    $seq = [1];
    $i2 = $i3 = $i5 = 0;
    while (count($seq) < $n) {
        $next = min($seq[$i2] * 2, $seq[$i3] * 3, $seq[$i5] * 5);
        $seq[] = $next;
        if ($next === $seq[$i2] * 2) $i2++;
        if ($next === $seq[$i3] * 3) $i3++;
        if ($next === $seq[$i5] * 5) $i5++;
    }
    return $seq[$n - 1];
}

echo implode(" ", array_map('ugly', range(1, 12))), "\n";
