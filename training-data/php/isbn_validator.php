<?php

function validateIsbn(string $raw): string
{
    $s = strtoupper(str_replace(['-', ' '], '', $raw));
    if (preg_match('/^\d{9}[\dX]$/', $s)) {
        $total = 0;
        foreach (str_split($s) as $i => $c) {
            $total += (10 - $i) * ($c === 'X' ? 10 : (int) $c);
        }
        return $total % 11 === 0 ? 'ISBN-10' : 'invalid checksum';
    }
    if (preg_match('/^\d{13}$/', $s)) {
        $total = 0;
        foreach (str_split($s) as $i => $c) {
            $total += (int) $c * ($i % 2 ? 3 : 1);
        }
        return $total % 10 === 0 ? 'ISBN-13' : 'invalid checksum';
    }
    return 'invalid format';
}

foreach (['0-306-40615-2', '0-306-40615-3', '978-0-306-40615-7', '0-8044-2957-X', '12345'] as $isbn) {
    printf("%-20s %s\n", $isbn, validateIsbn($isbn));
}
