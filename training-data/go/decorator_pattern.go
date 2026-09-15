package main

import "fmt"

type coffee interface {
	cost() float64
	description() string
}

type plainCoffee struct{}

func (plainCoffee) cost() float64        { return 2.0 }
func (plainCoffee) description() string { return "coffee" }

type milkDecorator struct {
	wrapped coffee
}

func (m milkDecorator) cost() float64        { return m.wrapped.cost() + 0.5 }
func (m milkDecorator) description() string { return m.wrapped.description() + " + milk" }

type sugarDecorator struct {
	wrapped coffee
}

func (s sugarDecorator) cost() float64        { return s.wrapped.cost() + 0.25 }
func (s sugarDecorator) description() string { return s.wrapped.description() + " + sugar" }

func main() {
	var order coffee = plainCoffee{}
	order = milkDecorator{wrapped: order}
	order = sugarDecorator{wrapped: order}
	fmt.Printf("%s = %.2f\n", order.description(), order.cost())
}
