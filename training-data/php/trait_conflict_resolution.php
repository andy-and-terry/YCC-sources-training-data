<?php
trait A { public function hi() { return 'A'; } }
trait B { public function hi() { return 'B'; } }

class C
{
    use A, B {
        A::hi insteadof B;
        B::hi as protected hiB;
    }
    public function both() { return $this->hi() . $this->hiB(); }
}

echo (new C)->both(), PHP_EOL;
