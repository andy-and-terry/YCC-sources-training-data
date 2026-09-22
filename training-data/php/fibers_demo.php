<?php

$fiber = new Fiber(function (int $start): int {
    echo "fiber started with {$start}\n";
    $resumedWith = Fiber::suspend($start + 1);
    echo "fiber resumed with {$resumedWith}\n";
    return $resumedWith * 2;
});

$suspendedValue = $fiber->start(10);
echo "main got suspended value: {$suspendedValue}\n";

$fiber->resume(100);
echo "fiber finished, return value: {$fiber->getReturn()}\n";
