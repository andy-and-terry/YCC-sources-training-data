<?php

function canJump(array $a): bool
{
    $reach = 0;
    foreach ($a as $i => $n) {
        if ($i > $reach) {
            return false;
        }
        $reach = max($reach, $i + $n);
    }
    return true;
}

function minJumps(array $a): ?int
{
    [$jumps, $end, $far] = [0, 0, 0];
    for ($i = 0; $i < count($a) - 1; $i++) {
        $far = max($far, $i + $a[$i]);
        if ($i === $end) {
            if ($far <= $i) {
                return null;
            }
            $jumps++;
            $end = $far;
        }
    }
    return $jumps;
}

echo json_encode([canJump([2, 3, 1, 1, 4]), canJump([3, 2, 1, 0, 4]), minJumps([2, 3, 1, 1, 4]), minJumps([3, 2, 1, 0, 4])]), PHP_EOL;
