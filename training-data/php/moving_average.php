<?php

final class MovingAverage
{
    private SplQueue $window;
    private float $sum = 0.0;

    public function __construct(private int $size)
    {
        $this->window = new SplQueue();
    }

    public function add(float $x): float
    {
        $this->window->enqueue($x);
        $this->sum += $x;
        if (count($this->window) > $this->size) {
            $this->sum -= $this->window->dequeue();
        }
        return $this->sum / count($this->window);
    }
}

$prices = [10, 11, 12, 13, 12, 11, 15, 18, 17, 16];
$sma = new MovingAverage(3);
$ema = null;
foreach ($prices as $p) {
    $ema = $ema === null ? (float) $p : 0.5 * $p + 0.5 * $ema;
    printf("%5.1f  sma=%7.3f  ema=%7.3f\n", $p, $sma->add($p), $ema);
}
