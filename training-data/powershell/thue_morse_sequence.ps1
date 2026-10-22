# Thue-Morse: t(n) is the parity of the number of 1 bits in n
function Get-Parity([int]$n) {
    $p = 0
    while ($n -gt 0) {
        $p = $p -bxor ($n -band 1)
        $n = $n -shr 1
    }
    return $p
}

Write-Output ((0..31 | ForEach-Object { Get-Parity $_ }) -join '')
