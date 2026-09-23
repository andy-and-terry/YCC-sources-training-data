<?php

// Tarjan's algorithm finds strongly connected components in one DFS pass,
// tracking each node's discovery index and the lowest index reachable
// from it (its "low-link"); a node whose low-link equals its own index
// roots a component popped off the stack.
class Tarjan
{
    private array $index = [];
    private array $low = [];
    private array $onStack = [];
    private array $stack = [];
    private int $counter = 0;
    public array $components = [];

    public function run(array $graph): array
    {
        foreach (array_keys($graph) as $node) {
            if (!isset($this->index[$node])) {
                $this->strongConnect($node, $graph);
            }
        }
        return $this->components;
    }

    private function strongConnect(string $node, array $graph): void
    {
        $this->index[$node] = $this->counter;
        $this->low[$node] = $this->counter;
        $this->counter++;
        $this->stack[] = $node;
        $this->onStack[$node] = true;

        foreach ($graph[$node] as $neighbor) {
            if (!isset($this->index[$neighbor])) {
                $this->strongConnect($neighbor, $graph);
                $this->low[$node] = min($this->low[$node], $this->low[$neighbor]);
            } elseif ($this->onStack[$neighbor] ?? false) {
                $this->low[$node] = min($this->low[$node], $this->index[$neighbor]);
            }
        }

        if ($this->low[$node] === $this->index[$node]) {
            $component = [];
            do {
                $member = array_pop($this->stack);
                $this->onStack[$member] = false;
                $component[] = $member;
            } while ($member !== $node);
            $this->components[] = $component;
        }
    }
}

// 0 -> 1 -> 2 -> 0 (cycle), 2 -> 3 -> 4 -> 3 (cycle)
$graph = ['0' => ['1'], '1' => ['2'], '2' => ['0', '3'], '3' => ['4'], '4' => ['3']];

$tarjan = new Tarjan();
foreach ($tarjan->run($graph) as $component) {
    echo implode(',', $component), PHP_EOL;
}
