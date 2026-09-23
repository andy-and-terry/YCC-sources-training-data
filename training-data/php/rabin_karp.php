<?php

function rabinKarpSearch(string $text, string $pattern): array
{
    $n = strlen($text);
    $m = strlen($pattern);
    if ($m === 0 || $m > $n) {
        return [];
    }

    $base = 256;
    $modulus = 1_000_000_007;

    $highOrder = 1;
    for ($i = 0; $i < $m - 1; $i++) {
        $highOrder = ($highOrder * $base) % $modulus;
    }

    $patternHash = 0;
    $windowHash = 0;
    for ($i = 0; $i < $m; $i++) {
        $patternHash = ($patternHash * $base + ord($pattern[$i])) % $modulus;
        $windowHash = ($windowHash * $base + ord($text[$i])) % $modulus;
    }

    $matches = [];
    for ($i = 0; $i <= $n - $m; $i++) {
        if ($windowHash === $patternHash && substr($text, $i, $m) === $pattern) {
            $matches[] = $i;
        }
        if ($i < $n - $m) {
            $windowHash = ($windowHash - ord($text[$i]) * $highOrder) % $modulus;
            $windowHash = ($windowHash * $base + ord($text[$i + $m])) % $modulus;
            $windowHash = ($windowHash + $modulus) % $modulus;
        }
    }

    return $matches;
}

print_r(rabinKarpSearch('abracadabra', 'abra'));
print_r(rabinKarpSearch('aaaaaa', 'aa'));
