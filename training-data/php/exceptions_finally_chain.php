<?php
class DbError extends RuntimeException {}

function query(): void {
    try {
        throw new InvalidArgumentException("bad sql");
    } catch (InvalidArgumentException $e) {
        throw new DbError("query failed", 500, $e);   // chain the cause
    } finally {
        echo "release connection\n";
    }
}

try {
    query();
} catch (DbError $e) {
    echo $e->getMessage(), " <- ", $e->getPrevious()->getMessage(), " (", $e->getCode(), ")\n";
}
