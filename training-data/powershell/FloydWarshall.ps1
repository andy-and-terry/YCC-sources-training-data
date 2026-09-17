function Invoke-FloydWarshall {
    param([int[][]]$Graph)

    $n = $Graph.Count
    $dist = New-Object 'int[][]' $n
    for ($i = 0; $i -lt $n; $i++) {
        $dist[$i] = $Graph[$i].Clone()
    }

    for ($k = 0; $k -lt $n; $k++) {
        for ($i = 0; $i -lt $n; $i++) {
            for ($j = 0; $j -lt $n; $j++) {
                if ($dist[$i][$k] + $dist[$k][$j] -lt $dist[$i][$j]) {
                    $dist[$i][$j] = $dist[$i][$k] + $dist[$k][$j]
                }
            }
        }
    }
    return $dist
}

$Inf = [int]::MaxValue / 2
$graph = @(
    @(0, 3, $Inf, 7),
    @(8, 0, 2, $Inf),
    @(5, $Inf, 0, 1),
    @(2, $Inf, $Inf, 0)
)

$result = Invoke-FloydWarshall -Graph $graph
foreach ($row in $result) {
    $row -join ' '
}
