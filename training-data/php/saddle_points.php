<?php
declare(strict_types=1);

function saddlePoints(array $m): array
{
    if ($m === []) return [];
    $colMin = array_map(fn($col) => min($col), array_map(null, ...$m));
    $out = [];
    foreach ($m as $r => $row) {
        $rowMax = max($row);
        foreach ($row as $c => $v) {
            if ($v === $rowMax && $v === $colMin[$c]) $out[] = ['row' => $r, 'col' => $c];
        }
    }
    return $out;
}

echo json_encode(saddlePoints([[9, 8, 7], [5, 3, 2], [6, 6, 7]])), PHP_EOL;
