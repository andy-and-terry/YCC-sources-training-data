<?php

function addOne(array &$numbers): void
{
    foreach ($numbers as &$n) {
        $n++;
    }
    unset($n);
}

$a = [1, 2, 3];
$b = &$a;
$b[] = 4;
echo implode(',', $a) . "\n";

addOne($a);
echo implode(',', $a) . "\n";

$copy = $a;
$copy[] = 99;
echo count($a) . ' vs ' . count($copy) . "\n";
