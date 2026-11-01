<?php
// Greedy sequence whose pairwise sums are all distinct.
$seq = [];
$sums = [];
for ($cand = 1; count($seq) < 8; $cand++) {
    $fresh = [];
    $ok = true;
    foreach ([...$seq, $cand] as $x) {
        $s = $x + $cand;
        if (isset($sums[$s]) || isset($fresh[$s])) { $ok = false; break; }
        $fresh[$s] = true;
    }
    if ($ok) {
        $seq[] = $cand;
        $sums += $fresh;
    }
}
echo implode(" ", $seq), "\n";
