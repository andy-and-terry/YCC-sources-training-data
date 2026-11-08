<?php
$data = ['name' => 'Zoë', 'tags' => ['a', 'b'], 'n' => 1.5];
$json = json_encode($data, JSON_UNESCAPED_UNICODE | JSON_PRETTY_PRINT);
echo $json, "\n";
$back = json_decode($json, true);
var_dump($back['tags'] === $data['tags']);
