<?php
declare(strict_types=1);

function hamming(string $a, string $b): int
{
    if (strlen($a) !== strlen($b)) {
        throw new InvalidArgumentException('strands must be of equal length');
    }
    return count(array_diff_assoc(str_split($a), str_split($b)));
}

echo hamming('GAGCCTACTAACGGGAT', 'CATCGTAATGACGGCCT'), PHP_EOL;
try {
    hamming('AB', 'A');
} catch (InvalidArgumentException $e) {
    echo 'error: ', $e->getMessage(), PHP_EOL;
}
