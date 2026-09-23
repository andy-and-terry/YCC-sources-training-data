<?php

readonly class Coordinates
{
    public function __construct(
        public float $latitude,
        public float $longitude,
    ) {
    }

    public function withLatitude(float $latitude): self
    {
        return new self($latitude, $this->longitude);
    }
}

$origin = new Coordinates(51.5074, -0.1278);
$moved = $origin->withLatitude(48.8566);
echo "$origin->latitude,$origin->longitude -> $moved->latitude,$moved->longitude\n";

try {
    $origin->longitude = 0.0;
} catch (\Error $e) {
    echo 'error: ' . $e->getMessage() . "\n";
}
