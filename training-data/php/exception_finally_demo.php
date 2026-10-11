<?php

function attempt(bool $fail): string
{
    try {
        if ($fail) {
            throw new RuntimeException('boom');
        }
        return 'ok';
    } catch (RuntimeException $e) {
        return 'recovered';
    } finally {
        echo "cleanup (fail=" . var_export($fail, true) . ")\n";
    }
}

echo attempt(false) . "\n";
echo attempt(true) . "\n";

try {
    try {
        throw new InvalidArgumentException('inner');
    } finally {
        echo "inner finally\n";
    }
} catch (Exception $e) {
    echo 'outer caught ' . $e->getMessage() . "\n";
}
