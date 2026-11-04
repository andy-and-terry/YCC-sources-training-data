class MinStack {
    [System.Collections.Generic.List[int]] $Vals = [System.Collections.Generic.List[int]]::new()
    [System.Collections.Generic.List[int]] $Mins = [System.Collections.Generic.List[int]]::new()

    [void] Push([int]$x) {
        $m = if ($this.Mins.Count) { [Math]::Min($x, $this.Mins[-1]) } else { $x }
        $this.Vals.Add($x); $this.Mins.Add($m)
    }
    [int] Pop() {
        $v = $this.Vals[-1]
        $this.Vals.RemoveAt($this.Vals.Count - 1); $this.Mins.RemoveAt($this.Mins.Count - 1)
        return $v
    }
    [int] Min() { return $this.Mins[-1] }
}

$s = [MinStack]::new()
5, 3, 7, 2 | ForEach-Object { $s.Push($_) }
$s.Min()
[void]$s.Pop()
$s.Min()
