# P(n) = 2*P(n-1) + P(n-2), with P(0) = 0 and P(1) = 1
$a = [bigint]0
$b = [bigint]1
foreach ($i in 0..14) {
    "P($i) = $a"
    $a, $b = $b, (2 * $b + $a)
}
