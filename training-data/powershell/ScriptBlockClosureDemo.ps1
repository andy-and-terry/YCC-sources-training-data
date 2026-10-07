# GetNewClosure captures the current value of local variables.
$multipliers = foreach ($m in 2, 3, 4) {
    { param($x) $x * $m }.GetNewClosure()
}

foreach ($f in $multipliers) {
    & $f 10
}

$adder = { param($a, $b) $a + $b }
"Sum: $(& $adder 5 7)"
"Invoke: $($adder.Invoke(1, 2))"
