<?php

function mergeTwo(array $a, array $b): array
{
    [$i, $j, $out] = [0, 0, []];
    while ($i < count($a) && $j < count($b)) {
        $out[] = $a[$i] <= $b[$j] ? $a[$i++] : $b[$j++];
    }
    return array_merge($out, array_slice($a, $i), array_slice($b, $j));
}

function mergeK(array $lists): array
{
    $heap = new SplMinHeap();
    foreach ($lists as $li => $l) {
        if ($l !== []) {
            $heap->insert([$l[0], $li, 0]);
        }
    }
    $out = [];
    while (!$heap->isEmpty()) {
        [$v, $li, $idx] = $heap->extract();
        $out[] = $v;
        if (isset($lists[$li][$idx + 1])) {
            $heap->insert([$lists[$li][$idx + 1], $li, $idx + 1]);
        }
    }
    return $out;
}

echo implode(' ', mergeTwo([1, 4, 7], [2, 3, 8, 9])), PHP_EOL;
echo implode(' ', mergeK([[1, 5, 9], [2, 6], [], [0, 3, 4, 10]])), PHP_EOL;
