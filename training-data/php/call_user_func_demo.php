<?php

class MathOps
{
    public static function double(int $n): int { return $n * 2; }
    public function triple(int $n): int { return $n * 3; }
}

echo call_user_func('strrev', 'abc') . "\n";
echo call_user_func(['MathOps', 'double'], 5) . "\n";
echo call_user_func('MathOps::double', 6) . "\n";
echo call_user_func([new MathOps(), 'triple'], 4) . "\n";
echo call_user_func_array('max', [3, 9, 2]) . "\n";
var_dump(is_callable('nonexistent_fn'));
