<?php

// PHP 8 attributes attach structured metadata to declarations. They do
// nothing on their own; a Reflection-based reader has to look them up
// and interpret them, similar to how routing/validation frameworks use
// them under the hood.

#[Attribute]
class Route
{
    public function __construct(public string $path, public string $method = 'GET')
    {
    }
}

class UserController
{
    #[Route('/users', method: 'GET')]
    public function index(): string
    {
        return 'list users';
    }

    #[Route('/users', method: 'POST')]
    public function store(): string
    {
        return 'create user';
    }

    public function untaggedMethod(): string
    {
        return 'no route';
    }
}

$reflection = new ReflectionClass(UserController::class);

foreach ($reflection->getMethods() as $method) {
    $attributes = $method->getAttributes(Route::class);
    foreach ($attributes as $attribute) {
        /** @var Route $route */
        $route = $attribute->newInstance();
        echo "{$route->method} {$route->path} -> {$method->getName()}()\n";
    }
}

$untagged = $reflection->getMethod('untaggedMethod');
echo 'untaggedMethod has ' . count($untagged->getAttributes(Route::class)) . " route attribute(s)\n";
