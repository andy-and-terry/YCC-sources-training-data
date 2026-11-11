<?php
// Narayana's cows N(n)=N(n-1)+N(n-3)
$v = [1, 1, 1];
for ($i = 3; $i < 10; $i++) {
    $v[] = $v[$i - 1] + $v[$i - 3];
}
echo implode(' ', $v), "\n";
