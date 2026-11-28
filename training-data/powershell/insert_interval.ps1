function Add-Interval {
    param([object[]]$Intervals, [int[]]$New)
    $lo = $New[0]; $hi = $New[1]
    $out = [System.Collections.Generic.List[object]]::new()
    $placed = $false
    foreach ($iv in $Intervals) {
        if ($iv[1] -lt $lo) { $out.Add($iv) }
        elseif ($iv[0] -gt $hi) {
            if (-not $placed) { $out.Add(@($lo, $hi)); $placed = $true }
            $out.Add($iv)
        }
        else {
            $lo = [Math]::Min($lo, $iv[0])
            $hi = [Math]::Max($hi, $iv[1])
        }
    }
    if (-not $placed) { $out.Add(@($lo, $hi)) }
    $out
}

Add-Interval -Intervals @(@(1, 3), @(6, 9)) -New 2, 5 | ForEach-Object { "[$($_ -join ',')]" }  # [1,5] [6,9]
