$add = { param($a, $b) $a + $b }
& $add 3 4
$add.Invoke(10, 20)

function New-Multiplier([int]$factor) {
    return { param($x) $x * $factor }.GetNewClosure()
}
$triple = New-Multiplier 3
& $triple 7

$ops = @{ double = { param($n) $n * 2 }; square = { param($n) $n * $n } }
foreach ($k in $ops.Keys | Sort-Object) {
    "{0}(6) = {1}" -f $k, (& $ops[$k] 6)
}
