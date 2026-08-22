<?php

class MathOps
{
    public static function square(int $x): int
    {
        return $x * $x;
    }

    public function cube(int $x): int
    {
        return $x ** 3;
    }
}

$squareFn = MathOps::square(...);
$ops = new MathOps();
$cubeFn = $ops->cube(...);

$numbers = [1, 2, 3, 4];
print_r(array_map($squareFn, $numbers));
print_r(array_map($cubeFn, $numbers));

$strlenFn = strlen(...);
echo $strlenFn('hello') . "\n";
