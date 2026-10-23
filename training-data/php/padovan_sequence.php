<?php
// Padovan numbers: P(n) = P(n-2) + P(n-3), P(0)=P(1)=P(2)=1
function padovan(int $count): array {
    $p = [];
    for ($i = 0; $i < $count; $i++) {
        $p[] = $i < 3 ? 1 : $p[$i - 2] + $p[$i - 3];
    }
    return $p;
}

echo implode(" ", padovan(15)), "\n";
