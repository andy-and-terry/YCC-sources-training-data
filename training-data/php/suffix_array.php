<?php

function buildSuffixArray(string $s): array
{
    $indices = range(0, strlen($s) - 1);
    usort($indices, fn(int $a, int $b) => substr($s, $a) <=> substr($s, $b));
    return $indices;
}

$text = 'banana';
$sa = buildSuffixArray($text);
echo implode(' ', $sa) . "\n";
foreach ($sa as $i) {
    echo substr($text, $i) . "\n";
}
