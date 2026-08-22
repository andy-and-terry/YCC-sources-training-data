<?php

function fibonacci(int $limit): Generator
{
    [$a, $b] = [0, 1];
    for ($i = 0; $i < $limit; $i++) {
        yield $a;
        [$a, $b] = [$b, $a + $b];
    }
}

foreach (fibonacci(8) as $n) {
    echo $n . ' ';
}
echo "\n";
