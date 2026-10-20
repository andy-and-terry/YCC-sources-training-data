<?php
$orders = [['id' => 1, 'total' => 40], ['id' => 2, 'total' => 120], ['id' => 3, 'total' => 75]];
$big = array_filter($orders, fn($o) => $o['total'] > 50);
$ids = array_map(fn($o) => $o['id'], $big);
$sum = array_reduce($big, fn($c, $o) => $c + $o['total'], 0);
echo implode(',', $ids), " $sum\n";
