<?php
// var_export emits valid PHP code, unlike var_dump or print_r.

$data = ["name" => "Ada", "tags" => ["math", "code"], "score" => 9.5, "active" => true, "none" => null];
var_export($data);
echo "\n";

// Returning the string lets us round-trip it through eval.
$code = var_export($data, true);
$copy = eval("return $code;");
var_dump($copy === $data);

// Objects are exported as calls to ::__set_state, which the class can implement.
class Point
{
    public function __construct(public int $x = 0, public int $y = 0) {}

    public static function __set_state(array $props): static
    {
        return new static($props["x"], $props["y"]);
    }
}

$p = new Point(3, 4);
$exported = var_export($p, true);
echo $exported, "\n";

$restored = eval("return $exported;");
echo $restored->x, ",", $restored->y, "\n";
