# Perrin sequence P(n)=P(n-2)+P(n-3)
$v = [System.Collections.Generic.List[int]]::new()
$v.AddRange([int[]]@(3, 0, 2))
foreach ($i in 3..9) { $v.Add($v[$i - 2] + $v[$i - 3]) }
$v -join ' '
