package main

import "fmt"

type coffee interface {
	cost() float64
	description() string
}

type simpleCoffee struct{}

func (simpleCoffee) cost() float64        { return 2.0 }
func (simpleCoffee) description() string { return "Coffee" }

type milkDecorator struct {
	wrapped coffee
}

func (m milkDecorator) cost() float64        { return m.wrapped.cost() + 0.5 }
func (m milkDecorator) description() string { return m.wrapped.description() + " + Milk" }

type sugarDecorator struct {
	wrapped coffee
}

func (s sugarDecorator) cost() float64        { return s.wrapped.cost() + 0.25 }
func (s sugarDecorator) description() string { return s.wrapped.description() + " + Sugar" }

func main() {
	var order coffee = simpleCoffee{}
	order = milkDecorator{wrapped: order}
	order = sugarDecorator{wrapped: order}
	fmt.Printf("%s: $%.2f\n", order.description(), order.cost())
}
