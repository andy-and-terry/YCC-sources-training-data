# Fermat primality test; Carmichael number 561 fools it.
function Get-PowMod([long]$b, [long]$e, [long]$m) {
    $result = 1L
    $b = $b % $m
    while ($e -gt 0) {
        if ($e -band 1) { $result = ($result * $b) % $m }
        $b = ($b * $b) % $m
        $e = $e -shr 1
    }
    $result
}

function Test-FermatPrime([long]$n) {
    $n -gt 2 -and (Get-PowMod 2 ($n - 1) $n) -eq 1
}

foreach ($n in 97, 91, 561) {
    "{0} {1}" -f $n, (Test-FermatPrime $n)
}
