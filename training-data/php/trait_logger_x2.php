<?php
trait Logs { private array $log = []; public function log(string $m): void { $this->log[] = $m; } public function dump(): void { echo implode(',', $this->log), "\n"; } }
class Svc { use Logs; }
$s = new Svc; $s->log('a'); $s->log('b'); $s->dump();
