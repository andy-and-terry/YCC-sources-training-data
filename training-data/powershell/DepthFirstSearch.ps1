function Get-DepthFirstOrder {
    param([hashtable]$Graph, [string]$Start)

    $visited = @{}
    $stack = New-Object System.Collections.Generic.Stack[string]
    $stack.Push($Start)
    $order = New-Object System.Collections.ArrayList

    while ($stack.Count -gt 0) {
        $node = $stack.Pop()
        if ($visited.ContainsKey($node)) { continue }
        $visited[$node] = $true
        [void]$order.Add($node)

        $neighbors = $Graph[$node]
        for ($i = $neighbors.Count - 1; $i -ge 0; $i--) {
            if (-not $visited.ContainsKey($neighbors[$i])) {
                $stack.Push($neighbors[$i])
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
Get-DepthFirstOrder -Graph $graph -Start 'a'
