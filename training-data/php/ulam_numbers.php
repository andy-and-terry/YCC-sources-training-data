<?php
declare(strict_types=1);

function ulam(int $count): array
{
    $seq = [1, 2];
    for ($n = 3; count($seq) < $count; $n++) {
        $ways = 0;
        foreach ($seq as $a) {
            $b = $n - $a;
            if ($b > $a && in_array($b, $seq, true)) {
                $ways++;
            }
        }
        if ($ways === 1) {
            $seq[] = $n;
        }
    }
    return $seq;
}

echo implode(' ', ulam(15)), PHP_EOL;
