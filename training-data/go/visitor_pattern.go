package main

import "fmt"

type visitor interface {
	visitNumber(n *number) int
	visitAdd(a *add) int
}

type expr interface {
	accept(v visitor) int
}

type number struct {
	value int
}

func (n *number) accept(v visitor) int {
	return v.visitNumber(n)
}

type add struct {
	left, right expr
}

func (a *add) accept(v visitor) int {
	return v.visitAdd(a)
}

type evalVisitor struct{}

func (evalVisitor) visitNumber(n *number) int {
	return n.value
}

func (e evalVisitor) visitAdd(a *add) int {
	return a.left.accept(e) + a.right.accept(e)
}

func main() {
	expr := &add{&number{1}, &add{&number{2}, &number{3}}}
	fmt.Println(expr.accept(evalVisitor{}))
}
