<?php
$data = ['a' => 1, 'b' => ['c' => 2, 'd' => ['e' => 3]]];
function flatten(array $arr, string $prefix = ''): array {
    $out = [];
    foreach ($arr as $k => $v) {
        $key = $prefix === '' ? $k : "$prefix.$k";
        if (is_array($v)) $out += flatten($v, $key);
        else $out[$key] = $v;
    }
    return $out;
}
print_r(flatten($data));
array_walk_recursive($data, function (&$v) { $v *= 10; });
echo json_encode($data), "\n";
