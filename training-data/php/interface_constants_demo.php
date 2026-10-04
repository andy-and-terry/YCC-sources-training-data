<?php
interface HasLimit {
    const MAX = 3;
    public function limit(): int;
}
class Basket implements HasLimit {
    public function limit(): int {
        return self::MAX * 2;
    }
}
$b = new Basket();
echo HasLimit::MAX, " ", $b->limit(), " ", Basket::MAX, "\n";
echo $b instanceof HasLimit ? "yes" : "no", "\n";
