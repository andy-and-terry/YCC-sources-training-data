$list = [System.Collections.Generic.List[int]]::new()
1..5 | ForEach-Object { $list.Add($_ * 2) }
$list.Insert(0, 100)
$list.Remove(6) | Out-Null
"Items: $($list -join ', ')"
"Count: $($list.Count)"
"Contains 8: $($list.Contains(8))"
$list.Sort()
"Sorted: $($list -join ', ')"
$list.Reverse()
"Reversed: $($list -join ', ')"
