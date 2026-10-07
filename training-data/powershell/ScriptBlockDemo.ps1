$square = { param($x) $x * $x }
& $square 7

$ops = @{
    Add      = { param($a, $b) $a + $b }
    Multiply = { param($a, $b) $a * $b }
}
foreach ($name in $ops.Keys | Sort-Object) {
    '{0}(6, 7) = {1}' -f $name, (& $ops[$name] 6 7)
}

function Invoke-Twice {
    param([scriptblock]$Action)
    & $Action
    & $Action
}
$counter = 0
Invoke-Twice { $script:counter++ }
"counter = $counter"

$adder = { param($n) { param($x) $x + $n }.GetNewClosure() }
$addFive = & $adder 5
& $addFive 10
