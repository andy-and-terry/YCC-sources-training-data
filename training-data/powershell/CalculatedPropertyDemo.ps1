$items = @(
    [PSCustomObject]@{ Product = 'Pen';    Price = 1.25; Qty = 40 }
    [PSCustomObject]@{ Product = 'Book';   Price = 12.5; Qty = 3 }
    [PSCustomObject]@{ Product = 'Folder'; Price = 0.8;  Qty = 100 }
)

$items |
    Select-Object Product,
        @{ Name = 'Total'; Expression = { $_.Price * $_.Qty } },
        @{ Name = 'Tier'; Expression = { if ($_.Price -gt 5) { 'premium' } else { 'basic' } } } |
    Sort-Object Total -Descending |
    Format-Table -AutoSize

$items | Group-Object { $_.Price -gt 5 } | ForEach-Object { "$($_.Name): $($_.Count)" }
