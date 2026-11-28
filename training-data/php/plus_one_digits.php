<?php
function plusOne(array $digits): array {
    for ($i = count($digits) - 1; $i >= 0; $i--) {
        if ($digits[$i] < 9) {
            $digits[$i]++;
            return $digits;
        }
        $digits[$i] = 0;
    }
    array_unshift($digits, 1);
    return $digits;
}

echo implode(',', plusOne([1, 2, 9])), "\n"; // 1,3,0
echo implode(',', plusOne([9, 9])), "\n";    // 1,0,0
