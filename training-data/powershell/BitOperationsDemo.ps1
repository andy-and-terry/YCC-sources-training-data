$a = 12
$b = 10
"and: $($a -band $b)"
"or:  $($a -bor $b)"
"xor: $($a -bxor $b)"
"not: $(-bnot $a)"
"shl: $($a -shl 2), shr: $($a -shr 1)"
"binary: $([Convert]::ToString($a, 2).PadLeft(8, '0'))"
"hex: {0:X4}" -f 255
"parsed: $([Convert]::ToInt32('1101', 2))"

function Get-PopCount {
    param([uint32]$Value)
    $count = 0
    while ($Value -ne 0) { $count += $Value -band 1; $Value = $Value -shr 1 }
    $count
}
"popcount(255) = $(Get-PopCount 255)"
