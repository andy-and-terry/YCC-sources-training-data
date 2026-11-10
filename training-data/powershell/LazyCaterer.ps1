function Get-Pieces([int]$cuts) { [math]::Floor(($cuts * $cuts + $cuts + 2) / 2) }
(0..9 | ForEach-Object { Get-Pieces $_ }) -join ' ' # 1 2 4 7 11 16 22 29 37 46
