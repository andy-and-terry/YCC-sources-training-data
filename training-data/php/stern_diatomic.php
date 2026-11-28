<?php
function stern(int $count): array {
    $seq = [0, 1];
    for ($i = 2; $i < $count; $i++) {
        $seq[$i] = $i % 2 === 0 ? $seq[intdiv($i, 2)] : $seq[intdiv($i, 2)] + $seq[intdiv($i, 2) + 1];
    }
    return array_slice($seq, 0, $count);
}

echo implode(" ", stern(15)), "\n"; // 0 1 1 2 1 3 2 3 1 4 3 5 2 5 3
