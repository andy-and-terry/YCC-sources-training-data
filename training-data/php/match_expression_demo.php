<?php

function httpStatusCategory(int $code): string
{
    return match (true) {
        $code >= 200 && $code < 300 => 'success',
        $code >= 300 && $code < 400 => 'redirect',
        $code >= 400 && $code < 500 => 'client error',
        $code >= 500 && $code < 600 => 'server error',
        default => 'unknown',
    };
}

foreach ([200, 301, 404, 503, 999] as $code) {
    echo "$code: " . httpStatusCategory($code) . "\n";
}
