<?php
// Fibbinary numbers: no two adjacent 1 bits.
echo implode(" ", array_filter(range(0, 49), fn($n) => ($n & ($n >> 1)) === 0)), "\n";
