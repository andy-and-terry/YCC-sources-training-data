# n(n+1)(n+2)/6
function Get-Term([int]$n) {
    return [int]([math]::Floor((($n * ($n + 1)) * ($n + 2)) / 6))
}

foreach ($n in 1..15) {
    '{0,2} -> {1}' -f $n, (Get-Term $n)
}
