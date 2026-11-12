<?php
interface Named { public function name(): string; }
trait Greets { public function greet(): string { return "Hi " . $this->name(); } }
abstract class Base implements Named { use Greets; }
class Bob extends Base { public function name(): string { return "Bob"; } }
echo (new Bob)->greet(), "\n";
