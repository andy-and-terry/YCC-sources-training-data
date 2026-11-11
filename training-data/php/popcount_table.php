<?php
// Population count (number of set bits) for 0..15
function bits(int $n): int {
    return substr_count(decbin($n), '1');
}

echo implode(' ', array_map('bits', range(0, 15))), "\n";
