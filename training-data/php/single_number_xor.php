<?php
echo array_reduce([4, 1, 2, 1, 2], fn($acc, $n) => $acc ^ $n, 0), "\n"; // 4
