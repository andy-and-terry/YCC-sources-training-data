<?php

function minWindow(string $s, string $t): string
{
    $need = count_chars($t, 1);
    $missing = strlen($t);
    [$bestL, $bestLen, $left] = [0, PHP_INT_MAX, 0];
    for ($right = 0; $right < strlen($s); $right++) {
        $c = ord($s[$right]);
        if (($need[$c] ?? 0) > 0) {
            $missing--;
        }
        $need[$c] = ($need[$c] ?? 0) - 1;
        while ($missing === 0) {
            if ($right - $left + 1 < $bestLen) {
                [$bestL, $bestLen] = [$left, $right - $left + 1];
            }
            $l = ord($s[$left++]);
            if (++$need[$l] > 0) {
                $missing++;
            }
        }
    }
    return $bestLen === PHP_INT_MAX ? '' : substr($s, $bestL, $bestLen);
}

echo json_encode(minWindow('ADOBECODEBANC', 'ABC')), ' ', json_encode(minWindow('a', 'aa')), PHP_EOL;
