<?php
declare(strict_types=1);

function isValidIsbn10(string $isbn): bool
{
    $s = str_replace('-', '', $isbn);
    if (!preg_match('/^\d{9}[\dX]$/', $s)) {
        return false;
    }
    $total = 0;
    for ($i = 0; $i < 10; $i++) {
        $total += ($s[$i] === 'X' ? 10 : (int) $s[$i]) * (10 - $i);
    }
    return $total % 11 === 0;
}

foreach (['3-598-21508-8', '3-598-21507-X', '3-598-21508-9'] as $s) {
    echo $s, ' ', isValidIsbn10($s) ? 'true' : 'false', PHP_EOL;
}
