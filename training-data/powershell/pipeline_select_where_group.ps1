Get-ChildItem -File |
    Where-Object Length -gt 1KB |
    Group-Object Extension |
    Select-Object Name, Count |
    Sort-Object Count -Descending
