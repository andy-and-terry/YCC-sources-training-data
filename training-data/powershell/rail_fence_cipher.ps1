function Encode-RailFence([string]$Text, [int]$Rails) {
    $rows = 1..$Rails | ForEach-Object { [Text.StringBuilder]::new() }
    $r = 0; $step = 1
    foreach ($ch in $Text.ToCharArray()) {
        [void]$rows[$r].Append($ch)
        if ($r -eq 0) { $step = 1 } elseif ($r -eq $Rails - 1) { $step = -1 }
        $r += $step
    }
    -join ($rows | ForEach-Object { $_.ToString() })
}

Encode-RailFence 'WEAREDISCOVERED' 3
