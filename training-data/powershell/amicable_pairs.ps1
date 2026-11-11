# Amicable pairs: d(a) -eq b and d(b) -eq a with a -ne b.
function Get-DivisorSum([int]$n) {
    $s = 0
    for ($i = 1; $i -lt $n; $i++) {
        if ($n % $i -eq 0) { $s += $i }
    }
    $s
}

foreach ($a in 2..1499) {
    $b = Get-DivisorSum $a
    if ($b -gt $a -and (Get-DivisorSum $b) -eq $a) { "$a $b" }
}
