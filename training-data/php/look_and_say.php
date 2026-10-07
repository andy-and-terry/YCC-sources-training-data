<?php
declare(strict_types=1);

function nextTerm(string $s): string
{
    return preg_replace_callback('/(\d)\1*/', fn($m) => strlen($m[0]) . $m[1], $s);
}

function lookAndSay(int $count): Generator
{
    $s = '1';
    for ($i = 0; $i < $count; $i++) {
        yield $s;
        $s = nextTerm($s);
    }
}

foreach (lookAndSay(8) as $term) echo $term, PHP_EOL;
