<?php

function nextGreaterElements(array $values): array
{
    $result = array_fill(0, count($values), -1);
    $stack = [];

    foreach ($values as $i => $value) {
        while (!empty($stack) && $values[end($stack)] < $value) {
            $result[array_pop($stack)] = $value;
        }
        $stack[] = $i;
    }

    return $result;
}

print_r(nextGreaterElements([2, 1, 2, 4, 3]));
print_r(nextGreaterElements([4, 3, 2, 1]));
