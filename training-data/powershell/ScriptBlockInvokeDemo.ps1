$add = { param($a, $b) $a + $b }
"add: $(& $add 2 3)"
"dot-call: $($add.Invoke(10, 5))"

function New-Multiplier {
    param([int]$Factor)
    return { param($x) $x * $Factor }.GetNewClosure()
}

$triple = New-Multiplier -Factor 3
$tenfold = New-Multiplier -Factor 10
"triple(7) = $(& $triple 7)"
"tenfold(7) = $(& $tenfold 7)"

$ops = @{
    Square = { param($n) $n * $n }
    Negate = { param($n) -$n }
}
foreach ($key in $ops.Keys | Sort-Object) {
    "$key(6) = $(& $ops[$key] 6)"
}

$compose = { param($f, $g, $x) & $f (& $g $x) }
"compose: $(& $compose $ops.Negate $ops.Square 4)"
