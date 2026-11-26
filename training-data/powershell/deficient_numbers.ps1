# Deficient numbers below 100; expect 76.
function Get-ProperSum([int]$n) {
    $t = 0
    for ($d = 1; $d -lt $n; $d++) { if ($n % $d -eq 0) { $t += $d } }
    return $t
}
@(1..99 | Where-Object { (Get-ProperSum $_) -lt $_ }).Count
