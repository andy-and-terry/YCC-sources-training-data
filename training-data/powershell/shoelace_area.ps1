$x = 0, 4, 4, 0
$y = 0, 0, 3, 3
$s = 0
for ($i = 0; $i -lt $x.Count; $i++) {
    $j = ($i + 1) % $x.Count
    $s += $x[$i] * $y[$j] - $x[$j] * $y[$i]
}
[math]::Abs($s) / 2
