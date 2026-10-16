package main

import (
	"fmt"
	"strings"
)

type IntList []int

func (l IntList) Sum() (s int) {
	for _, v := range l {
		s += v
	}
	return
}

func (l *IntList) Push(v int) { *l = append(*l, v) }

func (l IntList) String() string {
	parts := make([]string, len(l))
	for i, v := range l {
		parts[i] = fmt.Sprint(v)
	}
	return "<" + strings.Join(parts, "|") + ">"
}

type Counter map[string]int

func (c Counter) Inc(k string) { c[k]++ }

func main() {
	var l IntList
	l.Push(3)
	l.Push(4)
	l.Push(5)
	fmt.Println(l, l.Sum())

	c := Counter{}
	c.Inc("x")
	c.Inc("x")
	fmt.Println(c)
}
