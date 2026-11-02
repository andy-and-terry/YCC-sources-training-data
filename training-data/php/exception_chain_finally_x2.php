<?php
function f() {
    try { throw new InvalidArgumentException('bad'); }
    catch (Exception $e) { throw new RuntimeException('wrapped', 0, $e); }
    finally { echo "finally\n"; }
}
try { f(); } catch (Exception $e) { echo $e->getMessage(), ' <- ', $e->getPrevious()->getMessage(), "\n"; }
