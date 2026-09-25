<?php

function threeSum(array $nums, int $target = 0): array
{
    sort($nums);
    $n = count($nums);
    $out = [];
    for ($i = 0; $i < $n - 2; $i++) {
        if ($i > 0 && $nums[$i] === $nums[$i - 1]) {
            continue;
        }
        [$l, $r] = [$i + 1, $n - 1];
        while ($l < $r) {
            $sum = $nums[$i] + $nums[$l] + $nums[$r];
            if ($sum < $target) {
                $l++;
            } elseif ($sum > $target) {
                $r--;
            } else {
                $out[] = [$nums[$i], $nums[$l], $nums[$r]];
                while ($l < $r && $nums[$l] === $nums[$l + 1]) {
                    $l++;
                }
                while ($l < $r && $nums[$r] === $nums[$r - 1]) {
                    $r--;
                }
                $l++;
                $r--;
            }
        }
    }
    return $out;
}

echo json_encode(threeSum([-1, 0, 1, 2, -1, -4])), PHP_EOL;
echo json_encode(threeSum([0, 0, 0, 0])), PHP_EOL;
echo json_encode(threeSum([1, 2, 3, 4, 5, 6], 10)), PHP_EOL;
