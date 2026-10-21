<?php
// Thue-Morse: t(n) is the parity of the number of 1 bits in n
$out = "";
for ($n = 0; $n < 32; $n++) {
    $out .= substr_count(decbin($n), "1") % 2;
}
echo $out, "\n";
