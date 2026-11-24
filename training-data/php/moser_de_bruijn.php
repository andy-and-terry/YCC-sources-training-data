<?php
// Moser-de Bruijn sequence: binary digits of n read in base 4.
echo implode(" ", array_map(fn($n) => intval(decbin($n), 4), range(0, 11))), "\n";
