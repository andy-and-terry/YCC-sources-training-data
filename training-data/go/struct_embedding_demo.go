package main

import "fmt"

type Animal struct{ Name string }

func (a Animal) Speak() string { return a.Name + " makes a sound" }
func (a Animal) Describe() string { return "animal " + a.Name }

type Dog struct {
	Animal
	Breed string
}

// Dog overrides Speak but still promotes Describe.
func (d Dog) Speak() string { return d.Name + " barks" }

func main() {
	d := Dog{Animal{"Rex"}, "Lab"}
	fmt.Println(d.Speak())
	fmt.Println(d.Animal.Speak())
	fmt.Println(d.Describe())
	fmt.Println(d.Name, d.Breed)
}
