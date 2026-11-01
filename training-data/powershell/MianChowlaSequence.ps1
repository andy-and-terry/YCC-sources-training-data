# Greedy sequence whose pairwise sums are all distinct.
$seq = [System.Collections.Generic.List[int]]::new()
$sums = [System.Collections.Generic.HashSet[int]]::new()
$cand = 1
while ($seq.Count -lt 8) {
    $fresh = [System.Collections.Generic.HashSet[int]]::new()
    $ok = $true
    foreach ($x in @($seq) + $cand) {
        $s = $x + $cand
        if ($sums.Contains($s) -or -not $fresh.Add($s)) { $ok = $false; break }
    }
    if ($ok) {
        $seq.Add($cand)
        $sums.UnionWith($fresh)
    }
    $cand++
}
$seq -join ' '
