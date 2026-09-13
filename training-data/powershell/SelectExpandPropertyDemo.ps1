$products = @(
    [PSCustomObject]@{ Name = "Widget"; Price = 9.99 }
    [PSCustomObject]@{ Name = "Gadget"; Price = 19.99 }
    [PSCustomObject]@{ Name = "Gizmo"; Price = 14.5 }
)

$names = $products | Select-Object -ExpandProperty Name
$names

$total = ($products | Select-Object -ExpandProperty Price | Measure-Object -Sum).Sum
Write-Output "total: $total"

$products | Select-Object Name, @{ Name = "PriceWithTax"; Expression = { $_.Price * 1.08 } }
