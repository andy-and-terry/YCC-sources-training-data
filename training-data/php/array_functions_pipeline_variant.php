<?php
$orders = [['p' => 'a', 'q' => 2], ['p' => 'b', 'q' => 5], ['p' => 'a', 'q' => 3]];
$tot = array_reduce($orders, function ($c, $o) {
    $c[$o['p']] = ($c[$o['p']] ?? 0) + $o['q'];
    return $c;
}, []);
arsort($tot);
print_r($tot);
