<?php

/**
 * Tiny template engine: {{ var }}, {{ user.name }}, {{ name|upper }}, {% if x %}...{% endif %}, {% for x in xs %}...{% endfor %}
 */
function render(string $tpl, array $ctx): string
{
    $lookup = function (string $path) use (&$ctx) {
        $v = $ctx;
        foreach (explode('.', $path) as $k) {
            $v = is_array($v) && array_key_exists($k, $v) ? $v[$k] : null;
        }
        return $v;
    };
    $tpl = preg_replace_callback('/\{% for (\w+) in ([\w.]+) %\}(.*?)\{% endfor %\}/s', function ($m) use ($lookup, $ctx) {
        return implode('', array_map(fn ($item) => render($m[3], [...$ctx, $m[1] => $item]), (array) $lookup($m[2])));
    }, $tpl);
    $tpl = preg_replace_callback('/\{% if ([\w.]+) %\}(.*?)\{% endif %\}/s', fn ($m) => $lookup($m[1]) ? $m[2] : '', $tpl);
    return preg_replace_callback('/\{\{\s*([\w.]+)(?:\|(\w+))?\s*\}\}/', function ($m) use ($lookup) {
        $v = (string) $lookup($m[1]);
        return match ($m[2] ?? '') {
            'upper' => strtoupper($v),
            'lower' => strtolower($v),
            'raw' => $v,
            default => htmlspecialchars($v),
        };
    }, $tpl);
}

$tpl = "Hello {{ user.first }} {{ user.last }}, you have {{ count }} new {{ noun|upper }}.\n"
    . "{% if admin %}[admin]\n{% endif %}{% for t in tags %}- {{ t }}\n{% endfor %}";
echo render($tpl, [
    'user' => ['first' => 'Ada', 'last' => 'Lovelace'],
    'count' => 3,
    'noun' => 'messages',
    'admin' => true,
    'tags' => ['math', '<engines>'],
]);
