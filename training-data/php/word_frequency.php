<?php

function wordFrequency(string $text): array
{
    $words = preg_split('/[^a-zA-Z0-9\']+/', strtolower($text), -1, PREG_SPLIT_NO_EMPTY);
    $freq = array_count_values($words);
    arsort($freq);
    return $freq;
}

$text = "the quick brown fox jumps over the lazy dog. The dog barks at the fox.";
foreach (wordFrequency($text) as $word => $count) {
    echo "$word: $count\n";
}
