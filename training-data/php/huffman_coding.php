<?php

class HuffNode
{
    public ?HuffNode $left = null;
    public ?HuffNode $right = null;

    public function __construct(public int $freq, public ?string $ch = null)
    {
    }
}

function buildCodes(HuffNode $node, string $prefix, array &$codes): void
{
    if ($node->left === null && $node->right === null) {
        $codes[$node->ch] = $prefix === '' ? '0' : $prefix;
        return;
    }
    if ($node->left !== null) {
        buildCodes($node->left, $prefix . '0', $codes);
    }
    if ($node->right !== null) {
        buildCodes($node->right, $prefix . '1', $codes);
    }
}

function huffmanCodes(string $text): array
{
    $freq = [];
    foreach (str_split($text) as $c) {
        $freq[$c] = ($freq[$c] ?? 0) + 1;
    }

    $nodes = [];
    foreach ($freq as $ch => $f) {
        $nodes[] = new HuffNode($f, $ch);
    }

    while (count($nodes) > 1) {
        usort($nodes, fn(HuffNode $a, HuffNode $b) => $a->freq <=> $b->freq);
        $a = array_shift($nodes);
        $b = array_shift($nodes);
        $merged = new HuffNode($a->freq + $b->freq);
        $merged->left = $a;
        $merged->right = $b;
        $nodes[] = $merged;
    }

    $codes = [];
    if ($nodes !== []) {
        buildCodes($nodes[0], '', $codes);
    }
    return $codes;
}

foreach (huffmanCodes('abracadabra') as $c => $code) {
    echo "$c: $code\n";
}
