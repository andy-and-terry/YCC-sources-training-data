class Counter {
    [int]$Count = 0
    static [int]$Instances = 0
    Counter() { [Counter]::Instances++ }
    [void] Bump() { $this.Count++ }
}
$c = [Counter]::new()
$c.Bump(); $c.Bump()
"$($c.Count) $([Counter]::Instances)"
