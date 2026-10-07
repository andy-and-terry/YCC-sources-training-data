function Test-HasCycle {
    param([int[][]]$Adjacency, [int]$NumNodes)

    $state = [int[]]::new($NumNodes) # 0 unvisited, 1 in-progress, 2 done

    function Visit([int]$node) {
        $state[$node] = 1
        for ($neighbor = 0; $neighbor -lt $NumNodes; $neighbor++) {
            if ($Adjacency[$node][$neighbor] -eq 1) {
                if ($state[$neighbor] -eq 1) { return $true }
                if ($state[$neighbor] -eq 0 -and (Visit $neighbor)) { return $true }
            }
        }
        $state[$node] = 2
        return $false
    }

    for ($i = 0; $i -lt $NumNodes; $i++) {
        if ($state[$i] -eq 0 -and (Visit $i)) { return $true }
    }
    return $false
}

$cyclic = @(@(0, 1, 0), @(0, 0, 1), @(1, 0, 0))
$acyclic = @(@(0, 1, 0), @(0, 0, 1), @(0, 0, 0))
Test-HasCycle -Adjacency $cyclic -NumNodes 3
Test-HasCycle -Adjacency $acyclic -NumNodes 3
