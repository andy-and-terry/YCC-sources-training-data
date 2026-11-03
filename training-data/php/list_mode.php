<?php
function modes(array $items): array {
    $counts = array_count_values($items);
    $top = max($counts);
    $result = array_keys(array_filter($counts, fn($c) => $c === $top));
    sort($result);
    return $result;
}

echo implode(",", modes([1, 2, 2, 3, 3, 4])), PHP_EOL;
