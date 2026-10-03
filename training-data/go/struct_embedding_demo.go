package main

import "fmt"

type engine struct {
	horsepower int
}

func (e engine) describe() string {
	return fmt.Sprintf("%d hp engine", e.horsepower)
}

type wheels struct {
	count int
}

func (w wheels) describe() string {
	return fmt.Sprintf("%d wheels", w.count)
}

// car composes behavior from engine and wheels via struct embedding
// instead of classical inheritance.
type car struct {
	engine
	wheels
	model string
}

func main() {
	c := car{
		engine: engine{horsepower: 300},
		wheels: wheels{count: 4},
		model:  "Roadster",
	}
	// promoted fields and methods from embedded structs
	fmt.Println(c.model, "-", c.engine.describe(), "-", c.wheels.describe())
	fmt.Println("horsepower:", c.horsepower)
}
