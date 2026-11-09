<?php
function evens(int $max) {
    for ($i = 0; $i <= $max; $i += 2) yield $i;
}
foreach (evens(10) as $e) echo $e, " ";
echo "\n";
