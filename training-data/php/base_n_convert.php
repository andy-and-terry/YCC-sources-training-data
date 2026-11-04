<?php
foreach ([2, 8, 16, 36] as $base) {
    echo "255 in base $base = ", base_convert("255", 10, $base), "\n";
}
echo intval("zz", 36), "\n";
echo bindec("1010"), " ", hexdec("ff"), " ", octdec("377"), "\n";
