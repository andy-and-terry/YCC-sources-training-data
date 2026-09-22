package main

import "fmt"

type animal struct {
	name string
}

func (a animal) describe() string {
	return a.name + " is an animal"
}

type dog struct {
	animal
	breed string
}

func (d dog) describe() string {
	return d.animal.describe() + " (a " + d.breed + " dog)"
}

type describer interface {
	describe() string
}

func main() {
	d := dog{animal: animal{name: "Rex"}, breed: "Labrador"}
	fmt.Println(d.describe())
	fmt.Println(d.name) // promoted field access

	var s describer = d
	fmt.Println(s.describe())
}
