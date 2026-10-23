<?php
declare(strict_types=1);

function vanEck(int $count): array
{
    $seq = [0];
    $lastSeen = [];
    for ($n = 0; $n < $count - 1; $n++) {
        $current = $seq[$n];
        $next = isset($lastSeen[$current]) ? $n - $lastSeen[$current] : 0;
        $lastSeen[$current] = $n;
        $seq[] = $next;
    }
    return $seq;
}

echo implode(' ', vanEck(20)), PHP_EOL;
