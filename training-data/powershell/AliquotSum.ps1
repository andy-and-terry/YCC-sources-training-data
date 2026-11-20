# Aliquot sum classification.
foreach ($n in 6, 12, 15, 28) {
    $a = (1..($n - 1) | Where-Object { $n % $_ -eq 0 } | Measure-Object -Sum).Sum
    $kind = switch ($true) { ($a -eq $n) { 'perfect' } ($a -gt $n) { 'abundant' } default { 'deficient' } }
    "$n $a $kind"
}
