# Carmichael numbers: composite n where a^(n-1) = 1 (mod n) for all a coprime to n.
function Get-Gcd([long]$a, [long]$b) {
    while ($b -ne 0) { $a, $b = $b, ($a % $b) }
    return $a
}

function Get-PowMod([long]$b, [long]$e, [long]$m) {
    $r = 1L
    $b = $b % $m
    while ($e -gt 0) {
        if ($e -band 1) { $r = ($r * $b) % $m }
        $b = ($b * $b) % $m
        $e = $e -shr 1
    }
    return $r
}

function Test-Prime([int]$n) {
    for ($p = 2; $p * $p -le $n; $p++) { if ($n % $p -eq 0) { return $false } }
    return $n -gt 1
}

function Test-Carmichael([int]$n) {
    if (Test-Prime $n) { return $false }
    for ($a = 2; $a -lt $n; $a++) {
        if ((Get-Gcd $a $n) -eq 1 -and (Get-PowMod $a ($n - 1) $n) -ne 1) { return $false }
    }
    return $true
}

$out = for ($n = 3; $n -lt 3000; $n += 2) { if (Test-Carmichael $n) { $n } }
$out -join ' '
