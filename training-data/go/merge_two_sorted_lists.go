package main

import (
	"container/list"
	"fmt"
)

// mergeLists merges two sorted container/list lists into a new one.
func mergeLists(a, b *list.List) *list.List {
	out := list.New()
	ea, eb := a.Front(), b.Front()
	for ea != nil && eb != nil {
		if ea.Value.(int) <= eb.Value.(int) {
			out.PushBack(ea.Value)
			ea = ea.Next()
		} else {
			out.PushBack(eb.Value)
			eb = eb.Next()
		}
	}
	for ; ea != nil; ea = ea.Next() {
		out.PushBack(ea.Value)
	}
	for ; eb != nil; eb = eb.Next() {
		out.PushBack(eb.Value)
	}
	return out
}

func fromSlice(xs ...int) *list.List {
	l := list.New()
	for _, x := range xs {
		l.PushBack(x)
	}
	return l
}

func main() {
	m := mergeLists(fromSlice(1, 2, 4, 9), fromSlice(1, 3, 4, 5, 10))
	for e := m.Front(); e != nil; e = e.Next() {
		fmt.Print(e.Value, " ")
	}
	fmt.Println()
}
