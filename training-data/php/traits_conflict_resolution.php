<?php
trait A { public function hi() { return 'A'; } }
trait B { public function hi() { return 'B'; } }
class C { use A, B { A::hi insteadof B; B::hi as hiB; } }
$c = new C;
echo $c->hi(), $c->hiB(), "\n";
