package main

import "fmt"

type Animal struct {
	Name string
}

func (a Animal) Describe() string { return "animal " + a.Name }
func (a Animal) Sound() string    { return "..." }

type Dog struct {
	Animal
	Breed string
}

// Dog overrides Sound but still promotes Describe from Animal.
func (d Dog) Sound() string { return "Woof" }

type Logger struct{ prefix string }

func (l *Logger) Log(msg string) { fmt.Println(l.prefix + msg) }

type Service struct {
	*Logger
	Name string
}

func main() {
	d := Dog{Animal: Animal{Name: "Rex"}, Breed: "Lab"}
	fmt.Println(d.Describe())
	fmt.Println(d.Sound(), "/", d.Animal.Sound())
	fmt.Println(d.Name)

	s := Service{Logger: &Logger{prefix: "[svc] "}, Name: "api"}
	s.Log("started " + s.Name)
}
