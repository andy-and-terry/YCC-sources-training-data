class Counter {
    [int]$Value = 0
    [void] Increment() { $this.Value++ }
}
$c = [Counter]::new()
$c.Increment(); $c.Increment()
$c.Value
