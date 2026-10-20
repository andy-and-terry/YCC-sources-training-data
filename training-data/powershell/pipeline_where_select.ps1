Get-ChildItem -File | Where-Object Length -gt 1KB | Sort-Object Length -Descending |
    Select-Object -First 3 Name, Length
