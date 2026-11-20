# Wilson's theorem primality test.
function Test-Wilson([int]$n) {
    if ($n -lt 2) { return $false }
    $f = [long]1
    for ($i = 2; $i -lt $n; $i++) { $f = ($f * $i) % $n }
    $f -eq $n - 1
}
(2..19 | Where-Object { Test-Wilson $_ }) -join ' '
