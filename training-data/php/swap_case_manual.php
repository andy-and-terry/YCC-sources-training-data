<?php
function swapCase(string $s): string {
    $out = '';
    foreach (str_split($s) as $c) {
        $out .= ctype_upper($c) ? strtolower($c) : strtoupper($c);
    }
    return $out;
}

echo swapCase("Hello World 42"), PHP_EOL;
