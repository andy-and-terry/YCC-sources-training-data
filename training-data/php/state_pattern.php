<?php

interface OrderState
{
    public function next(Order $order): void;
    public function name(): string;
}

class PendingState implements OrderState
{
    public function next(Order $order): void
    {
        $order->setState(new ShippedState());
    }

    public function name(): string
    {
        return 'pending';
    }
}

class ShippedState implements OrderState
{
    public function next(Order $order): void
    {
        $order->setState(new DeliveredState());
    }

    public function name(): string
    {
        return 'shipped';
    }
}

class DeliveredState implements OrderState
{
    public function next(Order $order): void
    {
        // terminal state, no further transition
    }

    public function name(): string
    {
        return 'delivered';
    }
}

class Order
{
    private OrderState $state;

    public function __construct()
    {
        $this->state = new PendingState();
    }

    public function setState(OrderState $state): void
    {
        $this->state = $state;
    }

    public function advance(): void
    {
        $this->state->next($this);
    }

    public function status(): string
    {
        return $this->state->name();
    }
}

$order = new Order();
echo $order->status() . "\n";
$order->advance();
echo $order->status() . "\n";
$order->advance();
echo $order->status() . "\n";
$order->advance();
echo $order->status() . "\n";
