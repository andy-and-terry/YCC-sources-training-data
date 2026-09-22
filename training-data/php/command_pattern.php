<?php

interface Command
{
    public function execute(): void;
    public function undo(): void;
}

class Light
{
    public bool $isOn = false;
}

class TurnOnCommand implements Command
{
    public function __construct(private Light $light)
    {
    }

    public function execute(): void
    {
        $this->light->isOn = true;
    }

    public function undo(): void
    {
        $this->light->isOn = false;
    }
}

class TurnOffCommand implements Command
{
    public function __construct(private Light $light)
    {
    }

    public function execute(): void
    {
        $this->light->isOn = false;
    }

    public function undo(): void
    {
        $this->light->isOn = true;
    }
}

class RemoteControl
{
    private array $history = [];

    public function run(Command $command): void
    {
        $command->execute();
        $this->history[] = $command;
    }

    public function undoLast(): void
    {
        $command = array_pop($this->history);
        $command?->undo();
    }
}

$light = new Light();
$remote = new RemoteControl();
$remote->run(new TurnOnCommand($light));
echo $light->isOn ? "on\n" : "off\n";
$remote->run(new TurnOffCommand($light));
echo $light->isOn ? "on\n" : "off\n";
$remote->undoLast();
echo $light->isOn ? "on\n" : "off\n";
