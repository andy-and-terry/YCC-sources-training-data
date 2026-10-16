<?php

$data = ['name' => 'Café', 'price' => 12.0, 'path' => '/a/b', 'tags' => [], 'meta' => new stdClass()];

echo json_encode($data) . "\n";
echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES | JSON_PRESERVE_ZERO_FRACTION) . "\n";

try {
    json_decode('{bad json}', false, 512, JSON_THROW_ON_ERROR);
} catch (JsonException $e) {
    echo 'error: ' . $e->getMessage() . "\n";
}
