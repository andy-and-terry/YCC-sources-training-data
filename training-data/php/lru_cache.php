<?php

class LruCache
{
    private array $store = [];

    public function __construct(private int $capacity)
    {
    }

    public function get(string $key): mixed
    {
        if (!array_key_exists($key, $this->store)) {
            return null;
        }
        $value = $this->store[$key];
        unset($this->store[$key]);
        $this->store[$key] = $value;
        return $value;
    }

    public function put(string $key, mixed $value): void
    {
        if (array_key_exists($key, $this->store)) {
            unset($this->store[$key]);
        } elseif (count($this->store) >= $this->capacity) {
            $oldestKey = array_key_first($this->store);
            unset($this->store[$oldestKey]);
        }
        $this->store[$key] = $value;
    }
}

$cache = new LruCache(2);
$cache->put('a', 1);
$cache->put('b', 2);
echo $cache->get('a') . "\n";
$cache->put('c', 3);
var_dump($cache->get('b'));
echo $cache->get('c') . "\n";
