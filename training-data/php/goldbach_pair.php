<?php
// Goldbach pair.
function isPrime(int $n): bool { if ($n < 2) return false; for ($d = 2; $d * $d <= $n; $d++) if ($n % $d === 0) return false; return true; }
function goldbach(int $n): array { for ($p = 2; $p <= intdiv($n, 2); $p++) if (isPrime($p) && isPrime($n - $p)) return [$p, $n - $p]; return []; }
echo implode("+", goldbach(28)), "\n";
