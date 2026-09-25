<?php

/**
 * @template T
 * @param callable(int): T $fn
 * @return T
 */
function retry(callable $fn, int $maxAttempts = 5, int $baseMs = 50, int $capMs = 1000, ?callable $sleep = null): mixed
{
    $sleep ??= fn (int $ms) => usleep($ms * 1000);
    for ($attempt = 1; ; $attempt++) {
        try {
            return $fn($attempt);
        } catch (RuntimeException $e) {
            if ($attempt >= $maxAttempts) {
                throw $e;
            }
            $delay = random_int(0, min($capMs, $baseMs * 2 ** ($attempt - 1))); // full jitter
            echo "attempt $attempt failed ({$e->getMessage()}), sleeping {$delay}ms", PHP_EOL;
            $sleep($delay);
        }
    }
}

$noSleep = fn (int $ms) => null;
$result = retry(function (int $n) {
    if ($n < 3) {
        throw new RuntimeException('service unavailable');
    }
    return "ok on attempt $n";
}, sleep: $noSleep);
echo $result, PHP_EOL;

try {
    retry(fn () => throw new RuntimeException('always down'), maxAttempts: 2, sleep: $noSleep);
} catch (RuntimeException $e) {
    echo 'gave up: ', $e->getMessage(), PHP_EOL;
}
