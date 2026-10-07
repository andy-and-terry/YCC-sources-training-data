class PriorityQueue {
    [System.Collections.Generic.List[PSCustomObject]]$Items = [System.Collections.Generic.List[PSCustomObject]]::new()

    [void] Enqueue([object]$value, [int]$priority) {
        $this.Items.Add([PSCustomObject]@{ Value = $value; Priority = $priority })
    }

    [object] Dequeue() {
        $best = 0
        for ($i = 1; $i -lt $this.Items.Count; $i++) {
            if ($this.Items[$i].Priority -lt $this.Items[$best].Priority) { $best = $i }
        }
        $item = $this.Items[$best]
        $this.Items.RemoveAt($best)
        return $item.Value
    }

    [bool] IsEmpty() {
        return $this.Items.Count -eq 0
    }
}

$pq = [PriorityQueue]::new()
$pq.Enqueue('low', 5)
$pq.Enqueue('urgent', 1)
$pq.Enqueue('medium', 3)
while (-not $pq.IsEmpty()) { $pq.Dequeue() }
