<?php
class AppEx extends RuntimeException {}
function run() { try { throw new AppEx("bad", 3); } finally { echo "finally\n"; } }
try { run(); } catch (AppEx $e) { echo get_class($e), ":", $e->getMessage(), ":", $e->getCode(), "\n"; }
