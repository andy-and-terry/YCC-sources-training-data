function Protect-RailFence {
    param([string]$Text, [int]$K)
    $cycle = 2 * ($K - 1)
    $rails = 1..$K | ForEach-Object { [System.Text.StringBuilder]::new() }
    for ($i = 0; $i -lt $Text.Length; $i++) {
        $r = $i % $cycle
        if ($r -ge $K) { $r = $cycle - $r }
        [void]$rails[$r].Append($Text[$i])
    }
    ($rails | ForEach-Object { $_.ToString() }) -join ''
}

Protect-RailFence -Text 'WEAREDISCOVERED' -K 3
