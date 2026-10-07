<?php

function wrap(string $text, int $width): array
{
    $lines = [];
    $line = '';
    foreach (preg_split('/\s+/', trim($text)) as $word) {
        while (strlen($word) > $width) { // hard-break very long words
            if ($line !== '') {
                $lines[] = $line;
                $line = '';
            }
            $lines[] = substr($word, 0, $width);
            $word = substr($word, $width);
        }
        if ($line === '') {
            $line = $word;
        } elseif (strlen($line) + 1 + strlen($word) <= $width) {
            $line .= ' ' . $word;
        } else {
            $lines[] = $line;
            $line = $word;
        }
    }
    if ($line !== '') {
        $lines[] = $line;
    }
    return $lines;
}

$text = 'The quick brown fox jumps over the lazy dog and keeps running supercalifragilisticexpialidocious';
foreach (wrap($text, 16) as $l) {
    echo '|', str_pad($l, 16), '|', PHP_EOL;
}
echo wordwrap($text, 16, "\n", true) === implode("\n", wrap($text, 16)) ? 'matches wordwrap()' : 'differs from wordwrap()', PHP_EOL;
