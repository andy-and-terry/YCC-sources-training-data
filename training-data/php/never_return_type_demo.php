<?php

class NotFoundException extends RuntimeException {}

function fail(string $message): never
{
    throw new NotFoundException($message);
}

function redirectTo(string $url): never
{
    echo "redirecting to $url\n";
    exit(0);
}

function findUser(array $users, int $id): array
{
    return $users[$id] ?? fail("user $id not found");
}

$users = [1 => ['name' => 'Ada'], 2 => ['name' => 'Bob']];

echo findUser($users, 2)['name'], "\n";

try {
    findUser($users, 9);
} catch (NotFoundException $e) {
    echo "error: ", $e->getMessage(), "\n";
}

$value = $users[1]['name'] ?? throw new LogicException('missing');
echo "got $value\n";

redirectTo('/home');
echo "never printed\n";
