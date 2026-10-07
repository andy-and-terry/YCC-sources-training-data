<?php

$cache = new WeakMap();

$obj = new stdClass();
$cache[$obj] = 'expensive result';
echo count($cache), "\n";
echo $cache[$obj], "\n";

unset($obj); // entry disappears with the object
echo count($cache), "\n";

$ref = WeakReference::create($other = new stdClass());
var_dump($ref->get() === $other);
unset($other);
var_dump($ref->get());
