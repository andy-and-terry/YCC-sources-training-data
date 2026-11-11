<?php
// Perrin sequence P(n)=P(n-2)+P(n-3)
$v = [3, 0, 2];
for ($i = 3; $i < 10; $i++) {
    $v[] = $v[$i - 2] + $v[$i - 3];
}
echo implode(' ', $v), "\n";
