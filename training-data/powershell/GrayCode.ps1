function ConvertTo-Gray {
    param([int]$N)
    $N -bxor ($N -shr 1)
}

function ConvertFrom-Gray {
    param([int]$G)
    $n = 0
    while ($G -ne 0) {
        $n = $n -bxor $G
        $G = $G -shr 1
    }
    $n
}

0..7 | ForEach-Object {
    $g = ConvertTo-Gray $_
    '{0} -> {1} (back: {2})' -f [Convert]::ToString($_, 2).PadLeft(3, '0'),
        [Convert]::ToString($g, 2).PadLeft(3, '0'), (ConvertFrom-Gray $g)
}
