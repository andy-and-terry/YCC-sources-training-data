<?php
function triangular(int $count): Generator {
    $sum = 0;
    for ($n = 1; $n <= $count; $n++) {
        yield $sum += $n;
    }
}

echo implode(" ", iterator_to_array(triangular(10), false)), PHP_EOL;
