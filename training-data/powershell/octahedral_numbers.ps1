# n(2n^2+1)/3
function Get-Term([int]$n) {
    return [int]([math]::Floor(($n * (((2 * $n) * $n) + 1)) / 3))
}

foreach ($n in 1..15) {
    '{0,2} -> {1}' -f $n, (Get-Term $n)
}
