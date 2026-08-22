<?php

class User
{
    public function __construct(
        public string $name,
        public int $age,
        public array $tags = [],
    ) {
    }

    public static function fromJson(string $json): self
    {
        $data = json_decode($json, true, flags: JSON_THROW_ON_ERROR);
        return new self($data['name'], $data['age'], $data['tags'] ?? []);
    }

    public function toJson(): string
    {
        return json_encode([
            'name' => $this->name,
            'age' => $this->age,
            'tags' => $this->tags,
        ], JSON_PRETTY_PRINT);
    }
}

$json = '{"name": "Ada", "age": 30, "tags": ["math", "engineering"]}';
$user = User::fromJson($json);
echo $user->toJson() . "\n";
