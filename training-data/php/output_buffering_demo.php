<?php

ob_start();
echo 'captured text';
$captured = ob_get_clean();
echo strrev($captured) . "\n";

function render(string $name): string
{
    ob_start();
    ?>
<p>Hello, <?= htmlspecialchars($name) ?>!</p>
<?php
    return ob_get_clean();
}

echo render('<World>');
