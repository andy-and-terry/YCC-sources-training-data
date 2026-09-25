<?php

enum Color: int
{
    case Red = 0;
    case White = 1;
    case Blue = 2;
}

/** @param list<Color> $a */
function sortFlags(array &$a): void
{
    [$lo, $mid, $hi] = [0, 0, count($a) - 1];
    while ($mid <= $hi) {
        switch ($a[$mid]) {
            case Color::Red:
                [$a[$lo], $a[$mid]] = [$a[$mid], $a[$lo]];
                $lo++;
                $mid++;
                break;
            case Color::White:
                $mid++;
                break;
            case Color::Blue:
                [$a[$mid], $a[$hi]] = [$a[$hi], $a[$mid]];
                $hi--;
                break;
        }
    }
}

$flags = [Color::Blue, Color::Red, Color::White, Color::Blue, Color::Red, Color::White, Color::Red];
sortFlags($flags);
echo implode(' ', array_map(fn (Color $c) => $c->name, $flags)), PHP_EOL;
