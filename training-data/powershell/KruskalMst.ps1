function Find-Root {
    param([hashtable]$Parent, [string]$Node)

    if ($Parent[$Node] -eq $Node) { return $Node }
    return Find-Root -Parent $Parent -Node $Parent[$Node]
}

function Get-KruskalMst {
    param([array]$Edges, [string[]]$Nodes)

    $parent = @{}
    foreach ($n in $Nodes) { $parent[$n] = $n }

    $sortedEdges = $Edges | Sort-Object -Property Weight
    $mst = New-Object System.Collections.ArrayList

    foreach ($edge in $sortedEdges) {
        $rootA = Find-Root -Parent $parent -Node $edge.From
        $rootB = Find-Root -Parent $parent -Node $edge.To
        if ($rootA -ne $rootB) {
            $parent[$rootA] = $rootB
            [void]$mst.Add($edge)
        }
    }
    return $mst
}

$edges = @(
    [PSCustomObject]@{ From = 'a'; To = 'b'; Weight = 1 }
    [PSCustomObject]@{ From = 'b'; To = 'c'; Weight = 3 }
    [PSCustomObject]@{ From = 'a'; To = 'c'; Weight = 2 }
    [PSCustomObject]@{ From = 'c'; To = 'd'; Weight = 4 }
)
$nodes = @('a', 'b', 'c', 'd')
Get-KruskalMst -Edges $edges -Nodes $nodes | ForEach-Object { "$($_.From)-$($_.To): $($_.Weight)" }
