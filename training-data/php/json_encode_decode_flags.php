<?php
$data = ['name' => 'Ada', 'tags' => ['a', 'b'], 'n' => 1.5, 'nil' => null, 'u' => 'é'];
echo json_encode($data, JSON_UNESCAPED_UNICODE), PHP_EOL;
echo json_encode($data, JSON_PRETTY_PRINT | JSON_UNESCAPED_UNICODE), PHP_EOL;
$obj = json_decode('{"a":{"b":[1,2]}}');
echo $obj->a->b[1], PHP_EOL;
$arr = json_decode('{"a":{"b":[1,2]}}', true);
echo count($arr['a']['b']), PHP_EOL;
try {
    json_decode('{bad', false, 512, JSON_THROW_ON_ERROR);
} catch (JsonException $e) {
    echo 'invalid json', PHP_EOL;
}
