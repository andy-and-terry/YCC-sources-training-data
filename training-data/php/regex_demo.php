<?php

function extractEmails(string $text): array
{
    preg_match_all('/[\w.+-]+@[\w-]+\.[\w.-]+/', $text, $matches);
    return $matches[0];
}

function isValidUsername(string $name): bool
{
    return (bool) preg_match('/^[a-zA-Z][a-zA-Z0-9_]{2,15}$/', $name);
}

$text = 'Contact us at support@example.com or sales@example.org for help.';
print_r(extractEmails($text));

foreach (['user_01', '1bad', 'ab', 'validName'] as $name) {
    echo "$name: " . (isValidUsername($name) ? 'valid' : 'invalid') . "\n";
}
