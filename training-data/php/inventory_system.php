<?php

final class OutOfStockException extends RuntimeException
{
}

final class Inventory
{
    /** @var array<string, array{name:string, price:int, reorder:int, qty:int}> */
    private array $products = [];

    public function add(string $sku, string $name, int $priceCents, int $reorderLevel = 5): void
    {
        $this->products[$sku] = ['name' => $name, 'price' => $priceCents, 'reorder' => $reorderLevel, 'qty' => 0];
    }

    public function receive(string $sku, int $qty): void
    {
        $this->get($sku);
        $this->products[$sku]['qty'] += $qty;
    }

    public function sell(string $sku, int $qty): int
    {
        $p = $this->get($sku);
        if ($p['qty'] < $qty) {
            throw new OutOfStockException("{$p['name']}: have {$p['qty']}, want $qty");
        }
        $this->products[$sku]['qty'] -= $qty;
        return $qty * $p['price'];
    }

    public function reorderList(): array
    {
        return array_values(array_map(fn ($p) => $p['name'], array_filter($this->products, fn ($p) => $p['qty'] <= $p['reorder'])));
    }

    public function valuation(): int
    {
        return array_sum(array_map(fn ($p) => $p['qty'] * $p['price'], $this->products));
    }

    private function get(string $sku): array
    {
        return $this->products[$sku] ?? throw new OutOfBoundsException("unknown sku $sku");
    }
}

$inv = new Inventory();
$inv->add('A1', 'apple', 50, 10);
$inv->add('P1', 'pear', 75);
$inv->receive('A1', 40);
$inv->receive('P1', 8);
$revenue = $inv->sell('A1', 32) + $inv->sell('P1', 2);
try {
    $inv->sell('P1', 100);
} catch (OutOfStockException $e) {
    echo 'error: ', $e->getMessage(), PHP_EOL;
}
printf("revenue %.2f, stock value %.2f, reorder %s\n", $revenue / 100, $inv->valuation() / 100, implode(',', $inv->reorderList()));
