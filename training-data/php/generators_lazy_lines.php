<?php
function numbered(iterable $lines): Generator {
    foreach ($lines as $i => $l) {
        yield $i + 1 => trim($l);
    }
}

foreach (numbered(["a ", " b", "c"]) as $n => $l) {
    echo "$n: $l\n";
}
