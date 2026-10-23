$files = @(
    [pscustomobject]@{ Name = 'a.log'; Size = 300 }
    [pscustomobject]@{ Name = 'b.txt'; Size = 120 }
    [pscustomobject]@{ Name = 'c.log'; Size = 900 }
)

$files |
    Where-Object { $_.Name -like '*.log' } |
    Sort-Object Size -Descending |
    Select-Object -First 1 -Property Name, Size

$files | Select-Object -ExpandProperty Name
