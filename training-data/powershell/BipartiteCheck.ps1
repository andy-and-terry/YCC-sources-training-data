function Test-Bipartite {
    param([int[][]]$Adjacency, [int]$NumNodes)

    $color = [int[]]::new($NumNodes)
    for ($start = 0; $start -lt $NumNodes; $start++) {
        if ($color[$start] -ne 0) { continue }
        $color[$start] = 1
        $queue = [System.Collections.Generic.Queue[int]]::new()
        $queue.Enqueue($start)
        while ($queue.Count -gt 0) {
            $node = $queue.Dequeue()
            for ($neighbor = 0; $neighbor -lt $NumNodes; $neighbor++) {
                if ($Adjacency[$node][$neighbor] -eq 1) {
                    if ($color[$neighbor] -eq 0) {
                        $color[$neighbor] = -$color[$node]
                        $queue.Enqueue($neighbor)
                    } elseif ($color[$neighbor] -eq $color[$node]) {
                        return $false
                    }
                }
            }
        }
    }
    return $true
}

$adj = @(
    @(0, 1, 0, 1),
    @(1, 0, 1, 0),
    @(0, 1, 0, 1),
    @(1, 0, 1, 0)
)
Test-Bipartite -Adjacency $adj -NumNodes 4
