<?php
function isToeplitz(array $m): bool {
    for ($i = 1; $i < count($m); $i++)
        for ($j = 1; $j < count($m[$i]); $j++)
            if ($m[$i][$j] !== $m[$i - 1][$j - 1]) return false;
    return true;
}

var_dump(isToeplitz([[1, 2, 3], [4, 1, 2], [5, 4, 1]]));
var_dump(isToeplitz([[1, 2], [2, 2]]));
