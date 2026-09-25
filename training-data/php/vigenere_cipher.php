<?php

function vigenere(string $text, string $key, bool $decrypt = false): string
{
    $key = strtolower(preg_replace('/[^a-z]/i', '', $key));
    $k = 0;
    return preg_replace_callback('/[a-z]/i', function ($m) use ($key, &$k, $decrypt) {
        $base = ctype_upper($m[0]) ? 65 : 97;
        $shift = ord($key[$k++ % strlen($key)]) - 97;
        $shift = $decrypt ? 26 - $shift : $shift;
        return chr((ord($m[0]) - $base + $shift) % 26 + $base);
    }, $text);
}

$enc = vigenere('Attack at dawn!', 'LEMON');
echo $enc, ' -> ', vigenere($enc, 'LEMON', true), PHP_EOL;
