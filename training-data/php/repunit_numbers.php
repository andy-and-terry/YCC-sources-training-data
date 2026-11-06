<?php
// Repunits: numbers made only of the digit 1.
function repunits(int $count): Generator {
    $r = 0;
    for ($i = 0; $i < $count; $i++) {
        $r = $r * 10 + 1;
        yield $r;
    }
}

echo implode(" ", iterator_to_array(repunits(5))), "\n";
