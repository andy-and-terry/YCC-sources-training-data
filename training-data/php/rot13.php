<?php

function rot(string $s, int $k): string
{
    return preg_replace_callback('/[a-z]/i', function ($m) use ($k) {
        $base = ctype_upper($m[0]) ? 65 : 97;
        return chr((ord($m[0]) - $base + $k % 26 + 26) % 26 + $base);
    }, $s);
}

$msg = 'Why did the chicken cross the road?';
$enc = rot($msg, 13);
echo $enc, PHP_EOL;
var_dump(rot($enc, 13) === $msg, $enc === str_rot13($msg));
