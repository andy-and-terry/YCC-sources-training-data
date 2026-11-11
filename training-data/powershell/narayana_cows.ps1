# Narayana's cows N(n)=N(n-1)+N(n-3)
$v = [System.Collections.Generic.List[int]]::new()
$v.AddRange([int[]]@(1, 1, 1))
foreach ($i in 3..9) { $v.Add($v[$i - 1] + $v[$i - 3]) }
$v -join ' '
