function Get-AStarPath {
    param([hashtable]$Adjacency, [hashtable]$Heuristic, [string]$Start, [string]$Goal)

    $openSet = [System.Collections.Generic.List[string]]::new()
    $openSet.Add($Start)
    $gScore = @{ $Start = 0 }
    $cameFrom = @{}

    while ($openSet.Count -gt 0) {
        $current = $openSet[0]
        foreach ($node in $openSet) {
            $fCurrent = $gScore[$current] + $Heuristic[$current]
            $fNode = $gScore[$node] + $Heuristic[$node]
            if ($fNode -lt $fCurrent) { $current = $node }
        }
        if ($current -eq $Goal) {
            $path = [System.Collections.Generic.List[string]]::new()
            $node = $current
            while ($node) {
                $path.Insert(0, $node)
                $node = $cameFrom[$node]
            }
            return $path
        }
        $openSet.Remove($current)
        foreach ($edge in $Adjacency[$current]) {
            $tentative = $gScore[$current] + $edge.Weight
            if (-not $gScore.ContainsKey($edge.To) -or $tentative -lt $gScore[$edge.To]) {
                $cameFrom[$edge.To] = $current
                $gScore[$edge.To] = $tentative
                if (-not $openSet.Contains($edge.To)) { $openSet.Add($edge.To) }
            }
        }
    }
    return $null
}

$adjacency = @{
    'a' = @([PSCustomObject]@{ To = 'b'; Weight = 1 }, [PSCustomObject]@{ To = 'c'; Weight = 4 })
    'b' = @([PSCustomObject]@{ To = 'c'; Weight = 2 }, [PSCustomObject]@{ To = 'd'; Weight = 5 })
    'c' = @([PSCustomObject]@{ To = 'd'; Weight = 1 })
    'd' = @()
}
$heuristic = @{ 'a' = 3; 'b' = 2; 'c' = 1; 'd' = 0 }
Get-AStarPath -Adjacency $adjacency -Heuristic $heuristic -Start 'a' -Goal 'd'
