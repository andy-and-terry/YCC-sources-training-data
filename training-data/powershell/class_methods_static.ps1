class Counter {
    static [int]$Total = 0
    [int]$N = 0
    [void] Inc() { $this.N++; [Counter]::Total++ }
}
$c = [Counter]::new(); $c.Inc(); $c.Inc()
"$($c.N) $([Counter]::Total)"
