function Get-PascalTriangle {
    param([int]$Rows)
    $triangle = @()
    for ($r = 0; $r -lt $Rows; $r++) {
        $row = @(1) * ($r + 1)
        for ($c = 1; $c -lt $r; $c++) {
            $row[$c] = $triangle[$r - 1][$c - 1] + $triangle[$r - 1][$c]
        }
        $triangle += , $row
    }
    $triangle
}

foreach ($row in Get-PascalTriangle -Rows 6) {
    $row -join ' '
}
