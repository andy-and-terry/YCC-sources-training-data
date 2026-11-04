<?php
function zigzag(string $s, int $rows): string {
    if ($rows === 1 || $rows >= strlen($s)) return $s;
    $lines = array_fill(0, $rows, "");
    $r = 0; $step = 1;
    foreach (str_split($s) as $c) {
        $lines[$r] .= $c;
        if ($r === 0) $step = 1;
        elseif ($r === $rows - 1) $step = -1;
        $r += $step;
    }
    return implode("", $lines);
}

echo zigzag("PAYPALISHIRING", 3), "\n";
