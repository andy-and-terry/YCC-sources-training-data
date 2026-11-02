class Counter {
    [int]$Count = 0
    [void] Inc() { $this.Count++ }
}
$c = [Counter]::new()
$c.Inc(); $c.Inc()
$c.Count
