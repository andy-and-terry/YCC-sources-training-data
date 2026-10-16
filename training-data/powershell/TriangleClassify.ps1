function Get-TriangleType {
    param([double]$A, [double]$B, [double]$C)
    $sides = $A, $B, $C | Sort-Object
    if ($sides[0] -le 0 -or ($sides[0] + $sides[1]) -le $sides[2]) {
        return 'not a triangle'
    }
    $distinct = ($sides | Select-Object -Unique).Count
    switch ($distinct) {
        1 { 'equilateral' }
        2 { 'isosceles' }
        default { 'scalene' }
    }
}

'3 3 3', '3 3 5', '3 4 5', '1 2 3' | ForEach-Object {
    $s = $_ -split ' '
    '{0}: {1}' -f $_, (Get-TriangleType $s[0] $s[1] $s[2])
}
