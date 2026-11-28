<?php
function bitap(string $text, string $pat): int {
    $masks = [];
    for ($i = 0; $i < strlen($pat); $i++) $masks[$pat[$i]] = ($masks[$pat[$i]] ?? 0) | (1 << $i);
    $goal = 1 << (strlen($pat) - 1);
    $state = 0;
    for ($i = 0; $i < strlen($text); $i++) {
        $state = (($state << 1) | 1) & ($masks[$text[$i]] ?? 0);
        if ($state & $goal) return $i - strlen($pat) + 1;
    }
    return -1;
}
echo bitap("the quick brown fox", "brown"), "\n";
