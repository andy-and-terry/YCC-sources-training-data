function Get-BreadthFirstOrder {
    param([hashtable]$Graph, [string]$Start)

    $visited = @{ $Start = $true }
    $queue = New-Object System.Collections.Generic.Queue[string]
    $queue.Enqueue($Start)
    $order = New-Object System.Collections.ArrayList

    while ($queue.Count -gt 0) {
        $node = $queue.Dequeue()
        [void]$order.Add($node)
        foreach ($neighbor in $Graph[$node]) {
            if (-not $visited.ContainsKey($neighbor)) {
                $visited[$neighbor] = $true
                $queue.Enqueue($neighbor)
            }
        }
    }
    return $order
}

$graph = @{
    a = @('b', 'c')
    b = @('a', 'd')
    c = @('a', 'd')
    d = @('b', 'c', 'e')
    e = @('d')
}
Get-BreadthFirstOrder -Graph $graph -Start 'a'
