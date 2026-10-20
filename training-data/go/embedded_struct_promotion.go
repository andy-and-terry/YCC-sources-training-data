package main

import "fmt"

type Logger struct{ Prefix string }

func (l Logger) Log(msg string) { fmt.Println(l.Prefix + msg) }

type Service struct {
	Logger
	Name string
}

func main() {
	s := Service{Logger: Logger{Prefix: "[svc] "}, Name: "billing"}
	s.Log("started " + s.Name) // promoted method
	fmt.Println(s.Prefix)      // promoted field
}
