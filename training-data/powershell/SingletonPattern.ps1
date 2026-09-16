class Counter {
    static [Counter]$Instance
    [int]$Value = 0

    hidden Counter() {}

    static [Counter] GetInstance() {
        if ($null -eq [Counter]::Instance) {
            [Counter]::Instance = [Counter]::new()
        }
        return [Counter]::Instance
    }

    [int] Increment() {
        $this.Value++
        return $this.Value
    }
}

$a = [Counter]::GetInstance()
$b = [Counter]::GetInstance()
$a.Increment() | Out-Null
$a.Increment() | Out-Null
$b.Increment() | Out-Null
$a.Value
$a -eq $b
