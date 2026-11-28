function Get-Jaccard {
    param([int[]]$A, [int[]]$B)
    $sa = [System.Collections.Generic.HashSet[int]]::new($A)
    $union = [System.Collections.Generic.HashSet[int]]::new($A)
    $union.UnionWith($B)
    $sa.IntersectWith($B)
    if ($union.Count -eq 0) { return 1.0 }
    $sa.Count / $union.Count
}

Get-Jaccard -A 1, 2, 3, 4 -B 3, 4, 5
