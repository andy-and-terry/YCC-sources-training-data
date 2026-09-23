function Test-Bipartite {
    param([hashtable]$Graph, [string]$Start)

    $color = @{ $Start = 0 }
    $queue = New-Object System.Collections.Generic.Queue[string]
    $queue.Enqueue($Start)

    while ($queue.Count -gt 0) {
        $node = $queue.Dequeue()
        foreach ($neighbor in $Graph[$node]) {
            if (-not $color.ContainsKey($neighbor)) {
                $color[$neighbor] = 1 - $color[$node]
                $queue.Enqueue($neighbor)
            }
            elseif ($color[$neighbor] -eq $color[$node]) {
                return $false
            }
        }
    }
    return $true
}

$evenCycle = @{ a = @('b', 'd'); b = @('a', 'c'); c = @('b', 'd'); d = @('a', 'c') }
$oddCycle = @{ a = @('b', 'c'); b = @('a', 'c'); c = @('a', 'b') }

Test-Bipartite -Graph $evenCycle -Start 'a'
Test-Bipartite -Graph $oddCycle -Start 'a'
