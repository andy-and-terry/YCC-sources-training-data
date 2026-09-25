<?php
declare(strict_types=1);

final class MovingAverage
{
    private SplQueue $window;
    private float $sum = 0.0;

    public function __construct(private readonly int $size)
    {
        $this->window = new SplQueue();
    }

    public function next(float $v): float
    {
        $this->window->enqueue($v);
        $this->sum += $v;
        if (count($this->window) > $this->size) $this->sum -= $this->window->dequeue();
        return $this->sum / count($this->window);
    }
}

$ma = new MovingAverage(3);
echo implode(' ', array_map(fn($v) => sprintf('%.2f', $ma->next($v)), [1, 10, 3, 5, 8, 2])), PHP_EOL;
