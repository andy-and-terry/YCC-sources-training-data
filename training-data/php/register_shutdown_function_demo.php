<?php

class Cleanup
{
    private static array $steps = [];

    public static function register(string $label): void
    {
        self::$steps[] = $label;
    }

    public static function run(): void
    {
        echo "shutdown: running ", count(self::$steps), " cleanup step(s)\n";
        foreach (array_reverse(self::$steps) as $label) {
            echo "  - $label\n";
        }
    }
}

register_shutdown_function(function () {
    echo "shutdown handler 1 (first registered)\n";
});

register_shutdown_function([Cleanup::class, 'run']);

register_shutdown_function(function (string $who) {
    echo "shutdown handler 3 for $who\n";
    $err = error_get_last();
    echo $err === null ? "  no fatal error recorded\n" : "  last error: {$err['message']}\n";
}, 'demo script');

Cleanup::register('close database');
Cleanup::register('remove temp files');

echo "main work starts\n";

function work(int $n): int
{
    return $n * 2;
}

echo "result: ", work(21), "\n";
echo "main work done, exiting\n";

// handlers run after exit() as well
exit(0);
