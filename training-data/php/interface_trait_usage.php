<?php
interface Logger { public function log(string $m): void; }
trait Timestamps {
    public function stamp(string $m): string { return "[ts] $m"; }
}
class EchoLogger implements Logger {
    use Timestamps;
    public function log(string $m): void { echo $this->stamp($m), "\n"; }
}
(new EchoLogger)->log("hello");
