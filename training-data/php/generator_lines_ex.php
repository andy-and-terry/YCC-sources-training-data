<?php
function lines(string $text): Generator {
    foreach (explode("\n", $text) as $i => $line) {
        yield $i + 1 => trim($line);
    }
}
foreach (lines("a\n b \nc") as $no => $l) {
    echo "$no: $l\n";
}
