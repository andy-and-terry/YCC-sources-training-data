<?php

interface HasLimits
{
    public const MIN = 1;
    public const MAX = 10;

    public function clamp(int $value): int;
}

final class Clamper implements HasLimits
{
    public function clamp(int $value): int
    {
        return max(self::MIN, min(self::MAX, $value));
    }
}

$c = new Clamper();
foreach ([-5, 5, 50] as $v) {
    echo "$v -> " . $c->clamp($v) . "\n";
}

echo HasLimits::MAX . ' ' . Clamper::MIN . "\n";
echo $c instanceof HasLimits ? "implements\n" : "no\n";
echo implode(',', class_implements($c)) . "\n";
