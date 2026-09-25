<?php

function luhnSum(string $digits): int
{
    $sum = 0;
    foreach (array_reverse(str_split($digits)) as $i => $d) {
        $d = (int) $d;
        if ($i % 2 === 1 && ($d *= 2) > 9) {
            $d -= 9;
        }
        $sum += $d;
    }
    return $sum;
}

function luhnValid(string $input): bool
{
    $s = str_replace(' ', '', $input);
    return preg_match('/^\d{2,}$/', $s) === 1 && luhnSum($s) % 10 === 0;
}

function checkDigit(string $partial): int
{
    return (10 - luhnSum($partial . '0') % 10) % 10;
}

echo json_encode([luhnValid('4539 3195 0343 6467'), luhnValid('8273 1232 7352 0569'), luhnValid('12a4')]), PHP_EOL;
echo 'check digit for 7992739871: ', checkDigit('7992739871'), PHP_EOL;
