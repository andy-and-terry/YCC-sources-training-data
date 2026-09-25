<?php

function justify(array $words, int $width): array
{
    $lines = [];
    $i = 0;
    $n = count($words);
    while ($i < $n) {
        $j = $i;
        $len = 0;
        while ($j < $n && $len + strlen($words[$j]) + ($j - $i) <= $width) {
            $len += strlen($words[$j++]);
        }
        $line = array_slice($words, $i, $j - $i);
        $gaps = count($line) - 1;
        if ($j === $n || $gaps === 0) {
            $lines[] = str_pad(implode(' ', $line), $width);
        } else {
            $spaces = $width - $len;
            $s = '';
            foreach ($line as $k => $w) {
                $s .= $w;
                if ($k < $gaps) {
                    $s .= str_repeat(' ', intdiv($spaces, $gaps) + ($k < $spaces % $gaps ? 1 : 0));
                }
            }
            $lines[] = $s;
        }
        $i = $j;
    }
    return $lines;
}

$text = 'This is an example of text justification that packs words greedily line by line';
foreach (justify(explode(' ', $text), 20) as $l) {
    echo "[$l]", PHP_EOL;
}
