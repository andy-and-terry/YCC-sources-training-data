<?php

$field = 'color';
$$field = 'teal';
echo $color . "\n";

$obj = new stdClass();
$prop = 'size';
$obj->$prop = 42;
$obj->{'with space'} = 'ok';
print_r(get_object_vars($obj));

$method = 'strtoupper';
echo $method('dynamic call') . "\n";

class Tool { public static function make() { return 'made'; } }
$class = 'Tool';
echo $class::make() . "\n";
