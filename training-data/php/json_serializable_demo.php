<?php

class User implements JsonSerializable
{
    public function __construct(
        private string $name,
        private string $password,
        private DateTimeImmutable $created,
    ) {}

    public function jsonSerialize(): array
    {
        return ['name' => $this->name, 'created' => $this->created->format('Y-m-d')];
    }
}

$u = new User('ada', 'secret', new DateTimeImmutable('2024-05-01'));
echo json_encode($u), "\n";
echo json_encode([$u, 'n' => 1.0], JSON_PRETTY_PRINT | JSON_PRESERVE_ZERO_FRACTION), "\n";
