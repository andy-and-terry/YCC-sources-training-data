$inventory = @{ pears = 4; apples = 12; plums = 0; kiwis = 7 }

"by name:"
$inventory.GetEnumerator() | Sort-Object Name | ForEach-Object { "  $($_.Name) = $($_.Value)" }

"by value desc:"
$inventory.GetEnumerator() | Sort-Object Value -Descending | ForEach-Object { "  $($_.Name) = $($_.Value)" }

$ordered = [ordered]@{ first = 1; second = 2 }
$ordered['third'] = 3
"ordered keys: $($ordered.Keys -join ', ')"

"in stock: $(($inventory.GetEnumerator() | Where-Object Value -gt 0).Count)"
$inventory.Remove('plums')
"has plums: $($inventory.ContainsKey('plums'))"
"total: $(($inventory.Values | Measure-Object -Sum).Sum)"
