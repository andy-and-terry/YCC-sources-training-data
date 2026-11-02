<?php
function area(int $w, int $h) { return $w * $h; }
echo area(...['h' => 3, 'w' => 4]), "\n";
