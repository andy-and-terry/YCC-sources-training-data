<?php
declare(strict_types=1);

function histogram(array $values, int $width = 30): string
{
    $counts = array_count_values($values);
    ksort($counts);
    $peak = max($counts);
    $lines = [];
    foreach ($counts as $k => $n) {
        $lines[] = sprintf('%3s | %s %d', $k, str_repeat('#', max(1, intdiv($n * $width, $peak))), $n);
    }
    return implode(PHP_EOL, $lines);
}

echo histogram(str_split('theraininspainfallsmainlyontheplain')), PHP_EOL;
