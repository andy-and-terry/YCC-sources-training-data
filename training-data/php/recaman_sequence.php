<?php
declare(strict_types=1);

function recaman(int $count): array
{
    $seq = [0];
    $seen = [0 => true];
    for ($n = 1; $n < $count; $n++) {
        $next = $seq[$n - 1] - $n;
        if ($next <= 0 || isset($seen[$next])) {
            $next = $seq[$n - 1] + $n;
        }
        $seen[$next] = true;
        $seq[] = $next;
    }
    return $seq;
}

echo implode(' ', recaman(20)), PHP_EOL;
