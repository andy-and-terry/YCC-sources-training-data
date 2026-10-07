package main

import "fmt"

type Animal struct {
	Name string
}

func (a Animal) Describe() string {
	return "animal named " + a.Name
}

type Dog struct {
	Animal
	Breed string
}

// Dog overrides Describe but can still call the embedded version.
func (d Dog) Describe() string {
	return d.Animal.Describe() + " of breed " + d.Breed
}

func main() {
	d := Dog{Animal: Animal{Name: "Rex"}, Breed: "Beagle"}
	fmt.Println(d.Name)
	fmt.Println(d.Describe())
	fmt.Println(d.Animal.Describe())
}
