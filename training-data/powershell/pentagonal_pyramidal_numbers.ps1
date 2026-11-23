# n^2(n+1)/2
function Get-Term([int]$n) {
    return [int]([math]::Floor((($n * $n) * ($n + 1)) / 2))
}

foreach ($n in 1..15) {
    '{0,2} -> {1}' -f $n, (Get-Term $n)
}
