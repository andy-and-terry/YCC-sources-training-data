<?php

interface TrafficLightState
{
    public function next(): TrafficLightState;

    public function name(): string;
}

class RedState implements TrafficLightState
{
    public function next(): TrafficLightState
    {
        return new GreenState();
    }

    public function name(): string
    {
        return 'Red';
    }
}

class GreenState implements TrafficLightState
{
    public function next(): TrafficLightState
    {
        return new YellowState();
    }

    public function name(): string
    {
        return 'Green';
    }
}

class YellowState implements TrafficLightState
{
    public function next(): TrafficLightState
    {
        return new RedState();
    }

    public function name(): string
    {
        return 'Yellow';
    }
}

class TrafficLight
{
    private TrafficLightState $state;

    public function __construct()
    {
        $this->state = new RedState();
    }

    public function advance(): void
    {
        $this->state = $this->state->next();
    }

    public function current(): string
    {
        return $this->state->name();
    }
}

$light = new TrafficLight();
for ($i = 0; $i < 4; $i++) {
    echo $light->current() . "\n";
    $light->advance();
}
