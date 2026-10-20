package main

import "fmt"

type Perm uint8

const (
	Read Perm = 1 << iota
	Write
	Exec
)

func (p Perm) Has(q Perm) bool { return p&q != 0 }

func main() {
	p := Read | Exec
	fmt.Println(p, p.Has(Write), p.Has(Exec))
}
