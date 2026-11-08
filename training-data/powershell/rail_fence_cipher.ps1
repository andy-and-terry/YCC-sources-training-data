function Get-RailFence([string]$Text, [int]$Rails) {
    $rows = 0..($Rails - 1) | ForEach-Object { '' }
    $r = 0; $dir = 1
    foreach ($ch in $Text.ToCharArray()) {
        $rows[$r] += $ch
        if ($r -eq 0) { $dir = 1 }
        if ($r -eq $Rails - 1) { $dir = -1 }
        $r += $dir
    }
    -join $rows
}

Get-RailFence 'WEAREDISCOVERED' 3
