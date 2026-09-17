function Invoke-BellmanFord {
    param([array]$Edges, [int]$NodeCount, [int]$Source)

    $dist = @{}
    for ($i = 0; $i -lt $NodeCount; $i++) { $dist[$i] = [int]::MaxValue }
    $dist[$Source] = 0

    for ($i = 0; $i -lt $NodeCount - 1; $i++) {
        foreach ($edge in $Edges) {
            $u, $v, $w = $edge
            if ($dist[$u] -ne [int]::MaxValue -and $dist[$u] + $w -lt $dist[$v]) {
                $dist[$v] = $dist[$u] + $w
            }
        }
    }

    foreach ($edge in $Edges) {
        $u, $v, $w = $edge
        if ($dist[$u] -ne [int]::MaxValue -and $dist[$u] + $w -lt $dist[$v]) {
            Write-Output 'negative cycle detected'
            return $null
        }
    }
    return $dist
}

$edges = @(
    , @(0, 1, 6)
    , @(0, 2, 7)
    , @(1, 2, 8)
    , @(1, 3, 5)
    , @(1, 4, -4)
    , @(2, 3, -3)
    , @(2, 4, 9)
    , @(3, 1, -2)
)

Invoke-BellmanFord -Edges $edges -NodeCount 5 -Source 0
