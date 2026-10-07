<?php

final class Simulator
{
    public float $now = 0.0;
    private SplPriorityQueue $queue;
    private int $seq = PHP_INT_MAX;

    public function __construct()
    {
        $this->queue = new SplPriorityQueue();
    }

    public function after(float $delay, string $label, ?Closure $action = null): void
    {
        // SplPriorityQueue is a max-heap: negate time, and use a decreasing seq for FIFO ties.
        $this->queue->insert([$label, $action], [-($this->now + $delay), $this->seq--]);
    }

    public function run(): void
    {
        $this->queue->setExtractFlags(SplPriorityQueue::EXTR_BOTH);
        while (!$this->queue->isEmpty()) {
            ['data' => [$label, $action], 'priority' => [$negTime]] = $this->queue->extract();
            $this->now = -$negTime;
            printf("t=%4.1f %s\n", $this->now, $label);
            $action?->__invoke();
        }
    }
}

$sim = new Simulator();
$serverFree = 0.0;
foreach ([[0, 3], [1, 2], [1.5, 4], [6, 1]] as $i => [$arrive, $service]) {
    $sim->after($arrive, "c$i arrives", function () use ($sim, &$serverFree, $arrive, $service, $i) {
        $start = max($sim->now, $serverFree);
        $serverFree = $start + $service;
        $sim->after($serverFree - $sim->now, sprintf('c%d leaves (waited %.1f)', $i, $start - $arrive));
    });
}
$sim->run();
