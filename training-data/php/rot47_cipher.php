<?php
function rot47(string $s): string {
    return preg_replace_callback('/[!-~]/', fn($m) => chr(33 + (ord($m[0]) - 33 + 47) % 94), $s);
}

$e = rot47("Hello, World!");
echo $e, " ", rot47($e), "\n";
