<?php
class A { public ?B $b = null; }
class B { public string $v = "x"; }
$a = new A;
var_dump($a?->b?->v);
