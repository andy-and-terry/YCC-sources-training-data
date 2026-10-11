<?php

set_error_handler(function (int $no, string $msg, string $file, int $line) {
    throw new ErrorException($msg, 0, $no, $file, $line);
});

try {
    $result = 10 / 0;
} catch (DivisionByZeroError $e) {
    echo 'caught: ' . $e->getMessage() . "\n";
}

try {
    echo $undefinedVariable;
} catch (ErrorException $e) {
    echo 'warning became exception: ' . $e->getMessage() . "\n";
}

restore_error_handler();
