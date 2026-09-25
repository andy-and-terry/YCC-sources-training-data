<?php
declare(strict_types=1);

enum TriangleKind: string
{
    case Equilateral = 'equilateral';
    case Isosceles = 'isosceles';
    case Scalene = 'scalene';
    case Invalid = 'invalid';
}

function classify(float $a, float $b, float $c): TriangleKind
{
    $s = [$a, $b, $c];
    sort($s);
    if ($s[0] <= 0 || $s[0] + $s[1] <= $s[2]) return TriangleKind::Invalid;
    return match (count(array_unique($s))) {
        1 => TriangleKind::Equilateral,
        2 => TriangleKind::Isosceles,
        default => TriangleKind::Scalene,
    };
}

foreach ([[3, 3, 3], [3, 4, 4], [3, 4, 5], [1, 1, 3]] as $t) {
    echo implode(',', $t), ' ', classify(...$t)->value, PHP_EOL;
}
