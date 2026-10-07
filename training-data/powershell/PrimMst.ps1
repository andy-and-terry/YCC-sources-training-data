function Get-PrimMst {
    param([int[][]]$Adjacency, [int]$NumNodes)

    $inTree = [bool[]]::new($NumNodes)
    $key = [int[]]::new($NumNodes)
    $parent = [int[]]::new($NumNodes)
    for ($i = 0; $i -lt $NumNodes; $i++) { $key[$i] = [int]::MaxValue; $parent[$i] = -1 }
    $key[0] = 0
    $mst = @()

    for ($count = 0; $count -lt $NumNodes; $count++) {
        $u = -1
        $minKey = [int]::MaxValue
        for ($v = 0; $v -lt $NumNodes; $v++) {
            if (-not $inTree[$v] -and $key[$v] -lt $minKey) { $minKey = $key[$v]; $u = $v }
        }
        $inTree[$u] = $true
        if ($parent[$u] -ge 0) { $mst += "$($parent[$u])-$u : $($Adjacency[$parent[$u]][$u])" }
        for ($v = 0; $v -lt $NumNodes; $v++) {
            if ($Adjacency[$u][$v] -gt 0 -and -not $inTree[$v] -and $Adjacency[$u][$v] -lt $key[$v]) {
                $key[$v] = $Adjacency[$u][$v]
                $parent[$v] = $u
            }
        }
    }
    return $mst
}

$adj = @(
    @(0, 2, 0, 6),
    @(2, 0, 3, 8),
    @(0, 3, 0, 5),
    @(6, 8, 5, 0)
)
Get-PrimMst -Adjacency $adj -NumNodes 4
