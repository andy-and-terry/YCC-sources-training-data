<?php
declare(strict_types=1);

function lucky(int $limit): array
{
    $nums = range(1, $limit, 2);
    for ($i = 1; $i < count($nums) && $nums[$i] <= count($nums); $i++) {
        $step = $nums[$i];
        $kept = [];
        foreach ($nums as $idx => $value) {
            if (($idx + 1) % $step !== 0) {
                $kept[] = $value;
            }
        }
        $nums = $kept;
    }
    return $nums;
}

echo implode(' ', lucky(50)), PHP_EOL;
