<?php
function jaccard(array $a, array $b): float {
    $union = count(array_unique(array_merge($a, $b)));
    $inter = count(array_intersect(array_unique($a), array_unique($b)));
    return $union === 0 ? 1.0 : $inter / $union;
}

echo jaccard([1, 2, 3, 4], [3, 4, 5]), "\n";
