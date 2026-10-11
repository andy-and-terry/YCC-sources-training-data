<?php

$pairs = [['kitten', 'sitting'], ['flaw', 'lawn'], ['php', 'php']];

foreach ($pairs as [$a, $b]) {
    $lev = levenshtein($a, $b);
    similar_text($a, $b, $percent);
    printf("%-8s %-8s lev=%d similar=%.1f%% soundex=%s/%s\n",
        $a, $b, $lev, $percent, soundex($a), soundex($b));
}

echo metaphone('Thompson') . "\n";
