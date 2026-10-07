package main

import "fmt"

type Animal struct{ Name string }

func (a Animal) Describe() string { return "animal " + a.Name }
func (a Animal) Sound() string    { return "..." }

type Dog struct {
	Animal
	Breed string
}

func (d Dog) Sound() string { return "woof" }

func main() {
	d := Dog{Animal{"Rex"}, "Lab"}
	fmt.Println(d.Name, d.Describe())
	fmt.Println(d.Sound(), d.Animal.Sound())
}
