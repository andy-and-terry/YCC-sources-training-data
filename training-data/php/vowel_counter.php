<?php
function countVowels(string $s): array {
    $counts = array_fill_keys(str_split("aeiou"), 0);
    foreach (str_split(strtolower($s)) as $c) {
        if (isset($counts[$c])) $counts[$c]++;
    }
    return $counts;
}

print_r(countVowels("Education is beautiful"));
