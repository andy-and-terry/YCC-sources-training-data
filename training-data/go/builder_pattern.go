package main

import "fmt"

type pizza struct {
	toppings []string
	size     string
}

type pizzaBuilder struct {
	pizza pizza
}

func newPizzaBuilder() *pizzaBuilder {
	return &pizzaBuilder{pizza: pizza{size: "medium"}}
}

func (b *pizzaBuilder) withSize(size string) *pizzaBuilder {
	b.pizza.size = size
	return b
}

func (b *pizzaBuilder) addTopping(topping string) *pizzaBuilder {
	b.pizza.toppings = append(b.pizza.toppings, topping)
	return b
}

func (b *pizzaBuilder) build() pizza {
	return b.pizza
}

func main() {
	p := newPizzaBuilder().withSize("large").addTopping("cheese").addTopping("olives").build()
	fmt.Println(p)
}
