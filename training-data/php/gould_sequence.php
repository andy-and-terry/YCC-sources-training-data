<?php
function gould(int $n): int {
    return 2 ** substr_count(decbin($n), '1');
}

echo implode(' ', array_map('gould', range(0, 15))), "\n";
