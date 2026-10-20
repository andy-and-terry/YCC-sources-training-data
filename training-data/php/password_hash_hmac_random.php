<?php
$h = password_hash('secret', PASSWORD_DEFAULT);
echo password_verify('secret', $h) ? 'ok' : 'no', password_verify('wrong', $h) ? 'ok' : 'no', PHP_EOL;
echo hash('sha256', 'abc'), PHP_EOL;
echo hash_hmac('sha256', 'msg', 'key'), PHP_EOL;
echo strlen(bin2hex(random_bytes(8))), random_int(5, 5), PHP_EOL;
echo hash_equals('a', 'a') ? 'eq' : 'ne', base64_encode('hello'), PHP_EOL;
