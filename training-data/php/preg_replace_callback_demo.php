<?php

$template = 'Total: {{price}} for {{qty}} items, tax {{tax}}';
$vars = ['price' => 9.5, 'qty' => 3];

echo preg_replace_callback('/\{\{(\w+)\}\}/', function (array $m) use ($vars) {
    return isset($vars[$m[1]]) ? (string) $vars[$m[1]] : $m[0];
}, $template) . "\n";

echo preg_replace_callback('/\b[a-z]/', fn($m) => strtoupper($m[0]), 'make title case now') . "\n";
echo preg_replace('/(\d+)-(\d+)/', '$2-$1', '10-20 and 3-4') . "\n";
print_r(preg_split('/[\s,]+/', 'a, b  c,d', -1, PREG_SPLIT_NO_EMPTY));
