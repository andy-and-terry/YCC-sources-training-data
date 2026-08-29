function Get-Dijkstra {
    param($Graph, [string]$Source)

    $dist = @{}
    foreach ($node in $Graph.Keys) { $dist[$node] = [int]::MaxValue }
    $dist[$Source] = 0
    $visited = @{}

    for ($i = 0; $i -lt $Graph.Count; $i++) {
        $bestNode = $null
        $bestDist = [int]::MaxValue
        foreach ($node in $dist.Keys) {
            if (-not $visited.ContainsKey($node) -and $dist[$node] -lt $bestDist) {
                $bestNode = $node
                $bestDist = $dist[$node]
            }
        }
        if ($null -eq $bestNode) { break }
        $visited[$bestNode] = $true
        foreach ($edge in $Graph[$bestNode]) {
            $neighbor = $edge[0]
            $weight = $edge[1]
            $newDist = $bestDist + $weight
            if ($newDist -lt $dist[$neighbor]) { $dist[$neighbor] = $newDist }
        }
    }
    return $dist
}

$graph = @{
    a = @(@('b', 1), @('c', 4))
    b = @(@('c', 2), @('d', 5))
    c = @(@('d', 1))
    d = @()
}
Get-Dijkstra -Graph $graph -Source 'a'
