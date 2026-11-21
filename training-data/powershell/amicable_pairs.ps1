# Amicable pairs below 1500 via sums of proper divisors.
function Get-DivisorSum([int]$n) {
    $t = 0
    for ($d = 1; $d -lt $n; $d++) {
        if ($n % $d -eq 0) { $t += $d }
    }
    return $t
}

foreach ($a in 2..1499) {
    $b = Get-DivisorSum $a
    if ($b -gt $a -and (Get-DivisorSum $b) -eq $a) { "$a $b" }
}
