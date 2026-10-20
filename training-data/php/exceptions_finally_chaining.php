<?php
class DomainError extends RuntimeException {}

function risky(int $n) {
    try {
        if ($n < 0) throw new InvalidArgumentException('negative');
        if ($n === 0) throw new DomainError('zero');
        return 10 / $n;
    } catch (InvalidArgumentException | DomainError $e) {
        throw new LogicException('wrapped: ' . $e->getMessage(), 1, $e);
    } finally {
        echo "[finally $n]";
    }
}

foreach ([2, 0] as $n) {
    try { echo risky($n), PHP_EOL; }
    catch (LogicException $e) { echo $e->getMessage(), ' <- ', get_class($e->getPrevious()), PHP_EOL; }
}
