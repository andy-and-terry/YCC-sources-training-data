<?php

$config = ['host' => 'localhost'];

$config['port'] ??= 3306;
$config['host'] ??= 'example.com';
$config['user'] ??= 'root';

foreach ($config as $key => $value) {
    echo "$key=$value\n";
}

$name = null;
echo ($name ?? 'anonymous') . "\n";
echo ($missing['a']['b'] ?? 'no value') . "\n";
