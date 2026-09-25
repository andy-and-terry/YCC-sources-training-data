<?php
declare(strict_types=1);

function abbreviate(string $phrase): string
{
    preg_match_all("/[A-Za-z][A-Za-z']*/", $phrase, $m);
    return strtoupper(implode('', array_map(fn($w) => $w[0], $m[0])));
}

echo abbreviate('Portable Network Graphics'), PHP_EOL;
echo abbreviate('Complementary metal-oxide semiconductor'), PHP_EOL;
