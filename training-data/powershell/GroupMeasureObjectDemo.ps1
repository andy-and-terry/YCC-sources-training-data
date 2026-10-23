$orders = @(
    [pscustomobject]@{ Customer = 'A'; Total = 10 }
    [pscustomobject]@{ Customer = 'B'; Total = 25 }
    [pscustomobject]@{ Customer = 'A'; Total = 15 }
)

$orders | Group-Object Customer | ForEach-Object {
    $sum = ($_.Group | Measure-Object Total -Sum).Sum
    '{0}: {1} orders, total {2}' -f $_.Name, $_.Count, $sum
}

$orders | Measure-Object Total -Average -Maximum -Minimum
