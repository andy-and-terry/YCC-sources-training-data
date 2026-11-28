$a = 5, 3, 8, 1, 9, 2, 7, 4, 6, 0, 3, 5
$bs = 4
$blk = for ($b = 0; $b -lt $a.Count; $b += $bs) { ($a[$b..($b + $bs - 1)] | Measure-Object -Sum).Sum }
$l = 2; $r = 9; $s = 0; $i = $l
while ($i -le $r) {
    if ($i % $bs -eq 0 -and $i + $bs - 1 -le $r) { $s += $blk[[math]::Floor($i / $bs)]; $i += $bs }
    else { $s += $a[$i]; $i++ }
}
$s
