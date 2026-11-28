<?php
class Secret { private $v = 42; }

$peek = function () { return $this->v; };
echo Closure::bind($peek, new Secret, Secret::class)(), PHP_EOL;
