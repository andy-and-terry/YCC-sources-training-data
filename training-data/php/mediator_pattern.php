<?php

// The mediator centralizes how a set of colleague objects talk to each
// other, so colleagues only know the mediator, never one another
// directly.
interface ChatMediator
{
    public function send(string $message, User $sender): void;
}

class ChatRoom implements ChatMediator
{
    /** @var User[] */
    private array $users = [];

    public function addUser(User $user): void
    {
        $this->users[] = $user;
    }

    public function send(string $message, User $sender): void
    {
        foreach ($this->users as $user) {
            if ($user !== $sender) {
                $user->receive($message, $sender->name);
            }
        }
    }
}

class User
{
    public function __construct(
        public readonly string $name,
        private ChatMediator $mediator,
    ) {
    }

    public function sendMessage(string $message): void
    {
        $this->mediator->send($message, $this);
    }

    public function receive(string $message, string $from): void
    {
        echo "{$this->name} received from {$from}: {$message}", PHP_EOL;
    }
}

$room = new ChatRoom();
$alice = new User('Alice', $room);
$bob = new User('Bob', $room);
$carol = new User('Carol', $room);
$room->addUser($alice);
$room->addUser($bob);
$room->addUser($carol);

$alice->sendMessage('hello everyone');
