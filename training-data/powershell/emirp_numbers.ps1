# Emirps: primes whose digit reversal is a different prime.
function Test-Prime([int]$n) {
    if ($n -lt 2) { return $false }
    for ($d = 2; $d * $d -le $n; $d++) { if ($n % $d -eq 0) { return $false } }
    return $true
}

$out = 2..199 | Where-Object {
    $chars = "$_".ToCharArray()
    [array]::Reverse($chars)
    $r = [int](-join $chars)
    $r -ne $_ -and (Test-Prime $_) -and (Test-Prime $r)
}
$out -join ' '
