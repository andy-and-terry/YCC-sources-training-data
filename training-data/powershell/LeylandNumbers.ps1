# Leyland numbers: x^y + y^x for x >= y >= 2.
$vals = foreach ($x in 2..4) {
    foreach ($y in 2..$x) {
        [bigint]::Pow($x, $y) + [bigint]::Pow($y, $x)
    }
}
$vals -join ' '
