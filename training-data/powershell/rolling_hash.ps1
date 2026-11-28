$s = 'abcabc'; $k = 3; $B = 31; $M = 1000003
for ($i = 0; $i -le $s.Length - $k; $i++) {
    $h = 0
    foreach ($c in $s.Substring($i, $k).ToCharArray()) { $h = ($h * $B + [int]$c) % $M }
    "$i $h"
}
