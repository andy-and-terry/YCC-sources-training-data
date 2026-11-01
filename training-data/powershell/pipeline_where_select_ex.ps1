1..10 | Where-Object { $_ % 2 -eq 0 } | ForEach-Object { $_ * $_ } | Write-Output
Get-ChildItem -Path . -File | Sort-Object Length -Descending | Select-Object -First 3 Name, Length
