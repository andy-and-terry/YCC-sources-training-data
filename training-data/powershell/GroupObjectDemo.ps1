$items = @(
    [pscustomobject]@{ Kind = 'fruit'; Name = 'apple'; Qty = 3 }
    [pscustomobject]@{ Kind = 'veg'; Name = 'kale'; Qty = 2 }
    [pscustomobject]@{ Kind = 'fruit'; Name = 'pear'; Qty = 5 }
)
$items | Group-Object Kind | ForEach-Object {
    $total = ($_.Group | Measure-Object Qty -Sum).Sum
    '{0}: {1} items, qty {2}' -f $_.Name, $_.Count, $total
}
