<?php
declare(strict_types=1);

function luhnValid(string $input): bool
{
    $s = str_replace(' ', '', $input);
    if (strlen($s) < 2 || !ctype_digit($s)) {
        return false;
    }
    $sum = 0;
    foreach (str_split(strrev($s)) as $i => $ch) {
        $d = (int) $ch;
        if ($i % 2 === 1) {
            $d *= 2;
            if ($d > 9) {
                $d -= 9;
            }
        }
        $sum += $d;
    }
    return $sum % 10 === 0;
}

var_dump(luhnValid('4539 3195 0343 6467'), luhnValid('8273 1232 7352 0569'));
