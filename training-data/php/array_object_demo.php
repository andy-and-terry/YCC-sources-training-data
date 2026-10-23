<?php

$config = new ArrayObject(['host' => 'localhost', 'port' => 8080]);

// array-style access and object-style count/iteration
$config['debug'] = true;
echo "count: ", count($config), "\n";
echo "host: ", $config['host'], "\n";
echo "has port: ", var_export(isset($config['port']), true), "\n";
unset($config['port']);

foreach ($config as $key => $value) {
    echo "$key => ", var_export($value, true), "\n";
}

// property-style access with ARRAY_AS_PROPS
$props = new ArrayObject(['name' => 'Ada'], ArrayObject::ARRAY_AS_PROPS);
$props->language = 'PHP';
echo "$props->name uses $props->language\n";

// sorting and exporting
$scores = new ArrayObject(['bob' => 72, 'amy' => 95, 'cat' => 88]);
$scores->asort();
echo "asc: ", implode(', ', array_keys($scores->getArrayCopy())), "\n";
$scores->ksort();
echo "by key: ", implode(', ', array_keys($scores->getArrayCopy())), "\n";

// subclass to add behavior
class TypedList extends ArrayObject
{
    public function offsetSet(mixed $key, mixed $value): void
    {
        if (!is_int($value)) {
            throw new InvalidArgumentException("only ints allowed, got " . get_debug_type($value));
        }
        parent::offsetSet($key, $value);
    }
}

$list = new TypedList();
$list[] = 1;
$list[] = 2;
try {
    $list[] = 'three';
} catch (InvalidArgumentException $e) {
    echo "error: ", $e->getMessage(), "\n";
}
echo "list: ", implode(',', $list->getArrayCopy()), "\n";
