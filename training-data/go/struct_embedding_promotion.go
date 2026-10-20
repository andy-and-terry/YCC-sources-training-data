package main

import "fmt"

type Animal struct{ Name string }

func (a Animal) Speak() string { return a.Name + " makes a sound" }

type Dog struct {
	Animal
	Breed string
}

func (d Dog) Speak() string { return d.Name + " barks" }

func main() {
	d := Dog{Animal{"Rex"}, "lab"}
	fmt.Println(d.Speak(), "|", d.Animal.Speak())
}
