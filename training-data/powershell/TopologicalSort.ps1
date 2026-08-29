function Visit-Node {
    param($Node, $Graph, [System.Collections.Generic.HashSet[string]]$Visited, [System.Collections.ArrayList]$Order)

    if ($Visited.Contains($Node)) { return }
    [void]$Visited.Add($Node)
    foreach ($dep in $Graph[$Node]) {
        Visit-Node $dep $Graph $Visited $Order
    }
    [void]$Order.Add($Node)
}

function Get-TopoSort {
    param($Graph)

    $visited = New-Object 'System.Collections.Generic.HashSet[string]'
    $order = New-Object System.Collections.ArrayList
    foreach ($node in $Graph.Keys) {
        Visit-Node $node $Graph $visited $order
    }
    return $order
}

$graph = @{ a = @('b', 'c'); b = @('d'); c = @('d'); d = @() }
Get-TopoSort -Graph $graph
