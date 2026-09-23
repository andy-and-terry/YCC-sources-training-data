<?php

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
}

$reflection = new ReflectionClass(UserController::class);
foreach ($reflection->getMethods() as $method) {
    foreach ($method->getAttributes(Route::class) as $attribute) {
        $route = $attribute->newInstance();
        echo "{$route->method} {$route->path} -> {$method->getName()}\n";
    }
}
