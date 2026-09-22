<?php

abstract class SupportHandler
{
    private ?SupportHandler $next = null;

    public function setNext(SupportHandler $handler): SupportHandler
    {
        $this->next = $handler;
        return $handler;
    }

    public function handle(int $severity): string
    {
        if ($this->next !== null) {
            return $this->next->handle($severity);
        }
        return "Unhandled severity: {$severity}";
    }
}

class Level1Support extends SupportHandler
{
    public function handle(int $severity): string
    {
        if ($severity <= 1) {
            return 'Handled by Level1Support';
        }
        return parent::handle($severity);
    }
}

class Level2Support extends SupportHandler
{
    public function handle(int $severity): string
    {
        if ($severity <= 2) {
            return 'Handled by Level2Support';
        }
        return parent::handle($severity);
    }
}

class ManagerEscalation extends SupportHandler
{
    public function handle(int $severity): string
    {
        if ($severity <= 3) {
            return 'Handled by ManagerEscalation';
        }
        return parent::handle($severity);
    }
}

$level1 = new Level1Support();
$level2 = new Level2Support();
$manager = new ManagerEscalation();
$level1->setNext($level2)->setNext($manager);

echo $level1->handle(1) . "\n";
echo $level1->handle(2) . "\n";
echo $level1->handle(3) . "\n";
echo $level1->handle(5) . "\n";
