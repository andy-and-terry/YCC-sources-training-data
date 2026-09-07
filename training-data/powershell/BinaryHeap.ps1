class MinHeap {
    [System.Collections.Generic.List[int]]$Data = [System.Collections.Generic.List[int]]::new()

    [void] Push([int]$value) {
        $this.Data.Add($value)
        $i = $this.Data.Count - 1
        while ($i -gt 0) {
            $parent = [math]::Floor(($i - 1) / 2)
            if ($this.Data[$parent] -le $this.Data[$i]) { break }
            $tmp = $this.Data[$parent]
            $this.Data[$parent] = $this.Data[$i]
            $this.Data[$i] = $tmp
            $i = $parent
        }
    }

    [int] Pop() {
        $top = $this.Data[0]
        $last = $this.Data[$this.Data.Count - 1]
        $this.Data.RemoveAt($this.Data.Count - 1)
        if ($this.Data.Count -gt 0) {
            $this.Data[0] = $last
            $i = 0
            while ($true) {
                $left = 2 * $i + 1
                $right = 2 * $i + 2
                $smallest = $i
                if ($left -lt $this.Data.Count -and $this.Data[$left] -lt $this.Data[$smallest]) { $smallest = $left }
                if ($right -lt $this.Data.Count -and $this.Data[$right] -lt $this.Data[$smallest]) { $smallest = $right }
                if ($smallest -eq $i) { break }
                $tmp = $this.Data[$smallest]
                $this.Data[$smallest] = $this.Data[$i]
                $this.Data[$i] = $tmp
                $i = $smallest
            }
        }
        return $top
    }
}

$heap = [MinHeap]::new()
foreach ($v in @(5, 3, 8, 1, 9, 2)) { $heap.Push($v) }
$sorted = @()
while ($heap.Data.Count -gt 0) { $sorted += $heap.Pop() }
$sorted -join ","
