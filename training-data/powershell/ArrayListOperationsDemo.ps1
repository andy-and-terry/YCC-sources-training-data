$list = [System.Collections.Generic.List[int]]::new()
foreach ($n in 5, 3, 8) { $list.Add($n) }
$list.AddRange([int[]](1, 9))

"list: $($list -join ',')"
"count: $($list.Count)"

$list.Sort()
"sorted: $($list -join ',')"

$list.Reverse()
"reversed: $($list -join ',')"

$list.Remove(8) | Out-Null
$list.Insert(1, 100)
"after edits: $($list -join ',')"
"index of 100: $($list.IndexOf(100))"
"contains 3: $($list.Contains(3))"

$list.RemoveAll({ param($x) $x -gt 50 }) | Out-Null
"after removeall: $($list -join ',')"

$fixed = @(1, 2, 3)
$fixed += 4
"array grew to $($fixed.Length)"
