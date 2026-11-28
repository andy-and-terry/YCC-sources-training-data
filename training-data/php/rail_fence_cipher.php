<?php
function encode(string $text, int $rails): string {
    $rows = array_fill(0, $rails, '');
    $r = 0;
    $step = 1;
    foreach (str_split($text) as $ch) {
        $rows[$r] .= $ch;
        if ($r === 0) $step = 1;
        elseif ($r === $rails - 1) $step = -1;
        $r += $step;
    }
    return implode('', $rows);
}

echo encode("WEAREDISCOVERED", 3), "\n";
