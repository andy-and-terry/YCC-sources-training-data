<?php
declare(strict_types=1);

enum Unit
{
    case C;
    case F;
    case K;

    public function toCelsius(float $v): float
    {
        return match ($this) {
            Unit::C => $v,
            Unit::F => ($v - 32) * 5 / 9,
            Unit::K => $v - 273.15,
        };
    }

    public function fromCelsius(float $v): float
    {
        return match ($this) {
            Unit::C => $v,
            Unit::F => $v * 9 / 5 + 32,
            Unit::K => $v + 273.15,
        };
    }
}

function convert(float $v, Unit $from, Unit $to): float
{
    return $to->fromCelsius($from->toCelsius($v));
}

printf("%.2f %.2f\n", convert(100, Unit::C, Unit::F), convert(212, Unit::F, Unit::K));
