<?php

class Subject
{
    private array $observers = [];

    public function subscribe(callable $observer): void
    {
        $this->observers[] = $observer;
    }

    public function notify(mixed $value): void
    {
        foreach ($this->observers as $observer) {
            $observer($value);
        }
    }
}

class TemperatureSensor extends Subject
{
    public function setTemperature(float $value): void
    {
        $this->notify($value);
    }
}

$sensor = new TemperatureSensor();
$sensor->subscribe(fn ($t) => print("Alert: temperature is now $t\n"));
$sensor->setTemperature(25.5);
