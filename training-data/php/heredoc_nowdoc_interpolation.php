<?php
$name = 'Ada'; $arr = ['k' => 'v']; $obj = new stdClass; $obj->p = 'prop';
echo <<<TXT
Hello $name, {$arr['k']} and $obj->p
Expr: {${'name'}} \$escaped
TXT;
echo PHP_EOL;
echo <<<'RAW'
No $interpolation {$here}
RAW;
echo PHP_EOL;
