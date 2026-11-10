<?php
$limit = 80;
$composite = array_fill(0, $limit + 1, false);
for ($i = 2; $i * $i <= $limit; $i++) {
    if (!$composite[$i]) for ($j = $i * $i; $j <= $limit; $j += $i) $composite[$j] = true;
}
$pairs = [];
for ($p = 3; $p + 2 <= $limit; $p++) {
    if (!$composite[$p] && !$composite[$p + 2]) $pairs[] = "($p," . ($p + 2) . ")";
}
echo implode(" ", $pairs), "\n"; // (3,5) (5,7) (11,13) (17,19) (29,31) (41,43) (59,61) (71,73)
