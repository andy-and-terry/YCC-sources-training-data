<?php
function isPrime(int $n): bool {
    if ($n < 2) return false;
    for ($i = 2; $i * $i <= $n; $i++) {
        if ($n % $i === 0) return false;
    }
    return true;
}

$result = array_filter(range(2, 199), fn($n) => (string)$n === strrev((string)$n) && isPrime($n));
echo implode(" ", $result), "\n"; // 2 3 5 7 11 101 131 151 181 191
