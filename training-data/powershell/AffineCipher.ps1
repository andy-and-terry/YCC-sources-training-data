function Protect-Affine {
    param([string]$Text, [int]$A, [int]$B)
    -join ($Text.ToCharArray() | ForEach-Object {
        if ($_ -cmatch '[A-Z]') {
            [char]((($A * ([int]$_ - 65) + $B) % 26) + 65)
        } else { $_ }
    })
}

Protect-Affine -Text 'AFFINE' -A 5 -B 8
