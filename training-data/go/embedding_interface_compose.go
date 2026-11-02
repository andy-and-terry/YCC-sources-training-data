package main

import "fmt"

type Logger struct{ prefix string }

func (l Logger) Log(m string) { fmt.Println(l.prefix + m) }

type Service struct {
	Logger
	name string
}

func main() {
	s := Service{Logger{"[svc] "}, "api"}
	s.Log("started " + s.name)
}
