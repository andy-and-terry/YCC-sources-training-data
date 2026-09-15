package main

import "fmt"

type coffee interface {
	Cost() float64
	Description() string
}

type simpleCoffee struct{}

func (simpleCoffee) Cost() float64       { return 2.0 }
func (simpleCoffee) Description() string { return "Coffee" }

type milkDecorator struct {
	wrapped coffee
}

func (m milkDecorator) Cost() float64 {
	return m.wrapped.Cost() + 0.5
}

func (m milkDecorator) Description() string {
	return m.wrapped.Description() + " + Milk"
}

type sugarDecorator struct {
	wrapped coffee
}

func (s sugarDecorator) Cost() float64 {
	return s.wrapped.Cost() + 0.25
}

func (s sugarDecorator) Description() string {
	return s.wrapped.Description() + " + Sugar"
}

func main() {
	var order coffee = simpleCoffee{}
	order = milkDecorator{wrapped: order}
	order = sugarDecorator{wrapped: order}
	fmt.Printf("%s: $%.2f\n", order.Description(), order.Cost())
}
