$a = 10, 9, 2, 5, 3, 7, 101, 18
$tails = [System.Collections.Generic.List[int]]::new()
foreach ($x in $a) {
    $i = $tails.BinarySearch($x)
    if ($i -lt 0) { $i = -bnot $i }
    if ($i -eq $tails.Count) { $tails.Add($x) } else { $tails[$i] = $x }
}
$tails.Count
