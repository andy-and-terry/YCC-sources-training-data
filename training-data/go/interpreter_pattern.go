package main

import "fmt"

type expression interface {
	interpret() int
}

type number struct {
	value int
}

func (n number) interpret() int { return n.value }

type add struct {
	left, right expression
}

func (a add) interpret() int { return a.left.interpret() + a.right.interpret() }

type subtract struct {
	left, right expression
}

func (s subtract) interpret() int { return s.left.interpret() - s.right.interpret() }

func main() {
	// (5 + 3) - 2
	expr := subtract{
		left:  add{left: number{5}, right: number{3}},
		right: number{2},
	}
	fmt.Printf("result: %d\n", expr.interpret())
}
