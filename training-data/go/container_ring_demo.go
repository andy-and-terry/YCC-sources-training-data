package main

import (
	"container/ring"
	"fmt"
)

func main() {
	r := ring.New(5)
	for i := 0; i < r.Len(); i++ {
		r.Value = i
		r = r.Next()
	}
	r.Do(func(v any) { fmt.Print(v, " ") })
	fmt.Println()

	r = r.Move(2)
	r.Do(func(v any) { fmt.Print(v, " ") })
	fmt.Println()
}
