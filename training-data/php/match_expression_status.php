<?php
function text(int $code): string {
    return match (true) {
        $code >= 500 => "server error",
        $code >= 400 => "client error",
        $code >= 200 => "ok",
        default => "other",
    };
}
foreach ([200, 404, 503, 100] as $c) echo $c, " ", text($c), "\n";
