# Population count (number of set bits) for 0..15
function Get-Bits([int]$n) {
    $c = 0
    while ($n -gt 0) { $c += $n -band 1; $n = $n -shr 1 }
    $c
}

(0..15 | ForEach-Object { Get-Bits $_ }) -join ' '
