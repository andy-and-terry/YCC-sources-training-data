<?php

class Product
{
    public const TAX = 0.2;
    public function __construct(public string $name, protected float $price = 9.99) {}
    public function total(int $qty): float { return $qty * $this->price * (1 + self::TAX); }
}

$rc = new ReflectionClass(Product::class);
echo $rc->getShortName(), "\n";
foreach ($rc->getProperties() as $p) {
    echo '  property ', $p->getName(), ' : ', $p->getType(), "\n";
}
foreach ($rc->getMethod('total')->getParameters() as $param) {
    echo '  param $', $param->getName(), ' : ', $param->getType(), "\n";
}
print_r($rc->getConstants());

$obj = $rc->newInstanceArgs(['Lamp', 20.0]);
echo $rc->getMethod('total')->invoke($obj, 2), "\n";
