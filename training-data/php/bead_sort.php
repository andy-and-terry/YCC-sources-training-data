<?php
// Bead (gravity) sort.
function beadSort(array $nums): array {
    $cols = array_fill(0, max($nums), 0);
    foreach ($nums as $n) for ($i = 0; $i < $n; $i++) $cols[$i]++;
    $rows = [];
    for ($r = 0; $r < count($nums); $r++) $rows[] = count(array_filter($cols, fn($c) => $c > $r));
    return array_reverse($rows);
}
echo implode(",", beadSort([5, 3, 1, 4, 2])), "\n";
