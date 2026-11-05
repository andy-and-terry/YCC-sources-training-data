<?php
function f() {
    try {
        throw new InvalidArgumentException('inner');
    } catch (Exception $e) {
        throw new RuntimeException('outer', 0, $e);
    } finally {
        echo "finally\n";
    }
}
try { f(); } catch (Exception $e) { echo $e->getMessage(), ' <- ', $e->getPrevious()->getMessage(), "\n"; }
