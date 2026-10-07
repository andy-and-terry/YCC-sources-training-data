<?php

class Cpu
{
    public function freeze(): string
    {
        return 'cpu: freeze';
    }

    public function jump(int $position): string
    {
        return "cpu: jump to {$position}";
    }

    public function execute(): string
    {
        return 'cpu: execute';
    }
}

class Memory
{
    public function load(int $position, string $data): string
    {
        return "memory: load '{$data}' at {$position}";
    }
}

class HardDrive
{
    public function read(int $sector, int $size): string
    {
        return "hard drive: read {$size} bytes from sector {$sector}";
    }
}

class ComputerFacade
{
    public function __construct(
        private Cpu $cpu = new Cpu(),
        private Memory $memory = new Memory(),
        private HardDrive $hardDrive = new HardDrive(),
    ) {
    }

    public function start(): array
    {
        return [
            $this->cpu->freeze(),
            $this->memory->load(0, $this->hardDrive->read(0, 1024)),
            $this->cpu->jump(0),
            $this->cpu->execute(),
        ];
    }
}

$computer = new ComputerFacade();
foreach ($computer->start() as $step) {
    echo "$step\n";
}
