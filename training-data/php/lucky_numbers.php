<?php
declare(strict_types=1);

function luckyNumbers(int $limit): array
{
    $nums = range(1, $limit - 1, 2);
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

echo implode(' ', luckyNumbers(100)), PHP_EOL;
