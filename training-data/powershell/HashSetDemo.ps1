$a = [System.Collections.Generic.HashSet[int]]::new([int[]](1, 2, 3, 4, 5))
$b = [System.Collections.Generic.HashSet[int]]::new([int[]](4, 5, 6, 7))

"Add 3 again: $($a.Add(3))"
"Add 9: $($a.Add(9))"
[void]$a.Remove(9)

$union = [System.Collections.Generic.HashSet[int]]::new($a)
$union.UnionWith($b)
"Union: $(($union | Sort-Object) -join ' ')"

$inter = [System.Collections.Generic.HashSet[int]]::new($a)
$inter.IntersectWith($b)
"Intersection: $(($inter | Sort-Object) -join ' ')"

$diff = [System.Collections.Generic.HashSet[int]]::new($a)
$diff.ExceptWith($b)
"Difference: $(($diff | Sort-Object) -join ' ')"

"Subset: $($inter.IsSubsetOf($a))"
