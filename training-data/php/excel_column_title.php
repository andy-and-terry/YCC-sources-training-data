<?php
function columnTitle(int $n): string {
    $title = '';
    while ($n > 0) {
        $n--;
        $title = chr(65 + $n % 26) . $title;
        $n = intdiv($n, 26);
    }
    return $title;
}

echo columnTitle(28), ' ', columnTitle(701), "\n"; // AB ZY
