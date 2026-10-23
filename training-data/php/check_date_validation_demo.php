<?php

// checkdate validates a month/day/year triple, including leap years
$cases = [[2, 29, 2024], [2, 29, 2023], [4, 31, 2024], [12, 31, 1999], [13, 1, 2020]];
foreach ($cases as [$m, $d, $y]) {
    printf("%02d/%02d/%d => %s\n", $m, $d, $y, checkdate($m, $d, $y) ? 'valid' : 'invalid');
}

// Strict parsing of a string with DateTime::createFromFormat plus error check
function parseDate(string $text): ?DateTimeImmutable
{
    $dt = DateTimeImmutable::createFromFormat('!Y-m-d', $text);
    $errors = DateTimeImmutable::getLastErrors();
    if ($dt === false || ($errors && ($errors['warning_count'] || $errors['error_count']))) {
        return null;
    }
    return $dt;
}

foreach (['2024-02-29', '2023-02-29', '2024-13-01', 'nonsense'] as $text) {
    $dt = parseDate($text);
    echo str_pad($text, 12), $dt ? $dt->format('D, d M Y') : 'rejected', PHP_EOL;
}

echo cal_days_in_month_fallback(2, 2024), PHP_EOL;

function cal_days_in_month_fallback(int $month, int $year): int
{
    return (int) (new DateTimeImmutable(sprintf('%04d-%02d-01', $year, $month)))->format('t');
}
