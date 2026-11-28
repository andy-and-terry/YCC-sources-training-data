<?php
function escape(float $cr, float $ci): int {
    $zr = $zi = 0.0;
    for ($n = 0; $n < 30; $n++) {
        if ($zr * $zr + $zi * $zi >= 4) return $n;
        [$zr, $zi] = [$zr * $zr - $zi * $zi + $cr, 2 * $zr * $zi + $ci];
    }
    return 30;
}

for ($yi = -5; $yi <= 5; $yi++) {
    $line = '';
    for ($xi = -40; $xi <= 12; $xi++) $line .= escape($xi / 20, $yi / 5) === 30 ? '#' : '.';
    echo $line, "\n";
}
