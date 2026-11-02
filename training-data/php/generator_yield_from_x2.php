<?php
function inner() { yield 1; yield 2; }
function outer() { yield 0; yield from inner(); yield 3; }
foreach (outer() as $v) echo $v, ' ';
echo "\n";
