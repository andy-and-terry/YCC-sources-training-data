# Perfect totient numbers: sum of the iterated totient chain down to 1 equals n.
function Get-Gcd([int]$a, [int]$b) {
    while ($b -ne 0) { $a, $b = $b, ($a % $b) }
    return $a
}

function Get-Phi([int]$n) {
    $c = 0
    for ($k = 1; $k -le $n; $k++) { if ((Get-Gcd $k $n) -eq 1) { $c++ } }
    return $c
}

function Test-PerfectTotient([int]$n) {
    $total = 0
    $m = $n
    while ($m -gt 1) {
        $m = Get-Phi $m
        $total += $m
    }
    return $total -eq $n
}

(2..199 | Where-Object { Test-PerfectTotient $_ }) -join ' '
