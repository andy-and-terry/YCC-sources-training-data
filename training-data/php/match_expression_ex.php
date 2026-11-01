<?php
function http(int $code): string {
    return match (true) {
        $code >= 500 => "server error",
        $code >= 400 => "client error",
        $code >= 200 && $code < 300 => "ok",
        default => "other",
    };
}
foreach ([200, 404, 503, 302] as $c) echo "$c " . http($c) . "\n";
