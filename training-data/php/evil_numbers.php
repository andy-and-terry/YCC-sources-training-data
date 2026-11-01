<?php
// Evil numbers have an even number of 1 bits.
$out = array_filter(range(0, 20), fn($n) => substr_count(decbin($n), "1") % 2 === 0);
echo implode(" ", $out), "\n";
