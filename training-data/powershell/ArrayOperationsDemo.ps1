$numbers = 10, 20, 30, 40, 50

$numbers[0]
$numbers[-1]
$numbers[1..3]
$numbers[0, 2, 4]
$numbers.Length

# arrays are fixed size: += builds a new array, ArrayList mutates in place
$numbers += 60
$numbers.Count

$list = [System.Collections.ArrayList]@("a", "b", "c")
[void]$list.Add("d")
$list.Remove("b")
$list.Insert(0, "start")
$list -join ", "

# multi-dimensional and jagged
$grid = @(@(1, 2, 3), @(4, 5, 6))
$grid[1][2]
$matrix = New-Object 'int[,]' 2, 2
$matrix[0, 1] = 9
$matrix[0, 1]

# useful operations
[array]::Reverse($numbers)
$numbers -join " "
($numbers | Sort-Object) -join " "
($numbers | Select-Object -First 2) -join " "
($numbers | Where-Object { $_ -gt 25 }).Count
[array]::IndexOf($numbers, 30)
$numbers.Contains(40)
@(1, 2, 2, 3, 3, 3) | Select-Object -Unique
