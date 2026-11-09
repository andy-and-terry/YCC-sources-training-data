<?php
class AppException extends RuntimeException {}
function load() { throw new InvalidArgumentException("bad arg"); }
try {
    try { load(); }
    catch (InvalidArgumentException $e) { throw new AppException("load failed", 0, $e); }
} catch (AppException $e) {
    echo $e->getMessage(), " <- ", $e->getPrevious()->getMessage(), "\n";
}
