<?php

$fh = fopen('php://memory', 'w+');
fwrite($fh, "line one\nline two\nline three\n");
rewind($fh);

while (($line = fgets($fh)) !== false) {
    echo strtoupper(trim($line)) . "\n";
}

echo 'position: ' . ftell($fh) . "\n";
fseek($fh, 5);
echo fread($fh, 3) . "\n";
fclose($fh);
