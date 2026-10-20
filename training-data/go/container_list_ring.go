package main

import (
	"container/list"
	"container/ring"
	"fmt"
)

func main() {
	l := list.New()
	l.PushBack(1)
	l.PushFront(0)
	for e := l.Front(); e != nil; e = e.Next() {
		fmt.Print(e.Value, " ")
	}
	r := ring.New(3)
	for i := 0; i < 3; i++ {
		r.Value = i
		r = r.Next()
	}
	r.Do(func(v any) { fmt.Print(v, ";") })
	fmt.Println()
}
