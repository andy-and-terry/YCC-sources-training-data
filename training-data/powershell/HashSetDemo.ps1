$a = [System.Collections.Generic.HashSet[int]]::new(@(1, 2, 3, 4, 5))
$b = [System.Collections.Generic.HashSet[int]]::new(@(4, 5, 6, 7))

"Adding 3 again: $($a.Add(3))"
"Adding 9: $($a.Add(9))"
$a.Remove(9) | Out-Null
"Contains 2: $($a.Contains(2))"

$union = [System.Collections.Generic.HashSet[int]]::new($a)
$union.UnionWith($b)
"Union: $(($union | Sort-Object) -join ' ')"

$inter = [System.Collections.Generic.HashSet[int]]::new($a)
$inter.IntersectWith($b)
"Intersection: $(($inter | Sort-Object) -join ' ')"

$diff = [System.Collections.Generic.HashSet[int]]::new($a)
$diff.ExceptWith($b)
"Difference: $(($diff | Sort-Object) -join ' ')"

$sym = [System.Collections.Generic.HashSet[int]]::new($a)
$sym.SymmetricExceptWith($b)
"Symmetric difference: $(($sym | Sort-Object) -join ' ')"

"Subset: $($inter.IsSubsetOf($a))"
"Overlaps: $($a.Overlaps($b))"

# dedupe a list while preserving first-seen order
$seen = [System.Collections.Generic.HashSet[string]]::new()
"b", "a", "b", "c", "a" | Where-Object { $seen.Add($_) }
