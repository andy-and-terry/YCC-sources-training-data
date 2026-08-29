function Get-Transpose {
    param($Matrix)

    $rows = $Matrix.Count
    $cols = $Matrix[0].Count
    $result = @()
    for ($c = 0; $c -lt $cols; $c++) {
        $row = @()
        for ($r = 0; $r -lt $rows; $r++) {
            $row += $Matrix[$r][$c]
        }
        $result += , $row
    }
    return $result
}

$a = @(@(1, 2), @(3, 4))
Get-Transpose -Matrix $a
