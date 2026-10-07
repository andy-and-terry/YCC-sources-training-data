function Get-FloydWarshall {
    param($Matrix)

    $n = $Matrix.Count
    $dist = New-Object 'object[,]' $n, $n
    for ($i = 0; $i -lt $n; $i++) {
        for ($j = 0; $j -lt $n; $j++) {
            $dist[$i, $j] = $Matrix[$i][$j]
        }
    }

    for ($k = 0; $k -lt $n; $k++) {
        for ($i = 0; $i -lt $n; $i++) {
            for ($j = 0; $j -lt $n; $j++) {
                if ($dist[$i, $k] + $dist[$k, $j] -lt $dist[$i, $j]) {
                    $dist[$i, $j] = $dist[$i, $k] + $dist[$k, $j]
                }
            }
        }
    }
    return $dist
}

$inf = [int]::MaxValue / 2
$matrix = @(
    @(0, 3, $inf, 7),
    @(8, 0, 2, $inf),
    @(5, $inf, 0, 1),
    @(2, $inf, $inf, 0)
)
$result = Get-FloydWarshall -Matrix $matrix
for ($i = 0; $i -lt 4; $i++) {
    (0..3 | ForEach-Object { $result[$i, $_] }) -join ' '
}
