<?php

class Session
{
    public string $user = 'guest';
    private array $data = ['theme' => 'dark'];
    public ?object $connection = null;

    public function __sleep(): array
    {
        return ['user', 'data'];
    }

    public function __wakeup(): void
    {
        echo "restored session for {$this->user}\n";
    }
}

$s = new Session();
$s->user = 'maria';
$packed = serialize($s);
echo $packed . "\n";
$copy = unserialize($packed);
var_dump($copy->connection);
