function Get-Transpose {
    param([int[][]]$Matrix)
    $rows = $Matrix.Length
    $cols = $Matrix[0].Length
    $result = New-Object 'int[][]' $cols
    for ($c = 0; $c -lt $cols; $c++) {
        $result[$c] = New-Object 'int[]' $rows
        for ($r = 0; $r -lt $rows; $r++) {
            $result[$c][$r] = $Matrix[$r][$c]
        }
    }
    return , $result
}

$m = @(@(1, 2, 3), @(4, 5, 6))
foreach ($row in (Get-Transpose -Matrix $m)) {
    $row -join ' '
}
