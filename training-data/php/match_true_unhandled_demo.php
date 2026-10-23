<?php

function describe(int $n): string
{
    return match (true) {
        $n < 0 => 'negative',
        $n === 0 => 'zero',
        $n < 10 => 'small',
        default => 'large',
    };
}

foreach ([-5, 0, 7, 100] as $n) {
    echo describe($n) . "\n";
}

try {
    echo match (99) { 1 => 'one' };
} catch (\UnhandledMatchError $e) {
    echo "unhandled\n";
}
