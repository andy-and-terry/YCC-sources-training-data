function Get-KosarajuScc {
    param([int[][]]$Adjacency, [int]$NumNodes)

    $visited = [bool[]]::new($NumNodes)
    $order = [System.Collections.Generic.List[int]]::new()

    function FillOrder([int]$node) {
        $visited[$node] = $true
        for ($n = 0; $n -lt $NumNodes; $n++) {
            if ($Adjacency[$node][$n] -eq 1 -and -not $visited[$n]) { FillOrder $n }
        }
        $order.Add($node)
    }
    for ($i = 0; $i -lt $NumNodes; $i++) { if (-not $visited[$i]) { FillOrder $i } }

    $transposed = @()
    for ($i = 0; $i -lt $NumNodes; $i++) {
        $row = [int[]]::new($NumNodes)
        for ($j = 0; $j -lt $NumNodes; $j++) { $row[$j] = $Adjacency[$j][$i] }
        $transposed += ,$row
    }

    $visited = [bool[]]::new($NumNodes)
    $components = @()
    function Collect([int]$node, [System.Collections.Generic.List[int]]$component) {
        $visited[$node] = $true
        $component.Add($node)
        for ($n = 0; $n -lt $NumNodes; $n++) {
            if ($transposed[$node][$n] -eq 1 -and -not $visited[$n]) { Collect $n $component }
        }
    }
    for ($i = $order.Count - 1; $i -ge 0; $i--) {
        $node = $order[$i]
        if (-not $visited[$node]) {
            $component = [System.Collections.Generic.List[int]]::new()
            Collect $node $component
            $components += ,(@($component))
        }
    }
    return $components
}

$adj = @(
    @(0, 1, 0, 0, 0),
    @(0, 0, 1, 0, 0),
    @(1, 0, 0, 1, 0),
    @(0, 0, 0, 0, 1),
    @(0, 0, 0, 0, 0)
)
Get-KosarajuScc -Adjacency $adj -NumNodes 5
