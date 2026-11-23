# 6n(n-1)+1
function Get-Term([int]$n) {
    return [int](((6 * $n) * ($n - 1)) + 1)
}

foreach ($n in 1..15) {
    '{0,2} -> {1}' -f $n, (Get-Term $n)
}
