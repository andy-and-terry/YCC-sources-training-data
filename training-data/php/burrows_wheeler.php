<?php
function bwt(string $s): string {
    $n = strlen($s);
    $rots = [];
    for ($i = 0; $i < $n; $i++) $rots[] = substr($s, $i) . substr($s, 0, $i);
    sort($rots, SORT_STRING);
    return implode('', array_map(fn($r) => $r[$n - 1], $rots));
}
echo bwt('banana$'), "\n";
