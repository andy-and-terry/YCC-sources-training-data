<?php

class ApiException extends RuntimeException
{
}

class NotFoundException extends ApiException
{
    public function __construct(string $resource)
    {
        parent::__construct("$resource not found");
    }
}

class ValidationException extends ApiException
{
    public function __construct(string $field, string $message)
    {
        parent::__construct("invalid field '$field': $message");
    }
}

function fetchResource(int $id): void
{
    if ($id < 0) {
        throw new ValidationException('id', 'must be non-negative');
    }
    if ($id > 100) {
        throw new NotFoundException("resource $id");
    }
}

try {
    fetchResource(999);
} catch (ApiException $e) {
    echo "error: {$e->getMessage()}\n";
}

try {
    fetchResource(-1);
} catch (ApiException $e) {
    echo "error: {$e->getMessage()}\n";
}
