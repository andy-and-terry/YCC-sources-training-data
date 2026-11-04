<?php
function wrapGreedy(string $text, int $width): array {
    $lines = [];
    $line = "";
    foreach (preg_split('/\s+/', trim($text)) as $word) {
        if ($line !== "" && strlen($line) + 1 + strlen($word) > $width) {
            $lines[] = $line;
            $line = $word;
        } else {
            $line = $line === "" ? $word : "$line $word";
        }
    }
    if ($line !== "") $lines[] = $line;
    return $lines;
}

foreach (wrapGreedy("the quick brown fox jumps over the lazy dog", 15) as $l) {
    printf("|%-15s|\n", $l);
}
