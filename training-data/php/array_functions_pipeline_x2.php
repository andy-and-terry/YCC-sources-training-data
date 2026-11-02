<?php
$r = array_sum(array_map(fn($x) => $x ** 2, array_filter(range(1, 10), fn($x) => $x % 2)));
echo $r, "\n";
