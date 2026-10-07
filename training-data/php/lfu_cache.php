<?php

class LfuCache
{
    private array $values = [];
    private array $freqs = [];

    public function __construct(private int $capacity)
    {
    }

    private function evict(): void
    {
        $minKey = null;
        $minFreq = PHP_INT_MAX;
        foreach ($this->freqs as $key => $freq) {
            if ($freq < $minFreq) {
                $minFreq = $freq;
                $minKey = $key;
            }
        }
        unset($this->values[$minKey], $this->freqs[$minKey]);
    }

    public function put(string $key, mixed $value): void
    {
        if ($this->capacity <= 0) {
            return;
        }
        if (array_key_exists($key, $this->values)) {
            $this->values[$key] = $value;
            $this->freqs[$key]++;
            return;
        }
        if (count($this->values) >= $this->capacity) {
            $this->evict();
        }
        $this->values[$key] = $value;
        $this->freqs[$key] = 1;
    }

    public function get(string $key): mixed
    {
        if (!array_key_exists($key, $this->values)) {
            return null;
        }
        $this->freqs[$key]++;
        return $this->values[$key];
    }
}

$cache = new LfuCache(2);
$cache->put('a', 10);
$cache->put('b', 20);
$cache->get('a');
$cache->put('c', 30);
var_dump($cache->get('b'));
echo $cache->get('a') . "\n";
echo $cache->get('c') . "\n";
