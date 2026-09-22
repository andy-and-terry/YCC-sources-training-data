<?php

// GoF Mediator pattern: colleagues never reference each other directly;
// they only talk to a mediator, which decides how a message fans out.

interface ChatMediator
{
    public function sendMessage(string $message, User $sender): void;
}

class ChatRoom implements ChatMediator
{
    /** @var User[] */
    private array $users = [];

    public function register(User $user): void
    {
        $this->users[] = $user;
    }

    public function sendMessage(string $message, User $sender): void
    {
        foreach ($this->users as $user) {
            if ($user !== $sender) {
                $user->receive($sender->name, $message);
            }
        }
    }
}

class User
{
    public function __construct(public string $name, private ChatMediator $mediator)
    {
    }

    public function send(string $message): void
    {
        echo "{$this->name} sends: {$message}\n";
        $this->mediator->sendMessage($message, $this);
    }

    public function receive(string $from, string $message): void
    {
        echo "{$this->name} received from {$from}: {$message}\n";
    }
}

$room = new ChatRoom();
$alice = new User('Alice', $room);
$bob = new User('Bob', $room);
$carol = new User('Carol', $room);
$room->register($alice);
$room->register($bob);
$room->register($carol);

$alice->send('hello everyone');
