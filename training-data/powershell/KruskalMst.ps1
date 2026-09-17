class DisjointSet {
    [int[]]$Parent

    DisjointSet([int]$size) {
        $this.Parent = 0..($size - 1)
    }

    [int] Find([int]$x) {
        while ($this.Parent[$x] -ne $x) {
            $x = $this.Parent[$x]
        }
        return $x
    }

    [bool] Union([int]$a, [int]$b) {
        $rootA = $this.Find($a)
        $rootB = $this.Find($b)
        if ($rootA -eq $rootB) { return $false }
        $this.Parent[$rootA] = $rootB
        return $true
    }
}

function Invoke-Kruskal {
    param([array]$Edges, [int]$NodeCount)

    $sorted = $Edges | Sort-Object { $_[2] }
    $dsu = [DisjointSet]::new($NodeCount)
    $mst = @()

    foreach ($edge in $sorted) {
        $u, $v, $w = $edge
        if ($dsu.Union($u, $v)) {
            $mst += , $edge
        }
    }
    return $mst
}

$edges = @(
    , @(0, 1, 4)
    , @(0, 2, 4)
    , @(1, 2, 2)
    , @(1, 3, 5)
    , @(2, 3, 5)
    , @(2, 4, 11)
    , @(3, 4, 7)
)

$mst = Invoke-Kruskal -Edges $edges -NodeCount 5
foreach ($edge in $mst) {
    "$($edge[0])-$($edge[1]) weight $($edge[2])"
}
