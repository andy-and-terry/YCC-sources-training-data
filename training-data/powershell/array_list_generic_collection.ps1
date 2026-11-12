$l = [System.Collections.Generic.List[int]]::new()
1..5 | ForEach-Object { $l.Add($_ * 2) }
$l.Remove(4) | Out-Null
$l -join ','
