<?php

const READ = 1 << 0;
const WRITE = 1 << 1;
const EXEC = 1 << 2;

function describe(int $perm): string
{
    $out = [];
    foreach (['READ' => READ, 'WRITE' => WRITE, 'EXEC' => EXEC] as $name => $bit) {
        if ($perm & $bit) {
            $out[] = $name;
        }
    }
    return $out ? implode('|', $out) : 'NONE';
}

$perm = READ | WRITE;
echo describe($perm) . "\n";
$perm |= EXEC;
echo describe($perm) . "\n";
$perm &= ~WRITE;
echo describe($perm) . "\n";
$perm ^= READ;
echo describe($perm) . ' ' . decbin($perm) . "\n";
